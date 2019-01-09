%% -----Classifier Trainer-----
% Author: Yahkeef Davis    
% Date: 7/6/17
% Description: Extracts hog features from training images, trains a classifier and saves it.
% 
%% -----Script Start--- %%

%   load in database.
    faceDatabase = imageSet('C:\FaceRecognition\FaceGalleryFiles','recursive');
    training = faceDatabase;

%   count the length of features extracted    
    numcolsHOG = size(extractHOGFeatures(read(training(1),1)));
    
%   create variable to hold the hog value of training images    
    trainingFeaturesHOG = zeros(size(training,2)*training(1).Count,numcolsHOG(1,2));

%   ---- Extracts and labels the features of training images ----    
    featureCount = 1;
    for i=1:size(training,2)
        for j = 1:training(i).Count
            
            %extracts hog features from training image
            trainingFeaturesHOG(featureCount,:) = extractHOGFeatures(read(training(i),j));
            
            %applies a label(name) to corresponding feature extraction
            trainingLabelHOG{featureCount} = training(i).Description;
            
            %increments feature count by 1
            featureCount = featureCount + 1;
        end
        
        %creates an index of each person along with their hog value
        personIndexHOG{i} = training(i).Description;
        
        %displays that index
        display(strcat('personIndexHOG{i}:',num2str(i),'---',num2str(personIndexHOG{i})));
    end

%Creates featureCount class classifier using fitcecoc
faceClassifierHOG = fitcecoc(trainingFeaturesHOG,trainingLabelHOG);

%save training model
saveCompactModel(faceClassifierHOG,'classifierModel2');

%save training size
save('vTrainingSize.mat','training');

%save person index
save('vPersonIndex.mat','personIndexHOG');





