%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess, corresponding to whether
%each row of Xtest is closer to the average cat or average dog.
function yguess = closest_average(Xtrain,ytrain,Xrun)
[atrain, btrain] = average_pet(Xtrain,ytrain);

[size1,idx]=size(Xrun);
y_zero=zeros(1,size1);

for i=1:size1
    avg_cat_in(i,:)=Xrun(i,:)-atrain;
    Davg_cat(i)=sqrt(sum(avg_cat_in(i,:).^2)).^(1/2);
    avg_dog_in(i,:)=Xrun(i,:)-btrain;
    Davg_dog(i)=sqrt(sum(avg_dog_in(i,:).^2)).^(1/2);
    if Davg_cat(i)>Davg_dog(i)
        y_zero(i)=1;
    else
        y_zero(i)=-1;
    end
end
yguess=y_zero';
end