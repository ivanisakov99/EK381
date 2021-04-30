%% CNN on Pets Dataset

clear all
close all

%% Create the objects

% These folders should be in the same directory
catsfolder = 'catsfolder';
dogsfolder = 'dogsfolder';
petsfolder = 'petsfolder';

% Number of train files/1000 each
split = 800; 

% Number of neurons
neurons = 16; 

% nxn filter -> (n-1)x(n-1) pooling -> (n-2)x(n-2) pooling
filter = 6; 

% Number of epochs
epochs = 10;

% Create image datastore object for cats
imds1 = imageDatastore(catsfolder,'FileExtensions','.jpg');
imds1.Labels = categorical(-ones(1000,1));

% Create image datastore object for dogs
imds2 = imageDatastore(dogsfolder,'FileExtensions','.jpg');
imds2.Labels = categorical(ones(1000,1));

% Create image datastore object for cats and dogs
imds = imageDatastore(petsfolder,'FileExtensions', '.jpg');
imds.Files = [imds1.Files,imds2.Files];
imds.Labels = [imds1.Labels,imds2.Labels];

% Check the labels
labelCount  = countEachLabel(imds);
%% Split the Data Set

% Split into training and testing data
imdsSize = size(imds.Files);
[imdsTrain,imdsTest] = splitEachLabel(imds,split,'randomized');
%% Train the CNN

layers = [
    imageInputLayer([size(readimage(imds,1)) 1])
    
    convolution2dLayer(filter,neurons,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer((filter-1),'Stride',(filter-1))
    
    convolution2dLayer(filter,neurons,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer((filter-2),'Stride',(filter-2))
    
    convolution2dLayer(filter,2*neurons,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    % Number of classes
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer
];

% Training options
options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',epochs, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsTest, ...
    'ValidationFrequency',60, ...
    'Verbose',false, ...
    'Plots','training-progress');

net = trainNetwork(imdsTrain,layers,options);

yguess = classify(net,imdsTest);
yguess_train = classify(net,imdsTrain);

ytest = imdsTest.Labels;
ytrain = imdsTrain.Labels;

%% Display the Results

n = length(ytrain);
accuracy_train = 100/n*sum([yguess_train == ytrain]);
fprintf('Accuracy of the training: %.2f\n', accuracy_train);

n = length(ytest);
accuracy_test = 100/n*sum([yguess == ytest]);
fprintf('Accuracy of the testing: %.2f\n', accuracy_test);

% Display wrongly classified images
wrongGuess = find(yguess ~= ytest);

for i = 1:length(wrongGuess)
    subplot(ceil(length(wrongGuess)/3),3,i);
    imshow(imdsTest.Files{wrongGuess(i)});
    title(wrongGuess(i));
end
sgtitle('Misclassified pets')
print -dpng missclassified_pets.png