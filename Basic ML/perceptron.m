%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to the decision rule corresponding
%to a very simple one-layer neural network: the perceptron. 
%It also takes in a data matrix Xrun and produces a vector of label
%guesses yguess, corresponding to the sign of the linear prediction.
function yguess = perceptron(Xtrain,ytrain,Xrun)
X1 = transpose(Xtrain) * Xtrain;
X2 = pinv(X1);
X3 = X2 * transpose(Xtrain);
X4 = X3 * ytrain;

for i = 1:size(Xrun,1)
   
    if (Xrun(i,:) * X4) >= 0
        yguess(i,1) = 1;
    else
        yguess(i,1) = -1;
    end
        
end

end