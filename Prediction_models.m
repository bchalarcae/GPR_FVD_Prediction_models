% Parametric study and prediction models for the seismic response of
% single-degree-of-freedom systems equipped with fluid viscous dampers.
% Bryan Chalarca Echeverri.
% University School for Advanced Studies IUSS Pavia, Italy.

% Gaussian Process Regression models to predict the peak absolute acceleration (PAA),
% peak mass absolute spectral acceleration (PMASA),
% peak relative velocity (PRV), and the peak relative displacement (PRD),
% as a factor of such value in the equivalent SDoF system without dampers.

%% Input parameters

load('Pred_Mod_N_ELS_PFA.mat'); % Load GPR Prediction model for peak model acceleration
load('Pred_Mod_N_ELS_PISD.mat');
load('Pred_Mod_N_ELS_PSA.mat');
load('Pred_Mod_N_UD_PFA.mat');
load('Pred_Mod_N_UD_PISD.mat');
load('Pred_Mod_N_UD_PSA.mat');


load('Pred_Mod_N_PAA.mat'); % Load GPR Prediction model for peak model acceleration
load('Pred_Mod_N_PMASA.mat'); % Load GPR Prediction model for peak spectral acceleration
load('Pred_Mod_N_PRD.mat');% Load GPR Prediction model for the non-structural period at which the peak spectral acceleration occurs
load('Pred_Mod_N_PRV.mat'); % Load GPR Prediction model for peak model elongation

% Load the input data to get the prediction, each row is a data point, the
% columns represent the input variables and should follow an
% strict order: Period (s), Maxwell Stiffness as a fraction of the model
% stiffness (Kd/Kmod), Supplemental damping as % (e.g. 10), Seismic intensity as
% the ground spectral acceleration at 1 s in g (e.g. 0.6), velocity
% exponent of VD. [T Kd Damp Sa Alpha];

input=dlmread('input.txt'); 

%% This part does the prediction of the GPR.
% The output matrix is defined as
% [Predicted value, standard deviation, 95% of confidence level]
% The predict command follows (call GPR model, input points)

[p_npaa,sd_npaa,int_npaa] = predict(N_PAA.RegressionGP,input);
[p_npsa,sd_npsa,int_npsa] = predict(N_PMASA.RegressionGP,input);
[p_nprv,sd_nprv,int_nprv] = predict(N_PRV.RegressionGP,input);
[p_nprd,sd_nprd,int_nprd] = predict(N_PRD.RegressionGP,input);


%% Figures

fh1=figure(1);

set(fh1,'color','white','Name','Predicted Seismic Response');

%% Graph PAA

sh=subplot(2,2,1);

fill([(1:length(p_npaa))';flipud((1:length(p_npaa))')],[int_npaa(:,1);flipud(int_npaa(:,2))],[0.9 0.9 0.9]);
hold on
plot(1:length(p_npaa),p_npaa,'^k','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
lgd=legend('95% Confidence Level','Predicted Values','Location','best');
legend('boxoff','FontSize',20,'FontName','Times New Roman')
set(sh,'Box','off','TickDir','out','FontSize',20,'FontName','Times New Roman');
xlabel('Observations');
ylabel('Norm. Peak Abs. Acceleration');

%% Graph PMASA

sh=subplot(2,2,2);

fill([(1:length(p_npsa))';flipud((1:length(p_npsa))')],[int_npsa(:,1);flipud(int_npsa(:,2))],[0.9 0.9 0.9]);
hold on
plot(1:length(p_npsa),p_npsa,'^k','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
lgd=legend('95% Confidence Level','Predicted Values','Location','best');
legend('boxoff','FontSize',20,'FontName','Times New Roman')
set(sh,'Box','off','TickDir','out','FontSize',20,'FontName','Times New Roman');
xlabel('Observations');
ylabel('Norm. Peak Mass Spectral Accel.');

%% Graph PRV

sh=subplot(2,2,3);

fill([(1:length(p_nprv))';flipud((1:length(p_nprv))')],[int_nprv(:,1);flipud(int_nprv(:,2))],[0.9 0.9 0.9]);
hold on
plot(1:length(p_nprv),p_nprv,'^k','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
lgd=legend('95% Confidence Level','Predicted Values','Location','best');
legend('boxoff','FontSize',20,'FontName','Times New Roman')
set(sh,'Box','off','TickDir','out','FontSize',20,'FontName','Times New Roman');
xlabel('Observations');
ylabel('Norm. Peak Relative Velocity');

%% Graph PRD

sh=subplot(2,2,4);

fill([(1:length(p_nprd))';flipud((1:length(p_nprd))')],[int_nprd(:,1);flipud(int_nprd(:,2))],[0.9 0.9 0.9]);
hold on
plot(1:length(p_nprd),p_nprd,'^k','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
lgd=legend('95% Confidence Level','Predicted Values','Location','best');
legend('boxoff','FontSize',20,'FontName','Times New Roman')
set(sh,'Box','off','TickDir','out','FontSize',20,'FontName','Times New Roman');
xlabel('Observations');
ylabel('Norm. Peak Relative Displacement');
