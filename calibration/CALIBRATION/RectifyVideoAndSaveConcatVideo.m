 %% Read uncalibrated video files and write video files after rectification
%  Preprocessing the camera array frames - Rotate 90 deg left and resize to the same frame size [3648 2736] 
%  Undistorted the camera array frames with CameraParameters object
%  Rectify the array with the tform object
%  Crop the frames to the same frame size by calculated dist between cameras
%% Insert C:\Users\michael kadosh\Desktop\תואר שני\תזה\קטעי וידאו ותמונות מתוך המערכת\12.5.2022\car and airplane_2videos files path 
s1 = 'C:\Users\michael kadosh\Desktop\Trak and car\S_3';
s2 = '\';
%% Insert calibration files path
s3 = 'C:\Users\michael kadosh\Desktop\תואר שני\תזה\קטעי וידאו ותמונות מתוך המערכת\12.5.2022\calibration';
load(strcat(s3,s2,'cameraParams.mat'))
load(strcat(s3,s2,'tform.mat'))
load(strcat(s3,s2,'CameraOffsetPixOnPlane.mat'))
%% Finding tag location in the center camera
vidObj2_4 = VideoReader(strcat(s1,s2,'CAM_2_4.avi'));
I1 = read(vidObj2_4,3);
I1 = imrotate(I1,90);
FrameSize =size(I1);
row = [0,1,2,3,4,5,6,0,1,2,3,4,5,6,0,1,2,3,4,5,6];
col = [0,0,0,0,0,0,0,1,1,1,1,1,1,1,2,2,2,2,2,2,2];
%% Rectify video files 
ImagesNamesRead = ["CAM_1_1.avi","CAM_1_2.avi","CAM_1_3.avi","CAM_1_4.avi","CAM_1_5.avi","CAM_1_6.avi","CAM_1_7.avi","CAM_2_1.avi","CAM_2_2.avi","CAM_2_3.avi","CAM_2_4.avi","CAM_2_5.avi","CAM_2_6.avi","CAM_2_7.avi","CAM_3_1.avi","CAM_3_2.avi","CAM_3_3.avi","CAM_3_4.avi","CAM_3_5.avi","CAM_3_6.avi","CAM_3_7.avi"];
ImagesNamesWrite = ["RecCam_1_1.avi","RecCam_1_2.avi","RecCam_1_3.avi","RecCam_1_4.avi","RecCam_1_5.avi","RecCam_1_6.avi","RecCam_1_7.avi","RecCam_2_1.avi","RecCam_2_2.avi","RecCam_2_3.avi","RecCam_2_4.avi","RecCam_2_5.avi","RecCam_2_6.avi","RecCam_2_7.avi","RecCam_3_1.avi","RecCam_3_2.avi","RecCam_3_3.avi","RecCam_3_4.avi","RecCam_3_5.avi","RecCam_3_6.avi","RecCam_3_7.avi"];
for i = 1:length(ImagesNamesRead)
    FullName = strcat(s1,s2,ImagesNamesRead(i));
    obj = VideoReader(FullName);
    fullVidName = strcat(s1,s2,ImagesNamesWrite(i));
    v = VideoWriter(fullVidName);
    open(v); 
    %rectify Video Frames 
    frames = obj.NumFrames;
    %rectify Video Frames 
    while(hasFrame(obj))
        frame = imrotate(readFrame(obj),90);
        undistFrame = undistortImage(frame,cameraParams{1,i});
        outputView = imref2d(size(undistFrame));
        recFrame = imwarp(undistFrame,tformObjects{1,i},'OutputView',outputView);
        recFrame = imcrop(recFrame,[CameraOffsetPixOnPlane*7-CameraOffsetPixOnPlane*row(i) CameraOffsetPixOnPlane*3-CameraOffsetPixOnPlane*col(i) FrameSize(2)-CameraOffsetPixOnPlane*7-100 FrameSize(1)-CameraOffsetPixOnPlane*3-100]);
        imshow(recFrame);
        %write the rectify video file
         writeVideo(v,recFrame);
       
    end
    close(v)
end
%% Concat rectified videos and save
RecCam_1_1 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,1))); 
RecCam_1_2 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,2)));
RecCam_1_3 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,3)));
RecCam_1_4 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,4)));
RecCam_1_5 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,5)));
RecCam_1_6 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,6)));
RecCam_1_7 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,7)));
RecCam_2_1 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,8)));
RecCam_2_2 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,9)));
RecCam_2_3 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,10)));
RecCam_2_4 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,11))); 
RecCam_2_5 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,12)));
RecCam_2_6 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,13)));
RecCam_2_7 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,14)));
RecCam_3_1 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,15)));
RecCam_3_2 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,16)));
RecCam_3_3 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,17)));
RecCam_3_4 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,18)));
RecCam_3_5 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,19)));
RecCam_3_6 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,20)));
RecCam_3_7 = VideoReader(strcat(s1,s2,ImagesNamesWrite(1,21)));
%concat file name to be saved
RecVidName = 'Concat.avi';
fullVidName = strcat(s1,s2,RecVidName);
%concat video frames 
v = VideoWriter(fullVidName);
open(v);
while(hasFrame(RecCam_1_1))
    rec1_1 = readFrame(RecCam_1_1);
    rec1_2 = readFrame(RecCam_1_2);
    rec1_3 = readFrame(RecCam_1_3);
    rec1_4 = readFrame(RecCam_1_4);
    rec1_5 = readFrame(RecCam_1_5);
    rec1_6 = readFrame(RecCam_1_6);
    rec1_7 = readFrame(RecCam_1_7);
    rec2_1 = readFrame(RecCam_2_1);
    rec2_2 = readFrame(RecCam_2_2);
    rec2_3 = readFrame(RecCam_2_3);
    rec2_4 = readFrame(RecCam_2_4);
    rec2_5 = readFrame(RecCam_2_5);
    rec2_6 = readFrame(RecCam_2_6);
    rec2_7 = readFrame(RecCam_2_7);
    rec3_1 = readFrame(RecCam_3_1);
    rec3_2 = readFrame(RecCam_3_2);
    rec3_3 = readFrame(RecCam_3_3);
    rec3_4 = readFrame(RecCam_3_4);
    rec3_5 = readFrame(RecCam_3_5);
    rec3_6 = readFrame(RecCam_3_6);
    rec3_7 = readFrame(RecCam_3_7);
    concat =[rec3_7,rec3_6,rec3_5,rec3_4,rec3_3,rec3_2,rec3_1;rec2_7,rec2_6,rec2_5,rec2_4,rec2_3,rec2_2,rec2_1;rec1_7,rec1_6,rec1_5,rec1_4,rec1_3,rec1_2,rec1_1];
    imshow(concat);
    %write the rectify video file
    writeVideo(v,concat);
end
close(v)


