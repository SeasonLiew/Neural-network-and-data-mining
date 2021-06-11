%% Reconstruct Handwritten Digit Images Using Sparse Autoencoder  

%% 
% Load the training data. 
XTrain = digitTrainCellArrayData;

%%
% The training data is a 1-by-5000 cell array, where each cell containing
% a 28-by-28 matrix representing a synthetic image of a handwritten digit.  

%% 
% Train an autoencoder with a hidden layer containing 50 neurons. 
% for b=100:150:200
%     for a=100:500:1000
b=1000; a=400;    
hiddenSize = b;
autoenc = trainAutoencoder(XTrain,hiddenSize,...
        'MaxEpochs', a, ...
        'L2WeightRegularization',0.004,...
        'SparsityRegularization',4,...
        'SparsityProportion',0.15);  

%% 
% Load the test data. 
XTest = digitTestCellArrayData; 

%%
% The test data is a 1-by-5000 cell array, with each cell containing a 28-by-28
% matrix representing a synthetic image of a handwritten digit.  

%% 
% Reconstruct the test image data using the trained autoencoder, |autoenc|. 
xReconstructed = predict(autoenc,XTest);  
mseError = mse(XTest,xReconstructed);
fprintf("epoch size mse  %d %d %d \n", a,b,mseError);
%% 
% view the actual test data. 
figure;
for i = 1:20
    subplot(4,5,i);
    % select samples with the corresponding indexes
    idx = 100+200*i;
    imshow(XTest{idx});
end     

%% 
% View the reconstructed test data. 
figure;
for i = 1:20
    subplot(4,5,i);
    % select samples with the corresponding indexes
    idx = 100+200*i;
    imshow(xReconstructed{idx});
end      

%     end 
% end

%% 
% Copyright 2012 The MathWorks, Inc.