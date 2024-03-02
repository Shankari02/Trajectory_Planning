clc,clear,close all
%���ػ�����ģ��
robot = loadrobot('kinovaGen3','DataFormat','row','Gravity',[0 0 -9.81]);
currentRobotJConfig = homeConfiguration(robot);%�����˹ؽ�����

% 7 joints
numJoints = numel(currentRobotJConfig);%�����˹ؽ�����
endEffector = 'EndEffector_Link';

timeStep = 0.1; % ����
toolSpeed = 0.1; % �ٶ�

jointInit = currentRobotJConfig;
taskInit = getTransform(robot,jointInit,endEffector);%��ʼ
% axang2tform homogeneous transform��α任
% ��y����ת180
% taskFinal = trvec2tform([1.3,0.4,0.9])*axang2tform([0 1 0 pi]);%ĩ��
% taskFinal = trvec2tform([0.4,-0.4,0.6]);
taskFinal = trvec2tform([1.3,0.4,0.9]);

%Task-Space Trajectory
distance= norm(tform2trvec(taskInit)-tform2trvec(taskFinal));%����

% set time
initTime = 0;
finalTime = (distance/toolSpeed) - initTime;
trajTimes = initTime:timeStep:finalTime;
timeInterval = [trajTimes(1); trajTimes(end)];

% Algorithm two
%joint space
ik = inverseKinematics('RigidBodyTree',robot);
ik.SolverParameters.AllowRandomRestart = false;
weights = [1 1 1 1 1 1];
%�˶�ѧ���
initialGuess = wrapToPi(jointInit);
jointFinal = ik(endEffector,taskFinal,weights,initialGuess);
jointFinal = wrapToPi(jointFinal);
%��ֵ
ctrlpoints = [jointInit',jointFinal'];
jointConfigArray = cubicpolytraj(ctrlpoints,timeInterval,trajTimes);
jointWaypoints = bsplinepolytraj(jointConfigArray,timeInterval,1);

jsMotionModel = jointSpaceMotionModel('RigidBodyTree',robot,'MotionType','PDControl');
q0 = currentRobotJConfig;
qd0 = zeros(size(q0));
%ģ��������˶�
[tJoint,stateJoint] = ode15s(@(t,state) exampleHelperTimeBasedJointInputs(jsMotionModel,timeInterval,jointConfigArray,t,state),timeInterval,[q0; qd0]);


%��ʼ״̬
show(robot,currentRobotJConfig,'PreservePlot',false,'Frames','off');
hold on
axis([-1 1 -1 1 -0.1 1.5]);
%����ռ��˶�
for i=1:length(trajTimes)
    % Current time
    tNow= trajTimes(i);
    % Interpolate simulated joint positions to get configuration at current time
    configNow = interp1(tJoint,stateJoint(:,1:numJoints),tNow);% Algorithm two
    poseNow = getTransform(robot,configNow,endEffector);
    show(robot,configNow,'PreservePlot',false,'Frames','off');
    plot3(poseNow(1,4),poseNow(2,4),poseNow(3,4),'b.','MarkerSize',20)
    drawnow;
end


figure(2);
grid on;
plot(tJoint,stateJoint(:,1:numJoints));
hold all;
plot(tJoint(1:numJoints),stateJoint(1:numJoints),'--');
title('Joint Position vs Reference ');
xlabel('Time (s)')
ylabel('Position (rad)');

