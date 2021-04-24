function yguess = linear_regression(Xtrain,ytrain,Xtest)
[m n]=size(Xtest);
yguess=zeros(m,1);
b = pinv(Xtrain.'*Xtrain)*Xtrain.'*ytrain;
yguess= sign(Xtest*b);
end
