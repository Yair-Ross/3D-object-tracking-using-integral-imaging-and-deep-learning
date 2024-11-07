%% Read uncalibrated video file and write video file after rectification
%  Preprocessing the camera array frames - Rotate 90 deg left and resize to the same frame size [3648 2736] 
%  Undistorted the camera array frames with CameraParameters object
%  Rectify the array with the tform object
%  Crop the frames to the same frame size [540 1160]
%% insert videos file path 
s1 = 'C:\Users\michael kadosh\Desktop\תואר שני\תזה\קטעי וידאו ותמונות מתוך המערכת\12.5.2022\test';
s2 = '\';
%% rectify Cam1_1 video file 
%rectify Cam1_1 video file to load
VidName = 'CAM_1_1.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_1_1.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams1_1);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform1_1,'OutputView',outputView);
    recFrame = imcrop(recFrame,[126 54 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam1_2 video file 
%rectify Cam1_2 video file to load
VidName = 'CAM_1_2.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_1_2.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams1_2);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform1_2,'OutputView',outputView);
    recFrame = imcrop(recFrame,[108 54 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam1_3 video file 
%rectify Cam1_3 video file to load
VidName = 'CAM_1_3.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_1_3.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams1_3);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform1_3,'OutputView',outputView);
    recFrame = imcrop(recFrame,[90 54 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam1_4 video file 
%rectify Cam1_4 video file to load
VidName = 'CAM_1_4.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_1_4.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams1_4);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform1_4,'OutputView',outputView);
    recFrame = imcrop(recFrame,[72 54 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam1_5 video file 
%rectify Cam1_5 video file to load
VidName = 'CAM_1_5.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_1_5.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams1_5);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform1_5,'OutputView',outputView);
    recFrame = imcrop(recFrame,[54 54 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam1_6 video file 
%rectify Cam1_6 video file to load
VidName = 'CAM_1_6.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_1_6.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams1_6);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform1_6,'OutputView',outputView);
    recFrame = imcrop(recFrame,[36 54 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam1_7 video file 
%rectify Cam1_7 video file to load
VidName = 'CAM_1_7.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_1_7.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams1_7);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform1_7,'OutputView',outputView);
    recFrame = imcrop(recFrame,[18 54 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam2_1 video file 
%rectify Cam2_1 video file to load
VidName = 'CAM_2_1.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_2_1.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams2_1);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform2_1,'OutputView',outputView);
    recFrame = imcrop(recFrame,[126 36 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam2_2 video file 
%rectify Cam2_2 video file to load
VidName = 'CAM_2_2.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_2_2.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams2_2);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform2_2,'OutputView',outputView);
    recFrame = imcrop(recFrame,[108 36 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam2_3 video file 
%rectify Cam2_3 video file to load
VidName = 'CAM_2_3.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_2_3.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams2_3);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform2_3,'OutputView',outputView);
    recFrame = imcrop(recFrame,[90 36 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam2_4 video file 
%rectify Cam2_4 video file to load
VidName = 'CAM_2_4.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_2_4.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams2_4);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform2_4,'OutputView',outputView);
    recFrame = imcrop(recFrame,[72 36 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam2_5 video file 
%rectify Cam2_5 video file to load
VidName = 'CAM_2_5.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_2_5.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams2_5);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform2_5,'OutputView',outputView);
    recFrame = imcrop(recFrame,[54 36 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam2_6 video file 
%rectify Cam2_6 video file to load
VidName = 'CAM_2_6.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_2_6.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams2_6);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform2_6,'OutputView',outputView);
    recFrame = imcrop(recFrame,[36 36 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam2_7 video file 
%rectify Cam2_7 video file to load
VidName = 'CAM_2_7.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_2_7.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams2_7);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform2_7,'OutputView',outputView);
    recFrame = imcrop(recFrame,[18 36 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam3_1 video file 
%rectify Cam3_1 video file to load
VidName = 'CAM_3_1.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_3_1.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams3_1);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform3_1,'OutputView',outputView);
    recFrame = imcrop(recFrame,[126 18 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam3_2 video file 
%rectify Cam3_2 video file to load
VidName = 'CAM_3_2.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_3_2.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams3_2);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform3_2,'OutputView',outputView);
    recFrame = imcrop(recFrame,[108 18 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam3_3 video file 
%rectify Cam3_3 video file to load
VidName = 'CAM_3_3.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_3_3.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams3_3);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform3_3,'OutputView',outputView);
    recFrame = imcrop(recFrame,[90 18 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam3_4 video file 
%rectify Cam3_4 video file to load
VidName = 'CAM_3_4.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_3_4.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams3_4);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform3_4,'OutputView',outputView);
    recFrame = imcrop(recFrame,[72 18 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam3_5 video file 
%rectify Cam3_5 video file to load
VidName = 'CAM_3_5.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_3_5.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams3_5);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform3_5,'OutputView',outputView);
    recFrame = imcrop(recFrame,[54 18 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam3_6 video file 
%rectify Cam3_6 video file to load
VidName = 'CAM_3_6.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_3_6.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams3_6);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform3_6,'OutputView',outputView);
    recFrame = imcrop(recFrame,[36 18 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)
%% rectify Cam3_7 video file 
%rectify Cam3_7 video file to load
VidName = 'CAM_3_7.avi';
fullname = strcat(s1,s2,VidName);
obj = VideoReader(fullname);
%rectify video file name to save
RecVidName = 'RecCam_3_7.avi';
fullVidName = strcat(s1,s2,RecVidName);
v = VideoWriter(fullVidName);
open(v);
%rectify Video Frames 
while(hasFrame(obj))
    frame = imrotate(readFrame(obj),90);
    undistFrame = undistortImage(frame,cameraParams3_7);
    outputView = imref2d(size(undistFrame));
    recFrame = imwarp(undistFrame,tform3_7,'OutputView',outputView);
    recFrame = imcrop(recFrame,[18 18 589 1225]);
    imshow(recFrame);
    %write the rectify video file
    writeVideo(v,recFrame);
end
close(v)