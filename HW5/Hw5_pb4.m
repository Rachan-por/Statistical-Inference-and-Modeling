%%
clear all; close all;
rng(1)
k1 = 2; k2 = 3; t1 = 1; t2 = 3/2;
g1 = gamma(k1); g2 = gamma(k2);
x1 = [gamrnd(k1,t1,[250, 1]), gamrnd(k1,2*t1,[250, 1])];
x2 = [gamrnd(k2,t2,250,1), gamrnd(k2,2*t2,250,1)];
%scatter(x2(:,1), x2(:,2)); hold on
scatter(x1(:,1), x1(:,2)); hold on;
scatter(x2(:,1), x2(:,2));
[X1,X2] = meshgrid(0:0.1:20);
a1 = X1(:); a2 = X2(:);
x = [a1 a2];

f = -X1*(1/t1 - 1/t2) - X2/2*(1/t1-1/t2) + (log(X1.*X2))*(k1-k2) - log((g1^2 * t1^k1 *2*t1^k1)/(g2^2 * t2^k2 *2*t2^k2));
%f1 = reshape(diag(f), size(X1));
contour(X1,X2,f,[0 0],ShowText="on", LineWidth=2)
legend('class1','class2','decision boundary')