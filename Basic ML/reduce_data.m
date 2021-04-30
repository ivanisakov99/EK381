%This function takes in a training data matrix Xtrain and uses
%it to compute the PCA basis and a sample mean vector. 
%It also takes in a test data matrix Xtest and a dimension k. 
%It first centers the data matrices Xtrain and Xtest by subtracting the
%Xtrain sample mean vector from each of their rows. It then uses the 
%top-k vectors in the PCA basis to project the centered Xtrain and Xtest
%data matrices into a k-dimensional space, and outputs
%the resulting data matrices as Xtrain_reduced and Xtest_reduced.
function [Xtrain_reduced Xtest_reduced] = reduce_data(Xtrain,Xtest,k)
V = pca(Xtrain);
Vk = V(1:size(V,1),1:k);
mutrain = sum(Xtrain,1)/size(Xtrain,1);

one_test = ones(size(Xtest,1),1);
one_train = ones(size(Xtrain,1),1);

Xtest_centered = Xtest - one_test * mutrain;
Xtrain_centered = Xtrain - one_train * mutrain;

Xtest_reduced = Xtest_centered * Vk;
Xtrain_reduced = Xtrain_centered * Vk;

end