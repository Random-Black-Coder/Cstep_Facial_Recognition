%% ----THE HEART---- %%

%Load Image Information from ATT Face Database Directory -- possibly not needed...
faceDatabase = imageSet('C:\FaceRecognition\FaceFiles\WM','recursive');

%Display # of ppl in database
disp('# of people: ');
disp(size(faceDatabase,2));
numpeople=size(faceDatabase,2);

%Extract HOG Features for training set and find length of extracted features, all images should be same (possibly something that can also be put into the identify function)
[training,trainingFeaturesHOG,trainingLabelHOG,personIndexHOG,faceClassifierHOG] = extractTrainingFeatures(faceDatabase);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\1.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\2.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\3.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\4.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\5.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\6.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\7.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\8.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\9.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\10.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\11.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\12.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\13.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\14.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\15.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\16.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\17.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\18.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\19.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\20.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\21.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\22.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\BMT\23.jpg');
%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\24.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

%store img
queryImg = imread('C:\FaceRecognition\FaceFiles\WMT\25.jpg');

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,faceClassifierHOG,queryImg);

