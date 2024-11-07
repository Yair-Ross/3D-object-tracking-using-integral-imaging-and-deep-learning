# 3D object tracking using integral imaging and deep learning
## BY: YAIR ROSS
##     MOSHE SHMILOVICH
#------------------------------------------------------------------------------

In this project we will use a camera matrix (3X7 cameras) located in the
laboratory and we will take short video clips of a limited number of seconds in
which you see a single object or several objects moving in space.
The cameras are simple, medium quality cameras that each shoot the video from
a slightly different angle.
Our goal is to build a system that receives a short video clip of the camera array
and will know how to identify all the objects through segmentation, identify their
distance using an approach based on computational integral imaging, mark them
all and track these objects. That is, once the system has identified an object in the
video, it will have to identify the same object during the following frames and
mark it as the same object. This is done by a tracking algorithm that will be
implemented during the project.
We will focus on expanding the already existing system of identifying objects
distances to be able to track those objects using the information of the distances
and different properties of those objects using an algorithm which we design.

![image](https://github.com/user-attachments/assets/1a541334-6097-4cf0-b9f4-6e874c764894)

![image](https://github.com/user-attachments/assets/8311aedc-1067-43ff-8b3e-2e1638249ee0)

![image](https://github.com/user-attachments/assets/6da6a7e6-1b95-43db-b976-59607a1bfc49)

![image](https://github.com/user-attachments/assets/0a680302-0640-459e-a025-aca14efb5956)

![image](https://github.com/user-attachments/assets/10aad373-db9d-431f-980d-b7988c0737d9)



