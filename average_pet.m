function [avgcat avgdog] = average_pet(X,Y)
X1=zeros(1000,4096);
X2=zeros(1000,4096);
i=1;
for j=1:2000
    if Y(i)==-1
        X1(i,:)=X(i,:);
        i=i+1;
    else
        X2(i,:)=X(i,:);
        i=i+1;
    end
end
avgcat=mean(X1);
avgdog=mean(X2);

end