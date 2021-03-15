function yguess = closest_average(Xtrain,ytrain,Xtest)
[m n]=size(Xtest);
yguess=zeros(m,1);
X3=zeros(814,4096);
X4=zeros(786,4096);

i=1;
j=1;
for z=1:1600
    if ytrain(z,1)== -1
        X3(i,:)=Xtrain(z,:);
        i=i+1;
    else
        X4(j,:)=Xtrain(z,:);
        j=j+1;
    end
end
Xavgcat=mean(X3);
Xavgdog=mean(X4);
for d=1:m
    if norm(Xtest(d,:)-Xavgcat) <= norm(Xtest(d,:)-Xavgdog)
        yguess(d)=-1;
    else
        yguess(d)=1;
    end
end
end