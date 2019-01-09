%% ----THE HEART---- %%

%Load Image Information from ATT Face Database Directory -- possibly not needed...
faceDatabase = imageSet('C:\FaceRecognition\FaceFiles\BM','recursive');

%Display # of ppl in database
disp('# of people: ');
disp(size(faceDatabase,2));
numpeople=size(faceDatabase,2);

%Extract HOG Features for training set and find length of extracted features, all images should be same (possibly something that can also be put into the identify function)
[training,trainingFeaturesHOG,trainingLabelHOG,personIndexHOG,faceClassifierHOG] = extractTrainingFeatures(faceDatabase);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\1.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\2.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\3.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\4.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\5.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\6.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\7.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\8.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\9.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\10.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\11.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\12.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\13.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\14.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\15.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\16.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\17.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\18.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\19.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\20.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\21.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\22.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\23.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\24.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\25.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);


