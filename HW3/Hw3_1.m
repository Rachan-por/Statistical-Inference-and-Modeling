%% generate data
clear all; close all
rng('default') 
X = rand(100,2);
y = 2*X(:,1) + 5*X(:,2) + randn(100,1)/10;

%% set variables
las_betas = [];
las_mse = [];
ridge_betas = [];
ridge_mse = [];

%% lasso regression
lambda_max1 = 1.5;
step1 = lambda_max1/50;

for lambdab = 0:step1:lambda_max1
    Bl = lasso(X,y,'Lambda',lambdab);
    las_betas(end+1) = norm(Bl,1);
    err = norm(y-X*Bl)^2;
    las_mse(end+1) = err;
end
%% ridge regression
lambda_max2 = 500;
step2 = lambda_max2/49;

for lambdar = 0:step2:lambda_max2
    Br = ridge(y,X,lambdar);
    ridge_betas(end+1) = norm(Br)^2;
    err = norm(y-X*Br)^2;
    ridge_mse(end+1) = err;
end

%% graph plot
figure()
plot(las_betas,las_mse)
title('trade-off curves of lasso regression')
xlabel('$$\|\beta\|_{1}$$', Interpreter='latex')
ylabel('$$\|y - X\beta\|_{2}^{2}$$', Interpreter='latex')

figure()
plot(ridge_betas,ridge_mse)
title('trade-off curves of ridge regression')
xlabel('$$\|\beta\|_{2}^{2}$$', Interpreter='latex')
ylabel('$$\|y - X\beta\|_{2}^{2}$$', Interpreter='latex')