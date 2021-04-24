%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the PCA basis. 
%It also takes in a test data matrix Xtest and a dimension k
%and uses the top-k vectors in the PCA basis to reduce the 
%dimension of Xtrain and Xtest. Finally, it uses the reduced data
%as inputs to the linear_regression function to produce 
%a vector of label guesses yguess.
function yguess = pca_regression(Xtrain,ytrain,Xtest,k)
[m n]=size(Xtest);
Vt=pca(Xtrain);
Vtk=Vt(:,[1:k]);
XtrainR=Xtrain*Vtk;
XtestR=Xtest*Vtk;
yguess=zeros(m,1);
b = pinv(XtrainR.'*XtrainR)*XtrainR.'*ytrain;
yguess= sign(XtestR*b);
end
%FILL IN CODE