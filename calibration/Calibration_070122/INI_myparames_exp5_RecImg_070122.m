%% GEOMETRIC PARAMETERS
zmin=200; %MIN DOF
zmax=2000;%MAX DOF
lensx=3; % number of cameras in col
lensy=7; % number of cameras in line
deltax=21;
deltay=21;
PixelSize=0.01; 
zg=5; %focal = 5mm -  or di magnification=di/do or m=f/z 
th=0.99; % THE THRESHOLGING RATIO
fx=1226;
fy=590;

h = fspecial('gaussian', 3,1);


%% PERFORMEND ELEMENTAL IMAGE
EI=g(1:fx,1:fy); % THE FIRST ELEMENTAL IMAGE
figure, imagesc(EI),colormap gray, axis off
title(['ELELMENTAL IMAGE']);
EIdet=zeros(fx,fy);


%% AUTO-FOCUS ALGORITHM (depth graph)
[Results] = AGMR(g,zg,lensx,lensy,zmin,zmax,EI,deltax,deltay,PixelSize,fx,fy,h );

z=Results(1,3).DepthGraph; %A=[700,853], B=[619,752], C=[546,614]
%% RECONSTRUCTED IMAGES

 Results  = ReconstructedImage(z,g,EI,deltax,deltay,lensx,lensy,PixelSize,zg,fx,fy,h );

%% ISOLATED IMAGES
   ysamResults  = IsolatedImage( th,Results,z,fx,fy,deltax,deltay,lensx,lensy,PixelSize,zg,EI );
 
%% REMOVE FALSE EDGES
 Results  = RemovalFalseEdges( z,lensx,deltax,PixelSize,zg,Results,fx,fy );
 
%% UNITED DEPTH
 [ Results , Znew] = UnitedDepth( z,Results );
 
%% BOUNDING-BOX CREATING
 [ Results ] = CreatingBoundingBox( Znew,Results,fx,fy );
 
 % ENREACHING PROCESS
[ Results ] = EnreachingProcess( Znew,Results );
 % %% 3D OBJECTS DETECTION ALGORITHM