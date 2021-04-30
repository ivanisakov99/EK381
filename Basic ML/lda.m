%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the cat
%and dog sample mean vectors as well as the sample covariance matrix 
%(which is assumed to be equal for cats and dogs). 
%It also takes in a data matrix Xrun and produces a vector of
%label guesses yguess, corresponding to the ML rule for
%jointly Gaussian vectors with different means and the same 
%covariance matrix.
function yguess = lda(Xtrain,ytrain,Xrun)
yguess = zeros(size(Xrun,1),1);

Xcat = zeros(1,size(Xtrain,2));
Xdog = zeros(1,size(Xtrain,2));

[avgcat avgdog] = average_pet(Xtrain,ytrain);

for i = 1:size(Xtrain,1)

    if ytrain(i,1) == -1
        Xcat = [Xcat;Xtrain(i,:)];
    else
        Xdog = [Xdog;Xtrain(i,:)];   
    end

end

Xcat(1,:) = [];
Xdog(1,:) = [];

Xhatdog = (size(Xdog,1)-1).*cov(Xdog);
Xhatcat = (size(Xcat,1)-1).*cov(Xcat);
sumhat = Xhatdog + Xhatcat;

X = sumhat./(size(Xtrain,1)-1);

a = pinv(X) * transpose(avgdog - avgcat);

b1 = avgdog * pinv(X) * avgdog';
b2 = avgcat * pinv(X) * avgcat';

b = b1 - b2;

for i = 1:size(Xrun,1)
   
    if (2*Xrun(i,:)*a) >= b
        yguess(i,1) = 1;
    else
        yguess(i,1) = -1;
    end
        
end

end