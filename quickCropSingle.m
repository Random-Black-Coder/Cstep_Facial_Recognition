A = imread('C:\FaceRecognition\TestPics\testPic11.jpg');

FaceDetector = vision.CascadeObjectDetector('MinSize',[150,150]);
    
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

imwrite(img,'C:\FaceRecognition\TestPics\testPic11.jpg');


