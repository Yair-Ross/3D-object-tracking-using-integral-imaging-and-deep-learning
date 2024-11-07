%% Calibrated video writer 
%% insert videos file path 
s1 = 'C:\Users\michael kadosh\Desktop\תואר שני\תזה\קטעי וידאו ותמונות מתוך המערכת\23.12.21\VIDEO';
s2 = '\';
%Load Cam1_1 video file 
VidName = 'RecCam_1_1.avi';
fullname = strcat(s1,s2,VidName);
RecCam_1_1 = VideoReader(fullname);
%Load Cam1_2 video file 
VidName = 'RecCam_1_2.avi';
fullname = strcat(s1,s2,VidName);
RecCam_1_2 = VideoReader(fullname);
%Load Cam1_3 video file 
VidName = 'RecCam_1_3.avi';
fullname = strcat(s1,s2,VidName);
RecCam_1_3 = VideoReader(fullname);
%Load Cam1_4 video file 
VidName = 'RecCam_1_4.avi';
fullname = strcat(s1,s2,VidName);
RecCam_1_4 = VideoReader(fullname);
%Load Cam1_5 video file 
VidName = 'RecCam_1_5.avi';
fullname = strcat(s1,s2,VidName);
RecCam_1_5 = VideoReader(fullname);
%Load Cam1_6 video file 
VidName = 'RecCam_1_6.avi';
fullname = strcat(s1,s2,VidName);
RecCam_1_6 = VideoReader(fullname);
%Load Cam1_7 video file 
VidName = 'RecCam_1_7.avi';
fullname = strcat(s1,s2,VidName);
RecCam_1_7 = VideoReader(fullname);
%Load Cam2_1 video file 
VidName = 'RecCam_2_1.avi';
fullname = strcat(s1,s2,VidName);
RecCam_2_1 = VideoReader(fullname);
%Load Cam2_2 video file 
VidName = 'RecCam_2_2.avi';
fullname = strcat(s1,s2,VidName);
RecCam_2_2 = VideoReader(fullname);
%Load Cam2_3 video file 
VidName = 'RecCam_2_3.avi';
fullname = strcat(s1,s2,VidName);
RecCam_2_3 = VideoReader(fullname);
%Load Cam2_4 video file 
VidName = 'RecCam_2_4.avi';
fullname = strcat(s1,s2,VidName);
RecCam_2_4 = VideoReader(fullname);
%Load Cam2_5 video file 
VidName = 'RecCam_2_5.avi';
fullname = strcat(s1,s2,VidName);
RecCam_2_5 = VideoReader(fullname);
%Load Cam2_6 video file 
VidName = 'RecCam_2_6.avi';
fullname = strcat(s1,s2,VidName);
RecCam_2_6 = VideoReader(fullname);
%Load Cam2_7 video file 
VidName = 'RecCam_2_7.avi';
fullname = strcat(s1,s2,VidName);
RecCam_2_7 = VideoReader(fullname);
%Load Cam3_1 video file 
VidName = 'RecCam_3_1.avi';
fullname = strcat(s1,s2,VidName);
RecCam_3_1 = VideoReader(fullname);
%Load Cam3_2 video file 
VidName = 'RecCam_3_2.avi';
fullname = strcat(s1,s2,VidName);
RecCam_3_2 = VideoReader(fullname);
%Load Cam3_3 video file 
VidName = 'RecCam_3_3.avi';
fullname = strcat(s1,s2,VidName);
RecCam_3_3 = VideoReader(fullname);
%Load Cam3_4 video file 
VidName = 'RecCam_3_4.avi';
fullname = strcat(s1,s2,VidName);
RecCam_3_4 = VideoReader(fullname);
%Load Cam3_5 video file 
VidName = 'RecCam_3_5.avi';
fullname = strcat(s1,s2,VidName);
RecCam_3_5 = VideoReader(fullname);
%Load Cam3_6 video file 
VidName = 'RecCam_3_6.avi';
fullname = strcat(s1,s2,VidName);
RecCam_3_6 = VideoReader(fullname);
%Load Cam3_7 video file 
VidName = 'RecCam_3_7.avi';
fullname = strcat(s1,s2,VidName);
RecCam_3_7 = VideoReader(fullname);
%% Concat file name to save
RecVidName = 'Concat3.avi';
fullVidName = strcat(s1,s2,RecVidName);
%% Concat video frames 
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
    %concat =[rec1_7,rec1_6,rec1_5,rec1_4,rec1_3,rec1_2,rec1_1;rec2_7,rec2_6,rec2_5,rec2_4,rec2_3,rec2_2,rec2_1;rec3_7,rec3_6,rec3_5,rec3_4,rec3_3,rec3_2,rec3_1];
    concat =[rec3_7,rec3_6,rec3_5,rec3_4,rec3_3,rec3_2,rec3_1;rec2_7,rec2_6,rec2_5,rec2_4,rec2_3,rec2_2,rec2_1;rec1_7,rec1_6,rec1_5,rec1_4,rec1_3,rec1_2,rec1_1];
    imshow(concat);
    %write the rectify video file
    writeVideo(v,concat);
end
close(v)