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
           imwrite(img,'C:\FaceRecognition\qImg.jpg')
 
        end
           
        %Reads the image from the specified folder
        A = imread('C:\FaceRecognition\qImg.jpg');
        
        %Creates a CascadeObjectDetector to face detect images
        FaceDetector = vision.CascadeObjectDetector();
        
        %gets the size of the faces
        BBOX = step(FaceDetector, A);
        
        %number of faces
        n = size(BBOX,1);
        
        %number of faces
        str_n = num2str(n);
        
        %Displays the 'Number of detected faces are: Var'
        str = strcat('Number of detected faces are: ', str_n);
         
        %displays str
        disp(str);

        %Displays the cropped image
        imshow(A);
        
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
 
%%----THE HEART----%%

%Load Image Information from ATT Face Database Directory
faceDatabase = imageSet('C:\FaceRecognition\FaceGalleryFiles','recursive');

training = load('vTrainingSize.mat','training');
training = training.training;

%The image sent by IA
queryImage = imread('C:\FaceRecognition\qImg.jpg');
 
%Display query image
figure;
imshow(queryImage);
title('We will use this as the Query image.');

%Display # of ppl in database
disp('# of people: ');
disp(size(faceDatabase,2));
numpeople=size(faceDatabase,2);

%Identify Query Image
[cScore,negLoss,integerIndexHOG,booleanIndexHOG] = identify(BBOX, faceDatabase);