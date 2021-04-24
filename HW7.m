% k=rank(X,X(1));
% plot(X(:,1),X(:,k),'x')
% c=corr(X);
% plot(X(:,2),X(:,7),'x')
Z(100,:)=[]
cz=corr(Z(:,1),Z(:,2))
plot(Z(:,1),Z(:,2),'x')