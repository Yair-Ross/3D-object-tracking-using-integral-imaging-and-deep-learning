%% Rectification by afine2D - calaulat tform objects and dist between cameras on plane
%% Isert images and cameraParams path
s1 = 'C:\Users\michael kadosh\Desktop\תואר שני\תזה\קטעי וידאו ותמונות מתוך המערכת\12.5.2022\calibration';

s2 = '\';
load(strcat(s1,s2,'cameraParams.mat'))
%% Isert destenation folder in path
s3 = 'RecWithAfine2D';
%% Insert AprilTag parameters
April_mm = 70; % width in mm
%% Finding tag location in the center camera
imagename = '2_4.jpg';
fullname = strcat(s1,s2,imagename);
I1 = rgb2gray(imread(fullname));
[id,loc] = readAprilTag(I1,"tag36h11");
X = loc; 
%% Calculate dist between cameras
AprilWidthPix = abs(X(3)-X(1));
CameraOffset_mm = 21.1;
CameraOffsetPixOnPlane = round((AprilWidthPix/April_mm)*CameraOffset_mm);
FrameSize =size(I1);
row = [0,1,2,3,4,5,6,0,1,2,3,4,5,6,0,1,2,3,4,5,6];
col = [0,0,0,0,0,0,0,1,1,1,1,1,1,1,2,2,2,2,2,2,2];
%% Undistorting Center Elemental Image (EI)
imagename = '2_4.jpg';
fullname = strcat(s1,s2,imagename);
I1 = imread(fullname);
imshow(I1)
I1 = undistortImage(I1,cameraParams{1,11});
CenterEI = rgb2gray(I1);
%% Rectify array with translations, save images and tform objects
ImagesNamesRead = ["1_1.jpg","1_2.jpg","1_3.jpg","1_4.jpg","1_5.jpg","1_6.jpg","1_7.jpg","2_1.jpg","2_2.jpg","2_3.jpg","2_4.jpg","2_5.jpg","2_6.jpg","2_7.jpg","3_1.jpg","3_2.jpg","3_3.jpg","3_4.jpg","3_5.jpg","3_6.jpg","3_7.jpg"];
ImagesNamesWrite = ["1_1rec.jpg","1_2rec.jpg","1_3rec.jpg","1_4rec.jpg","1_5rec.jpg","1_6rec.jpg","1_7rec.jpg","2_1rec.jpg","2_2rec.jpg","2_3rec.jpg","2_4rec.jpg","2_5rec.jpg","2_6rec.jpg","2_7rec.jpg","3_1rec.jpg","3_2rec.jpg","3_3rec.jpg","3_4rec.jpg","3_5rec.jpg","3_6rec.jpg","3_7rec.jpg"];
for i = 1:length(ImagesNamesRead)
    FullName = strcat(s1,s2,ImagesNamesRead(i));
    I1 = imread(FullName);
    I1 = undistortImage(I1,cameraParams{1,i});
    EI = rgb2gray(I1);
    %Find Matching Features Between Images
    %Detect features in both images.
    ptsCenterEI  = detectSURFFeatures(CenterEI);
    ptsEI = detectSURFFeatures(EI);
    % Extract feature descriptors.
    [featuresCenterEI,  validPtsCenterEI]  = extractFeatures(CenterEI,  ptsCenterEI);
    [featuresEI, validPtsEI] = extractFeatures(EI, ptsEI);
    % Match features by using their descriptors.
    indexPairs = matchFeatures(featuresCenterEI, featuresEI);
    % Retrieve locations of corresponding points for each image.
    matchedCenterEI  = validPtsCenterEI(indexPairs(:,1));
    matchedEI = validPtsEI(indexPairs(:,2));
    % Show putative point matches.
    showMatchedFeatures(CenterEI,EI,matchedCenterEI,matchedEI);
    title('Putatively matched points (including outliers)');
    %Estimate Transformation
    % Find a transformation corresponding to the matching point pairs using the
    % statistically robust M-estimator SAmple Consensus (MSAC) algorithm, which
    % is a variant of the RANSAC algorithm. It removes outliers while computing
    % the transformation matrix. You may see varying results of the
    % transformation computation because of the random sampling employed by the
    % MSAC algorithm.
    [tform, inlierEI, inlierCenterEI] = estimateGeometricTransform(...
        matchedEI, matchedCenterEI, 'similarity');
    % Display matching point pairs used in the computation of the transformation.
    showMatchedFeatures(CenterEI,EI,inlierCenterEI,inlierEI);
    title('Matching points (inliers only)');
    legend('ptsCenterEI','ptsEI');
    % Recover the CenterEI image by transforming the EI image.
    outputView = imref2d(size(CenterEI));
    recovered  = imwarp(EI,tform,'OutputView',outputView);
    tformObjects{1,i}=tform;
    figure, imshowpair(CenterEI,recovered,'montage')
    %write
    FinalRecWithTrans = imcrop(recovered,[CameraOffsetPixOnPlane*7-CameraOffsetPixOnPlane*row(i) CameraOffsetPixOnPlane*3-CameraOffsetPixOnPlane*col(i) FrameSize(2)-CameraOffsetPixOnPlane*7-100 FrameSize(1)-CameraOffsetPixOnPlane*3-100]);
    imshow(recovered);
    fullname2 = strcat(s1,s2,s3,s2,ImagesNamesWrite(i));
    imwrite(FinalRecWithTrans , fullname2)
end
save(strcat(s1,s2,'tform.mat'),'tformObjects')
save(strcat(s1,s2,'CameraOffsetPixOnPlane.mat'),'CameraOffsetPixOnPlane')
