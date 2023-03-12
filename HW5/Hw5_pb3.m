%% a
clear all; close all
mu1 = [-1;1]; mu2 = [2;1];
s1 = [2 -1; -1 1]; s2 = [2 0.1; 0.1 0.5];
x1 = mvnrnd(mu1, s1, 100);
x2 = mvnrnd(mu2, s2, 100);
[X1,X2] = meshgrid(-5:0.1:5);
a1 = X1(:); a2 = X2(:);
x = [a1 a2];

subplot(3,2,1)
scatter(x1(:,1),x1(:,2)); hold on
scatter(x2(:,1),x2(:,2)); hold on
p1 = 0.7; p2=0.3;
g = decision_boundary(x,X1,mu1,mu2,s1,s2,p1,p2);
contour(X1,X2,g,[0 0], LineStyle="--")
legend('class1','class2','decision boundary')
title('(a) \Sigma_2 - \Sigma_1 is indefinite')
xlabel('X_1|Y')
ylabel('X_2|Y',Rotation=0)

subplot(3,2,2)
s1 = [2 -1; -1 1]; s2 = [4 1; 1 3];
scatter(x1(:,1),x1(:,2)); hold on
scatter(x2(:,1),x2(:,2)); hold on
p1 = 0.7; p2=0.3;
g = decision_boundary(x,X1,mu1,mu2,s1,s2,p1,p2);
contour(X1,X2,g,[0 0],LineStyle="--")
legend('class1','class2','decision boundary')
title('(b) \Sigma_2 - \Sigma_1 is positive semidefinite ')
xlabel('X_1|Y')
ylabel('X_2|Y',Rotation=0)

subplot(3,2,3)
s1 = [3 -1; -1 3]; s2 = [1 0.5; 0.5 1];
scatter(x1(:,1),x1(:,2)); hold on
scatter(x2(:,1),x2(:,2)); hold on
p1 = 0.7; p2=0.3;
g = decision_boundary(x,X1,mu1,mu2,s1,s2,p1,p2);
contour(X1,X2,g,[0 0],LineStyle="--")
legend('class1','class2','decision boundary')
title('(c) \Sigma_2 - \Sigma_1 is negative semidefinite ')
xlabel('X_1|Y')
ylabel('X_2|Y',Rotation=0)

subplot(3,2,4)
s1 = [2 -1; -1 1]; s2 = s1;
scatter(x1(:,1),x1(:,2)); hold on
scatter(x2(:,1),x2(:,2)); hold on
p1 = 0.7; p2=0.3;
g = decision_boundary(x,X1,mu1,mu2,s1,s2,p1,p2);
contour(X1,X2,g,[0 0],LineStyle="--")
legend('class1','class2','decision boundary')
title('(d) \Sigma_2 = \Sigma_1')
xlabel('X_1|Y')
ylabel('X_2|Y',Rotation=0)

subplot(3,2,5)
s1 = [2 -1; -1 1]; s2 = s1;
scatter(x1(:,1),x1(:,2)); hold on
scatter(x2(:,1),x2(:,2)); hold on
p1 = 0.5; p2=0.5;
g = decision_boundary(x,X1,mu1,mu2,s1,s2,p1,p2);
contour(X1,X2,g,[0 0],LineStyle="--")
legend('class1','class2','decision boundary')
title('(e) \Sigma_2 = \Sigma_1 and uniform prior')
xlabel('X_1|Y')
ylabel('X_2|Y',Rotation=0)

function [g] = decision_boundary(x,X1,mu1,mu2,s1,s2,p1,p2);
    g2 = (x - (mu2.*ones(length(x),2)')')*inv(s2)*(x - (mu2.*ones(length(x),2)')')';
    g1 = (x - (mu1.*ones(length(x),2)')')*inv(s1)*(x - (mu1.*ones(length(x),2)')')';
    g = 1/2*(g2-g1)+1/2*log(det(s2)/det(s1)) + log(p1/p2);
    g = reshape(diag(g), size(X1));
end
