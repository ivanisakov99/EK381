% [X,Y]=read_data();
[avgcat,avgdog]=average_pet(X,Y);
show_image(avgcat)
%show_image(avgdog)
% 
%[Xtrain, ytrain, Xtest, ytest]=split_data(X,Y,20);

% yguess = closest_average(Xtrain,ytrain,Xtest);
% testaccuracy = calculate_accuracy(ytest,yguess)
% yguess = closest_average(Xtrain,ytrain,Xtrain);
% trainaccuracy = calculate_accuracy(ytrain,yguess)



% yguess = nearest_neighbor(Xtrain,ytrain,Xtest)
% testaccuracy = calculate_accuracy(ytest,yguess)
% yguess = nearest_neighbor(Xtrain,ytrain,Xtrain)
% trainaccuracy = calculate_accuracy(ytrain,yguess)

% 
% yguess = linear_regression(Xtrain,ytrain,Xtest);
% testaccuracy = calculate_accuracy(ytest,yguess)
% yguess = linear_regression(Xtrain,ytrain,Xtrain);
% trainaccuracy = calculate_accuracy(ytrain,yguess)


% Vt=pca(Xtrain);
% Vtk=Vt(:,[1:10]);
% show_image(Vtk',10)

% yguess = pca_regression(Xtrain,ytrain,Xtest,100)
%  accuracy = calculate_accuracy(ytest,yguess)
%yguess = pca_regression(Xtrain,ytrain,Xtrain,100)
% accuracy = calculate_accuracy(ytrain,yguess)
