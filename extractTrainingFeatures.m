%% -----extractTrainingFeatures function-----
% Author: Yahkeef Davis    
% Date: 6/20/17
% Description: Splits the database, extracts hog features of training
% images, assigns the labels(names), and places them in an index.
% 
%% -----Function Start--- %%
function [training,trainingFeaturesHOG,trainingLabelHOG,personIndexHOG,faceClassifierHOG] = extractTrainingFeatures(faceDatabase)

%   separate the database into 80% training and 20% testing.
    training = faceDatabase;

%   count the length of features extracted    
    numcolsHOG = size(extractHOGFeatures(read(training(1),1)));
    
%   create variable to hold the hog value of training images    
    trainingFeaturesHOG = zeros(size(training,2)*training(1).Count,numcolsHOG(1,2));

%   ---- Extracts and labels the features of training images ----    
    featureCount = 1;
    for i=1:size(training,2)
        for j = 1:training(i).Count
            
            %convert to grayscale
            img = read(training(i),j);
            
            %extracts hog features from training image
            trainingFeaturesHOG(featureCount,:) = extractHOGFeatures(img);
            
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

end

