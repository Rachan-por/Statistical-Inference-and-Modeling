clear all; close all
data = load('data-arx-modelsel.mat');
u = data.u;
y = data.y;
%% p = 1, r = 1
y1 = y(2:end);
X = [y(1:end-1) u(1:end-1)];
model1 = fitlm(X,y1, 'Intercept',false);
beta1 = table2array(model1.Coefficients(:,1))
AIC1 = model1.ModelCriterion.AIC;
AICc1 = model1.ModelCriterion.AICc;
BIC1 = model1.ModelCriterion.BIC;
%% p = 1, r = 2
y2 = y(3:end);
X2 = [y(2:end-1) u(1:end-2) u(2:end-1)];
model2 = fitlm(X2,y2);
beta2 = table2array(model2.Coefficients(:,1));
AIC2 = model2.ModelCriterion.AIC;
AICc2 = model2.ModelCriterion.AICc;
BIC2 = model2.ModelCriterion.BIC;
%% p = 2, r = 1
y3 = y(3:end);
X3 = [y(2:end-1) y(1:end-2) u(2:end-1)];
model3 = fitlm(X3,y3);
beta3 = table2array(model3.Coefficients(:,1));
AIC3 = model3.ModelCriterion.AIC;
AICc3 = model3.ModelCriterion.AICc;
BIC3 = model3.ModelCriterion.BIC;
%% p = 2, r =2
y4 = y(3:end);
X4 = [y(2:end-1) y(1:end-2) u(2:end-1) u(1:end-2)];
model4 = fitlm(X4,y4);
beta4 = table2array(model4.Coefficients(:,1));
AIC4 = model4.ModelCriterion.AIC;
AICc4 = model4.ModelCriterion.AICc;
BIC4 = model4.ModelCriterion.BIC;
%%
model = ['p=1,r=1'; 'p=1,r=2'; 'p=2,r=1'; 'p=2,r=2'];
AIC = [AIC1; AIC2; AIC3; AIC4];
AICc = [AICc1; AICc2; AICc3; AICc4];
BIC = [BIC1; BIC2; BIC3; BIC4];
table1 = table(Name, AIC, AICc, BIC)
X = categorical({'p=1,r=1'; 'p=1,r=2'; 'p=2,r=1'; 'p=2,r=2'});
X = reordercats(X,{'p=1,r=1'; 'p=1,r=2'; 'p=2,r=1'; 'p=2,r=2'});
bar(X,table1{:,2:end})
legend('AIC', 'AICc', 'BIC', Location='best')
title('Bar graph of model selection score')