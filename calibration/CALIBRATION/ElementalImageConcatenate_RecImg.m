%% creat elemental image
s1 = 'C:\Users\guy.samuels\OneDrive - Bright Machines\Desktop\elctro-optic\final pro\CalibrationForMichael\video_070122\rec';
s2 = '\';
%% horizontal concatenate line1

imagename1 = '1_1rec.jpg';
imagename2 = '1_2rec.jpg';
imagename3 = '1_3rec.jpg';
imagename4 = '1_4rec.jpg';
imagename5 = '1_5rec.jpg';
imagename6 = '1_6rec.jpg';
imagename7 = '1_7rec.jpg';

fullname1 = strcat(s1,s2,imagename1);
fullname2 = strcat(s1,s2,imagename2);
fullname3 = strcat(s1,s2,imagename3);
fullname4 = strcat(s1,s2,imagename4);
fullname5 = strcat(s1,s2,imagename5);
fullname6 = strcat(s1,s2,imagename6);
fullname7 = strcat(s1,s2,imagename7);

image1=double((imread(fullname1)));
image2=double((imread(fullname2)));
image3=double((imread(fullname3)));
image4=double((imread(fullname4)));
image5=double((imread(fullname5)));
image6=double((imread(fullname6)));
image7=double((imread(fullname7)));

%g=[image2,image1];
Line1=[image7,image6,image5,image4,image3,image2,image1];
%Line1=[image3,image2,image1];
%% horizontal concatenate line2
imagename1 = '2_1rec.jpg';
imagename2 = '2_2rec.jpg';
imagename3 = '2_3rec.jpg';
imagename4 = '2_4rec.jpg';
imagename5 = '2_5rec.jpg';
imagename6 = '2_6rec.jpg';
imagename7 = '2_7rec.jpg';

fullname1 = strcat(s1,s2,imagename1);
fullname2 = strcat(s1,s2,imagename2);
fullname3 = strcat(s1,s2,imagename3);
fullname4 = strcat(s1,s2,imagename4);
fullname5 = strcat(s1,s2,imagename5);
fullname6 = strcat(s1,s2,imagename6);
fullname7 = strcat(s1,s2,imagename7);

image1=double((imread(fullname1)));
image2=double((imread(fullname2)));
image3=double((imread(fullname3)));
image4=double((imread(fullname4)));
image5=double((imread(fullname5)));
image6=double((imread(fullname6)));
image7=double((imread(fullname7)));

Line2=[image7,image6,image5,image4,image3,image2,image1];
%Line2=[image3,image2,image1];
%% horizontal concatenate line3
imagename1 = '3_1rec.jpg';
imagename2 = '3_2rec.jpg';
imagename3 = '3_3rec.jpg';
imagename4 = '3_4rec.jpg';
imagename5 = '3_5rec.jpg';
imagename6 = '3_6rec.jpg';
imagename7 = '3_7rec.jpg';

fullname1 = strcat(s1,s2,imagename1);
fullname2 = strcat(s1,s2,imagename2);
fullname3 = strcat(s1,s2,imagename3);
fullname4 = strcat(s1,s2,imagename4);
fullname5 = strcat(s1,s2,imagename5);
fullname6 = strcat(s1,s2,imagename6);
fullname7 = strcat(s1,s2,imagename7);



image1=double((imread(fullname1)));
image2=double((imread(fullname2)));
image3=double((imread(fullname3)));
image4=double((imread(fullname4)));
image5=double((imread(fullname5)));
image6=double((imread(fullname6)));
image7=double((imread(fullname7)));

Line3=[image7,image6,image5,image4,image3,image2,image1];
%Line3=[image3,image2,image1];
%% vertical line 1,2,3
g=[Line3;Line2;Line1];

hold on
figure, imagesc(g),colormap gray, axis off

%imagename = 'concat.jpg';
%fullname2 = strcat(s1,s2,imagename);
%g = uint8(g);
%imwrite(g , fullname2);