%% Examples: Basic ML
clear all;
close all;

%Load Data
[X,y] = read_data; 

%Split Data
[Xtrain, ytrain, Xtest, ytest] = split_data(X,y,20); 

%% Showing the average pets
fprintf('Showing the average pets\n');

img_size = [64, 64];

[avgcat, avgdog] = average_pet(X,y);
sgtitle('Average Pets')

% show_image(avgcat,1)

subplot(1,2,1)
imshow(uint8(reshape(avgcat, img_size)))
title('Average Cat')

% show_image(avgdog,1)

subplot(1,2,2)
imshow(uint8(reshape(avgdog, img_size)))
title('Average Dog')
print -dpng average_pets.png

fprintf('\n\n');
%% Closest average
fprintf('Closest average\n');

yguesstrain = closest_average(Xtrain,ytrain,Xtrain);
yguesstest = closest_average(Xtrain,ytrain,Xtest);
training_error = error_rate(yguesstrain,ytrain);
test_error = error_rate(yguesstest,ytest);
a = sprintf('Closest average training error rate is %.2g%%.',training_error);
disp(a)
a = sprintf('Closest average test error rate is %.2g%%.',test_error);
disp(a)

fprintf('\n\n');
%% Nearest Neighbour
fprintf('Nearest Neighbour\n');

yguesstrain = nearest_neighbor(Xtrain,ytrain,Xtrain);
yguesstest = nearest_neighbor(Xtrain,ytrain,Xtest);
training_error = error_rate(yguesstrain,ytrain);
test_error = error_rate(yguesstest,ytest);
a = sprintf('Nearest neighbour training error rate is %.2g%%.',training_error);
disp(a)
a = sprintf('Nearest neighbour test error rate is %.2g%%.',test_error);
disp(a)

fprintf('\n\n');
%% Linear discriminant analysis
fprintf('Linear discriminant analysis\n');

yguesstrain = lda(Xtrain,ytrain,Xtrain);
yguesstest = lda(Xtrain,ytrain,Xtest);
training_error = error_rate(yguesstrain,ytrain);
test_error = error_rate(yguesstest,ytest);
a = sprintf('Linear discriminant analysis training error rate is %.2g%%.',training_error);
disp(a)
a = sprintf('Linear discriminant analysis test error rate is %.2g%%.',test_error);
disp(a)

fprintf('\n\n');
%% Perceptron
fprintf('Perceptron\n');

yguesstrain = perceptron(Xtrain,ytrain,Xtrain);
yguesstest = perceptron(Xtrain,ytrain,Xtest);
training_error = error_rate(yguesstrain,ytrain);
test_error = error_rate(yguesstest,ytest);
a = sprintf('Perceptron training error rate is %.2g%%.',training_error);
disp(a)
a = sprintf('Perceptron test error rate is %.2g%%.',test_error);
disp(a)

fprintf('\n\n');
%% PCA
fprintf('PCA\n');

pcaX = pca(Xtrain); %Determine PCA transform.
pcaXtranspose = pcaX'; %Take transpose to be in right format for show_image.
figure(3)
image_indices = [1 2 3 4]; %Change these to examine different eigenvectors.
%The code below displays a 2 x 2 grid of eigenvectors as 64 x 64 images.
for i = 1:2
    for j = 1:2
    image_index = image_indices(2*(i-1)+j);
    subplot(2,2,2*(i-1)+j)
    imagesc(reshape(pcaXtranspose(image_index,:),64,64))
    colormap('gray')
    axis square
    a = sprintf('Eigenpet %g',image_index);
    title(a)
    end
end

kvalues = [50 100 200 400];
for i = 1:length(kvalues)
    k = kvalues(i);
    [Xtrain_reduced Xtest_reduced] = reduce_data(Xtrain,Xtest,k);
    yguesstrain = lda(Xtrain_reduced,ytrain,Xtrain_reduced);
    yguesstest = lda(Xtrain_reduced,ytrain,Xtest_reduced);
    training_error = error_rate(yguesstrain,ytrain);
    test_error = error_rate(yguesstest,ytest);
    a = sprintf('For PCA-reduced data with dimension k = %g, linear discriminant analysis training error rate is %.2g%%.',k,training_error);
    disp(a)
    a = sprintf('For PCA-reduced data with dimension k = %g, linear discriminant test error rate is %.2g%%.',k,test_error);
    disp(a)
    yguesstrain = perceptron(Xtrain_reduced,ytrain,Xtrain_reduced);
    yguesstest = perceptron(Xtrain_reduced,ytrain,Xtest_reduced);
    training_error = error_rate(yguesstrain,ytrain);
    test_error = error_rate(yguesstest,ytest);
    a = sprintf('For PCA-reduced data with dimension k = %g, perceptron training error rate is %.2g%%.',k,training_error);
    disp(a)
    a = sprintf('For PCA-reduced data with dimension k = %g, perceptron test error rate is %.2g%%.',k,test_error);
    disp(a)
end
