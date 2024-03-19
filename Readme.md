# Trajectory Planning for Robotic Manipulators

#### Introduction 

The project aims to implement trajectory planning algorithms on a robotic manipulator with certain dof with help of Matlab. We chose a readily available 6 DOF Kinova Gen-3 Lite Robot Manipulator.

**What is Trajectory planning?**
Trajectory planning is a motion law that defines time according to a given geometric path. Therefore, the purpose of trajectory planning is to meet the needs of the tasks and generate the reference inputs required by the control system, so that the robots can perform the movements

We defined the start and end points for the movement of robotic manipulator.Based on these inputs the designed algorithm gives a shortest as well as the safest path for the manipulator.On the results page we get the path traced by the manipulator in 3-D system as well as position of each joint with respect to time

#### Abstract

**Task Space VS Joint Space**
* **Task space** means the waypoints and interpolation are on the Cartesian pose (position and orientation) of a specific location on the manipulator – usually the end effector.
* **Joint space** means the waypoints and interpolation are directly on the joint positions (angles or displacements, depending on the type of joint)

**Types of Trajectories**
* **Trapezoidal Velocity-** TSpline - Splines are also piecewise combinations of polynomials; but unlike polynomial trajectories, which are polynomials in time (so one polynomial for each segment), splines are polynomials in space that can be used to create complex shapes.rapezoidal velocity trajectories are piecewise trajectories of constant acceleration, zero acceleration, and constant deceleration.
**Polynomial based-**
* **Cubic (3rd order) –** Requires 4 boundary conditions: position and velocity at both ends.
* **Quintic (5th order) –** Requires 6 boundary conditions: position, velocity, and acceleration at both ends.
* **Spline -** Splines are also piecewise combinations of polynomials; but unlike polynomial trajectories, which are polynomials in time (so one polynomial for each segment), splines are polynomials in space that can be used to create complex shapes.

### Research Topics

1. **Linear Algebra**: This area is pivotal for representing various aspects of physical systems and assessing their stability, making it a foundation for many applications in engineering and science.

2. **Control Systems**: A deep understanding of control systems is essential for managing and optimizing the behavior of dynamic systems, offering opportunities to enhance the performance of a wide range of applications, from robotics to industrial automation.

### List of Software Used
* [MATLAB & SIMULINK](https://in.mathworks.com/products/matlab.html) for modelling and simulation of Manipulator. 
## Manipulator Model
![Kinova Gen3-lite manipulator](/assets/Manipulator.png)

## Methodology

![Methodology](/assets/Methodology.png)

## Results
![Joint space Trajectory](/assets/Joint_space_Trajectory.jpeg)

![Task space Trajectory ](/assets/Task_space_Trajectory.jpeg)

![Comparison of both the Trajectories](/assets/Task_vs_Joint.jpeg)

![Joint reference vs Time for both the trajectories](/assets/Joint_position_vs_Time.png)
## **Future Work**

We plan to perform trajectory planning for higher degree of freedom manipulators.Implement the same in ROS and work on integrating controllers like PID and MPC.


## Contributors
-- [Shankari Anandakrishnan](https://github.com/Shankari02)

-- [Atharva Atre](https://github.com/AtharvaAtre)

## Acknowledgements
 A Special thanks to our Mentor
 
-- [Dr. Sammyak Mate](https://www.linkedin.com/in/dr-sammyak-mate-a7731543)
    Affiliation:Electrical Engineering Department,VJTI,Mumbai


## Resources
* [Matlab Onramp Playlist](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted)
* [Simulink Onramp Playlist](https://matlabacademy.mathworks.com/details/simulink-onramp/simulink)
* [Trajectory Planning on Matlab](https://in.mathworks.com/help/robotics/trajectory-generation.html)
* [Kinova Gen3-lite Robotic Manipulator](https://www.kinovarobotics.com/product/gen3-lite-robots)
