%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a test data matrix Xtest and 
%produces a vector of label guesses yguess. Each guess is found
%by searching through Xtrain to find the closest row, and then 
%outputting its label.
function yguess = nearest_neighbor(Xtrain,ytrain,Xtest)
[m n]=size(Xtest);
yguess=zeros(m,1);
s=zeros(1600,1);

for d=1:m
   for e=1:1600
       s(e)=norm(Xtest(d,:)-Xtrain(e,:));
   end
   [M,I]=min(s);
   yguess(d)=ytrain(I);
end
end


%FILL IN CODE