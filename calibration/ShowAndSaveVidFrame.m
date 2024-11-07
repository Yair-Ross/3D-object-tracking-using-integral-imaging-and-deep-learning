%% Show and save 1 frame for calibration process
%% insert video files path
s1 = 'C:\Users\yair1\Desktop\CE final project\calibrarion_test\test1';
s2 = 'C:\Users\yair1\Desktop\CE final project\calibrarion_test\test1_res';

vidObj1_1 = VideoReader(strcat(s1,s2,'CAM_1_1.avi'));
vidObj1_2 = VideoReader(strcat(s1,s2,'CAM_1_2.avi'));
vidObj1_3 = VideoReader(strcat(s1,s2,'CAM_1_3.avi'));
vidObj1_4 = VideoReader(strcat(s1,s2,'CAM_1_4.avi'));
vidObj1_5 = VideoReader(strcat(s1,s2,'CAM_1_5.avi'));
vidObj1_6 = VideoReader(strcat(s1,s2,'CAM_1_6.avi'));
%vidObj1_7 = VideoReader(strcat(s1,s2,'CAM_1_7.avi'));

vidObj2_1 = VideoReader(strcat(s1,s2,'CAM_2_1.avi'));
vidObj2_2 = VideoReader(strcat(s1,s2,'CAM_2_2.avi'));
vidObj2_3 = VideoReader(strcat(s1,s2,'CAM_2_3.avi'));
vidObj2_4 = VideoReader(strcat(s1,s2,'CAM_2_4.avi'));
vidObj2_5 = VideoReader(strcat(s1,s2,'CAM_2_5.avi'));
vidObj2_6 = VideoReader(strcat(s1,s2,'CAM_2_6.avi'));
vidObj2_7 = VideoReader(strcat(s1,s2,'CAM_2_7.avi'));

vidObj3_1 = VideoReader(strcat(s1,s2,'CAM_3_1.avi'));
vidObj3_2 = VideoReader(strcat(s1,s2,'CAM_3_2.avi'));
vidObj3_3 = VideoReader(strcat(s1,s2,'CAM_3_3.avi'));
vidObj3_4 = VideoReader(strcat(s1,s2,'CAM_3_4.avi'));
vidObj3_5 = VideoReader(strcat(s1,s2,'CAM_3_5.avi'));
vidObj3_6 = VideoReader(strcat(s1,s2,'CAM_3_6.avi'));
vidObj3_7 = VideoReader(strcat(s1,s2,'CAM_3_7.avi'));

frame1_1 = read(vidObj1_1,3);
frame1_2 = read(vidObj1_2,3);
frame1_3 = read(vidObj1_3,3);
frame1_4 = read(vidObj1_4,3);
frame1_5 = read(vidObj1_5,3);
frame1_6 = read(vidObj1_6,3);
%frame1_7 = read(vidObj1_7,3);


frame2_1 = read(vidObj2_1,3);
frame2_2 = read(vidObj2_2,3);
frame2_3 = read(vidObj2_3,3);
frame2_4 = read(vidObj2_4,3);
frame2_5 = read(vidObj2_5,3);
frame2_6 = read(vidObj2_6,3);
frame2_7 = read(vidObj2_7,3);

frame3_1 = read(vidObj3_1,3);
frame3_2 = read(vidObj3_2,3);
frame3_3 = read(vidObj3_3,3);
frame3_4 = read(vidObj3_4,3);
frame3_5 = read(vidObj3_5,3);
frame3_6 = read(vidObj3_6,3);
frame3_7 = read(vidObj3_7,3);



%% Run to save 1 frame

imagename = '1_1.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame1_1;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '1_2.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame1_2;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '1_3.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame1_3;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '1_4.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame1_4;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '1_5.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame1_5;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '1_6.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame1_6;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

%imagename = '1_7.jpg';
%fullname2 = strcat(s1,s2,imagename);
%I1 = frame1_7;
%I1 = imrotate(I1,90);
%imwrite(I1 , fullname2);

imagename = '2_1.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame2_1;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '2_2.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame2_2;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '2_3.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame2_3;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '2_4.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame2_4;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '2_5.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame2_5;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '2_6.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame2_6;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '2_7.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame2_7;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '3_1.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame3_1;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '3_2.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame3_2;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '3_3.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame3_3;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '3_4.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame3_4;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '3_5.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame3_5;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '3_6.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame3_6;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);

imagename = '3_7.jpg';
fullname2 = strcat(s1,s2,imagename);
I1 = frame3_7;
I1 = imrotate(I1,90);
imwrite(I1 , fullname2);