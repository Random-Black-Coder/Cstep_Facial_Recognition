%% -----Identify function-----
% Author: Yahkeef Davis    
% Date: 6/15/17
% Description: Read a series of images from a folder, crop them, 
% extract the HOG features, and % I.D. the person. 
% 
%% -----Function Start--- %%
function [cScore,negLoss,integerIndexHOG,booleanIndexHOG,personLabelHOG] = identify3(training,personIndexHOG,cMdl,qImg)
%   load training size
    %training = load('vTrainingSize.mat');
    
%   load person index
    %personIndexHOG = load('vPersonIndex.mat','personIndexHOG');

%   store img
    queryImg = qImg;
    
%   convert image to black and white
    %queryImg = rgb2gray(queryImg);
		
%	extract hog
	queryFeaturesHOG = extractHOGFeatures(queryImg);
    
%   load trained classification model
    %trainedModel = loadCompactModel('trainingModel.mat');
    
%   identifies photo of a person with the most similar features to queryImg
    [personLabelHOG,negLoss,cScore] = predict(cMdl,queryFeaturesHOG);
    
%   compares name of predicted match to the names in the database    
	booleanIndexHOG = strcmp(personLabelHOG, personIndexHOG);
    
%   finds integer location of image for person in the index   
	integerIndexHOG = find(booleanIndexHOG);
    disp(integerIndexHOG);
    
%   display negation binary loss (classification score)    
    disp(negLoss);
 
%	display query image
	subplot(1,2,1);
	imshow(queryImg);
    
%   if (closest Match > minimum similarity threshold) 
    if(negLoss(integerIndexHOG) > -0.0300)
        title(['You are ', personLabelHOG]);
    
%       display matched image    
        subplot(1,2,2);
        imshow(read(training(integerIndexHOG),1));
        title(['HOG Matched Class: ',personLabelHOG]);
        
    else
        
%       indicate that the person is unknown
        title('Person Unknown');
        
%       display closest match image    
        subplot(1,2,2);
        imshow(read(training(integerIndexHOG),1));
        title(['Closest Match: ',personLabelHOG]);
    end         
end

