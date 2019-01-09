%%IMAGE ACQUISITION
 
% Create the face detector object.
faceDetector = vision.CascadeObjectDetector();
 
% Create the point tracker object.
pointTracker = vision.PointTracker('MaxBidirectionalError', 2);
 
% Create the webcam object.
cam = webcam();
 
% Capture one frame to get its size.
videoFrame = snapshot(cam);
frameSize = size(videoFrame);
 
% Create the video player object.
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);
 
runLoop = true;
numPts = 0;
frameCount = 0;  %don't need to used this because loop is infinite
 
%runs while this loop is true
while runLoop
 
    % Get the next frame.
    videoFrame = snapshot(cam);
    videoFrameGray = rgb2gray(videoFrame);
    frameCount = frameCount + 1;
    
    
    if numPts < 10
        
        % Detection mode.
        bbox = faceDetector.step(videoFrameGray);
   
        %<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        %takes a snappshot & crops it to respective size
        %<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        
        img = snapshot(cam);
             
        if(~isempty(img))
           
           %Saves the snapshot in specified directory
           imwrite(img,'C:\Users\Yahkeef Davis\Desktop\FaceRecognition\qImg.jpg')
 
        end
           
        %Reads the image from the specified folder
        A = imread('C:\Users\Yahkeef Davis\Desktop\FaceRecognition\qImg.jpg');
        
        %Creates a CascadeObjectDetector to face detect images
        FaceDetector = vision.CascadeObjectDetector();
        
        %gets the size of the faces
        BBOX = step(FaceDetector, A);
            
        %we don't need this because it reduces performance
        %B = insertObjectAnnotation(A, 'rectangle', BBOX, 'face');
        
        %this also reduces performance
        %imshow(B), title('Detected Faces');
        
        %number of faces
        n = size(BBOX,1);
        
        %number of faces
        str_n = num2str(n);
        
        %Displays the 'Number of detected faces are: Var'
        str = strcat('Number of detected faces are: ', str_n);
         
        %displays str
        disp(str);
           
        %crops the image to specified size
        %I2 = imcrop(A,BBOX);
        
        %resize image to 480x480 for recognition
        %I2 = imresize(I2,[480,480]);

        %Displays the cropped image
        imshow(A);
        
        %Tests whether the cropped image object is empty
        %if(~isempty(I2)) 
            
            %Writes cropped image back
            %imwrite(I2,'C:\Users\Yahkeef Davis\Desktop\FaceRecognition\cropped.jpg')
          
       % end
        
        if ~isempty(bbox)
            % Find corner points inside the detected region.
            points = detectMinEigenFeatures(videoFrameGray, 'ROI', bbox(1, :));
 
            % Re-initialize the point tracker.
            xyPoints = points.Location;
            numPts = size(xyPoints,1);
            release(pointTracker);
            initialize(pointTracker, xyPoints, videoFrameGray);
 
            % Save a copy of the points.
            oldPoints = xyPoints;
 
            % Convert the rectangle represented as [x, y, w, h] into an
            % M-by-2 matrix of [x,y] coordinates of the four corners. This
            % is needed to be able to transform the bounding box to display
            % the orientation of the face.
            bboxPoints = bbox2points(bbox(1, :));
 
            % Convert the box corners into the [x1 y1 x2 y2 x3 y3 x4 y4]
            % format required by insertShape.
            bboxPolygon = reshape(bboxPoints', 1, []);
 
            % Display a bounding box around the detected face.
            videoFrame = insertShape(videoFrame, 'Polygon', bboxPolygon, 'LineWidth', 3);
 
            % Display detected corners.
            videoFrame = insertMarker(videoFrame, xyPoints, '+', 'Color', 'white');
            
        end
        
    else
        % Tracking mode.
        [xyPoints, isFound] = step(pointTracker, videoFrameGray);
        visiblePoints = xyPoints(isFound, :);
        oldInliers = oldPoints(isFound, :);
 
        numPts = size(visiblePoints, 1);
 
        if numPts >= 10
            % Estimate the geometric transformation between the old points
            % and the new points.
            [xform, oldInliers, visiblePoints] = estimateGeometricTransform(...
                oldInliers, visiblePoints, 'similarity', 'MaxDistance', 4);
 
            % Apply the transformation to the bounding box.
            bboxPoints = transformPointsForward(xform, bboxPoints);
 
            % Convert the box corners into the [x1 y1 x2 y2 x3 y3 x4 y4]
            % format required by insertShape.
            bboxPolygon = reshape(bboxPoints', 1, []);
 
            % Display a bounding box around the face being tracked.
            videoFrame = insertShape(videoFrame, 'Polygon', bboxPolygon, 'LineWidth', 3);
 
            % Display tracked points.
            videoFrame = insertMarker(videoFrame, visiblePoints, '+', 'Color', 'white');
 
            % Reset the points.
            oldPoints = visiblePoints;
            setPoints(pointTracker, oldPoints);
            
        end
 
    end
 
    % Display the annotated video frame using the video player object.
    step(videoPlayer, videoFrame);
 
    % Check whether the video player window has been closed.
    runLoop = isOpen(videoPlayer);
    
end
 
% Clean up.
clear cam;
release(videoPlayer);
release(pointTracker);
release(faceDetector);
 
 
%%THE HEART

%%Simple Face Recognition Example
%%Load Image Information from ATT Face Database Directory
faceDatabase = imageSet('C:\Users\Yahkeef Davis\Desktop\FaceRecognition\FaceGalleryFiles','recursive');

%%Display Montage of First Face
%figure;
%montage(faceDatabase(1).ImageLocation);
%title('Images of First Person');
%figure;
%montage(faceDatabase(2).ImageLocation);
%title('Images of Second person');
%figure;
%montage(faceDatabase(3).ImageLocation);
%title('Images of Third Person');
%figure;
%montage(faceDatabase(4).ImageLocation);
%title('Images of Fourth Person');
%figure;
%montage(faceDatabase(5).ImageLocation);
%title('Images of Fifth Person');
%figure;
%montage(faceDatabase(6).ImageLocation);
%title('Images of Sixth Person');

%%Display Query Image and Database Side-Side
%%this should be a call to run miguel's code and detect, register
%%and crop a picture for input as the query
%%currently this is just going to check the very first person's picture
%%in the data base
%%The image sent by IA
queryImage = imread('C:\Users\Yahkeef Davis\Desktop\FaceRecognition\qImg.jpg');
 
figure;
imshow(queryImage);
title('We will use this as the Query person.');
 
%%this for loop creates a list of images and for some reason picks out 
%%the fifth image for each person then shows query face next to picked
%%out images.
disp('# of people: ');
disp(size(faceDatabase,2));
 
numpeople=size(faceDatabase,2);
 
%for i=1:2 %size(faceDatabase,2) %size(faceDatabase,2)= # people in database
% imageList(i) = faceDatabase(i).ImageLocation(5);
%end

%%plot of query face next to the possible choices that query face can be.
subplot(1,2,1);
imshow(queryImage);
title('query person');
%subplot(1,2,2);montage(imageList);title('all possible people');
 
diff = zeros(1,numpeople);

%%Split Database into Training & Test Sets
[training,test] = partition(faceDatabase,[0.8 0.2]); 
 
%subplot(2,1,1);imshow(read(training(1),1));title('training 1');
%subplot(2,1,2);imshow(read(test(1),1));title('test 1')
 
x = size(training);
for i = 1:1 %x(1,2) %size(training)
    figure;
    montage(training(i).ImageLocation);
    str1 = num2str(i);
    str2 = 'Training Image:   ';
    nstr = strcat(str2,str1);
    title(nstr);
end
 
y = size(test);
for i = 1:1 %y(1,2)
    figure;
    montage(test(i).ImageLocation);
    str1 = num2str(i);
    str2 = 'Test Image: ';
    nstr = strcat(str2,str1);
    title(nstr);
end
 
%figure;
%montage(faceDatabase(1).ImageLocation);
%title('Images of First Person');

%%Extract & display Histogram of Oriented Gradient Features for a single face
%person = 6;
%[hogFeature, visualization]= ...
%    extractHOGFeatures(read(training(person),1));
%figure;
%subplot(2,1,1);imshow(read(training(person),1));title('Training Input Face');
%subplot(2,1,2);plot(visualization);title('HoG Features of training input face');
%
%%Extract HOG Features for training set

%%find length of extracted features, all images should be same.
numcolsHOG = size(extractHOGFeatures(read(training(1),1)));
trainingFeaturesHOG = zeros(size(training,2)*training(1).Count,numcolsHOG(1,2));
 
featureCount = 1;
for i=1:size(training,2)
    for j = 1:training(i).Count
        display(strcat('j =', num2str(j)));
        display(strcat('featureCount =', num2str(featureCount)));
        imshow(read(training(i),j));
        trainingFeaturesHOG(featureCount,:) = extractHOGFeatures(read(training(i),j));
        trainingLabelHOG{featureCount} = training(i).Description; 
        display(strcat('trainingLabelHOG{featureCount}',num2str(trainingLabelHOG{featureCount})));
        featureCount = featureCount + 1;
    end
    personIndexHOG{i} = training(i).Description
    display(strcat('personIndexHOG{i}:',num2str(i),'---',num2str(personIndexHOG{i})));
end
%display(strcat('featureCount: ',num2str(featureCount)));

%Creates featureCount class classifier using fitcecoc
faceClassifierHOG = fitcecoc(trainingFeaturesHOG,trainingLabelHOG);

%%Identify Query Image
identify(BBOX, personIndexHOG, faceClassifierHOG);
