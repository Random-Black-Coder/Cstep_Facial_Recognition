photos = imageSet('C:\FaceRecognition\pictures8\Mustafa','recursive');

FaceDetector = vision.CascadeObjectDetector('MinSize',[150,150]);

%%file = char('C:\FaceRecognition\pictures\Jay\');

%fileEnd = char('.jpg');

for i = 1:8

%%fileMiddle = char(i);
%%spot = fullfile(file,fileMiddle,fileEnd);

A = read(photos,i);    
    
BBOX = step(FaceDetector, A);

B = insertObjectAnnotation(A, 'rectangle', BBOX, 'face');

figure;
imshow(B),

n = size(BBOX, 1);
str_n = num2str(n);
str = strcat('Number of detected faces are: ', str_n);
disp(str);


figure;
img = imcrop(A,BBOX);
img = imresize(img,[480,480]);
imshow(img);

img = rgb2gray(img);

if i==1
    imwrite(img,'C:\FaceRecognition\pictures8\Mustafa\1.jpg');
elseif i==2
    imwrite(img,'C:\FaceRecognition\pictures8\Mustafa\2.jpg');  
elseif i==3
    imwrite(img,'C:\FaceRecognition\pictures8\Mustafa\3.jpg');
elseif i==4
    imwrite(img,'C:\FaceRecognition\pictures8\Mustafa\4.jpg');  
elseif i==5
    imwrite(img,'C:\FaceRecognition\pictures8\Mustafa\5.jpg');
elseif i==6
    imwrite(img,'C:\FaceRecognition\pictures8\Mustafa\6.jpg');  
elseif i==7
    imwrite(img,'C:\FaceRecognition\pictures8\Mustafa\7.jpg');
elseif i==8
    imwrite(img,'C:\FaceRecognition\pictures8\Mustafa\8.jpg');    
end
end

