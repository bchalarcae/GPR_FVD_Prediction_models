% Parametric study and prediction models for the seismic response of
% steel moment-resisting framed buildings equipped with fluid viscous dampers.
% Bryan Chalarca Echeverri.
% University School for Advanced Studies IUSS Pavia, Italy.

% Gaussian Process Regression models to predict the peak inter-story drift (PISD),
% peak floor absolute acceleration (PFAA), and the peak floor spectral absolute acceleration (PFSAA),
% of buildings equipped with FVDs design following the ELS and UD design
% approaches, as a factor of such value in the equivalent building without dampers.

%% Input parameters

load('Pred_Mod_N_ELS_PFA.mat'); % Load GPR Prediction model for PFAA of FVD design with ELS approach
load('Pred_Mod_N_ELS_PISD.mat'); % Load GPR Prediction model for PSID of FVD design with ELS approach
load('Pred_Mod_N_ELS_PSA.mat'); % Load GPR Prediction model for PFSAA of FVD design with ELS approach
load('Pred_Mod_N_UD_PFA.mat'); % Load GPR Prediction model for PFAA of FVD design with UD approach
load('Pred_Mod_N_UD_PISD.mat'); % Load GPR Prediction model for PSID of FVD design with UD approach
load('Pred_Mod_N_UD_PSA.mat'); % Load GPR Prediction model for PFSAA of FVD design with UD approach


% Load the input data to get the prediction, each row is a data point, the
% columns represent the input variables and should follow an
% strict order: total number of stories, fundamental period (s),
% Maxwell material stiffness as a fraction of the model stiffness (i.e., K_d/Kmod),
% supplemental damping ratio as % (e.g., 10),
% seismic intensity as the ground spectral acceleration at 1.0 s in g (e.g., 0.6 g),
% velocity exponent of FVD, and the ratio between the floor’s height and the
% total building’s height (i.e., z/H). [Ns T1 Kd/Kmod  Damp Sa1 Alpha z/H]

input=dlmread('input.txt'); 

%% This part does the prediction of the GPR.
% The output matrix is defined as
% [Predicted value, standard deviation, 95% of confidence level]
% The predict command follows (call GPR model, input points)

[p_npisd_els,sd_npisd_els,int_npisd_els] = predict(N_ELS_PISD.RegressionGP,input);
[p_npisd_ud,sd_npisd_ud,int_npisd_ud] = predict(N_UD_PISD.RegressionGP,input);

[p_npfa_els,sd_npfa_els,int_npfa_els] = predict(N_ELS_PFA.RegressionGP,input);
[p_npfa_ud,sd_npfa_ud,int_npfa_ud] = predict(N_UD_PFA.RegressionGP,input);

[p_npsa_els,sd_npsa_els,int_npsa_els] = predict(N_ELS_PSA.RegressionGP,input);
[p_npsa_ud,sd_npsa_ud,int_npsa_ud] = predict(N_UD_PSA.RegressionGP,input);


%% Figure
fh1=figure(1);
set(fh1,'color','white','Name','PMA');
fs=20; % font size
%% Graph Pisd ELS

sh=subplot(3,2,1);

pred=p_npisd_els;
int=int_npisd_els;

fill([(1:length(pred))';flipud((1:length(pred))')],[int(:,1);flipud(int(:,2))],[0.9 0.9 0.9]);
hold on
plot(1:length(pred),pred,'^','Color',[0.4,0.4,0.4],'MarkerEdgeColor',[0.4,0.4,0.4],'MarkerFaceColor',[0.4,0.4,0.4],'MarkerSize',10);
title('ELS');
lgd=legend('95% Confidence Level','Predicted Values','Location','best','Orientation','Horizontal');
legend('boxoff','FontSize',fs,'FontName','Times New Roman')
set(sh,'Box','off','TickDir','out','FontSize',fs,'FontName','Times New Roman');
%xlabel('Data Points');
ylabel('Norm. MPISD');
set(sh,'xlim',[0.0 100],'XTick',[0.0:10:100]);
% tix=get(gca,'Xtick')';
% set(gca,'xticklabel',num2str(tix,'%.1f'));
set(sh,'ylim',[0.0 2],'YTick',[0.0:0.4:2]);
tiy=get(gca,'Ytick')';
set(gca,'yticklabel',num2str(tiy,'%.1f'));

%% Graph Pisd UD

sh=subplot(3,2,2);

pred=p_npisd_ud;
int=int_npisd_ud;

fill([(1:length(pred))';flipud((1:length(pred))')],[int(:,1);flipud(int(:,2))],[0.9 0.9 0.9]);
hold on
plot(1:length(pred),pred,'^','Color',[0.4,0.4,0.4],'MarkerEdgeColor',[0.4,0.4,0.4],'MarkerFaceColor',[0.4,0.4,0.4],'MarkerSize',10);
title('UD');
lgd=legend('95% Confidence Level','Predicted Values','Location','best','Orientation','Horizontal');
legend('boxoff','FontSize',fs,'FontName','Times New Roman')
set(sh,'Box','off','TickDir','out','FontSize',fs,'FontName','Times New Roman');
set(sh,'xlim',[0.0 100],'XTick',[0.0:10:100]);
set(sh,'ylim',[0.0 2],'YTick',[0.0:0.4:2]);
tiy=get(gca,'Ytick')';
set(gca,'yticklabel',num2str(tiy,'%.1f'));

%% Graph Pfaa ELS
sh=subplot(3,2,3);

pred=p_npfa_els;
int=int_npfa_els;

fill([(1:length(pred))';flipud((1:length(pred))')],[int(:,1);flipud(int(:,2))],[0.9 0.9 0.9]);
hold on
plot(1:length(pred),pred,'^','Color',[0.4,0.4,0.4],'MarkerEdgeColor',[0.4,0.4,0.4],'MarkerFaceColor',[0.4,0.4,0.4],'MarkerSize',10);
lgd=legend('95% Confidence Level','Predicted Values','Location','best','Orientation','Horizontal');
legend('boxoff','FontSize',fs,'FontName','Times New Roman')
set(sh,'Box','off','TickDir','out','FontSize',fs,'FontName','Times New Roman');
ylabel('Norm. MPFAA');
set(sh,'xlim',[0.0 100],'XTick',[0.0:10:100]);
set(sh,'ylim',[0.0 2],'YTick',[0.0:0.4:2]);
tiy=get(gca,'Ytick')';
set(gca,'yticklabel',num2str(tiy,'%.1f'));

%% Graph Pfa UD

sh=subplot(3,2,4);

pred=p_npfa_ud;
int=int_npfa_ud;

fill([(1:length(pred))';flipud((1:length(pred))')],[int(:,1);flipud(int(:,2))],[0.9 0.9 0.9]);
hold on
plot(1:length(pred),pred,'^','Color',[0.4,0.4,0.4],'MarkerEdgeColor',[0.4,0.4,0.4],'MarkerFaceColor',[0.4,0.4,0.4],'MarkerSize',10);
lgd=legend('95% Confidence Level','Predicted Values','Location','best','Orientation','Horizontal');
legend('boxoff','FontSize',fs,'FontName','Times New Roman')
set(sh,'Box','off','TickDir','out','FontSize',fs,'FontName','Times New Roman');
set(sh,'xlim',[0.0 100],'XTick',[0.0:10:100]);
set(sh,'ylim',[0.0 2],'YTick',[0.0:0.4:2]);
tiy=get(gca,'Ytick')';
set(gca,'yticklabel',num2str(tiy,'%.1f'));

%% Graph Psa ELS
sh=subplot(3,2,5);

pred=p_npsa_els;
int=int_npsa_els;

fill([(1:length(pred))';flipud((1:length(pred))')],[int(:,1);flipud(int(:,2))],[0.9 0.9 0.9]);
hold on
plot(1:length(pred),pred,'^','Color',[0.4,0.4,0.4],'MarkerEdgeColor',[0.4,0.4,0.4],'MarkerFaceColor',[0.4,0.4,0.4],'MarkerSize',10);
lgd=legend('95% Confidence Level','Predicted Values','Location','best','Orientation','Horizontal');
legend('boxoff','FontSize',fs,'FontName','Times New Roman')
set(sh,'Box','off','TickDir','out','FontSize',fs,'FontName','Times New Roman');
xlabel('Data Points');
ylabel('Norm. MPFSAA');
set(sh,'xlim',[0.0 100],'XTick',[0.0:10:100]);
set(sh,'ylim',[0.0 2],'YTick',[0.0:0.4:2]);
tiy=get(gca,'Ytick')';
set(gca,'yticklabel',num2str(tiy,'%.1f'));

%% Graph Psa UD

sh=subplot(3,2,6);

pred=p_npsa_ud;
int=int_npsa_ud;

fill([(1:length(pred))';flipud((1:length(pred))')],[int(:,1);flipud(int(:,2))],[0.9 0.9 0.9]);
hold on
plot(1:length(pred),pred,'^','Color',[0.4,0.4,0.4],'MarkerEdgeColor',[0.4,0.4,0.4],'MarkerFaceColor',[0.4,0.4,0.4],'MarkerSize',10);
lgd=legend('95% Confidence Level','Predicted Values','Location','best','Orientation','Horizontal');
legend('boxoff','FontSize',fs,'FontName','Times New Roman')
set(sh,'Box','off','TickDir','out','FontSize',fs,'FontName','Times New Roman');
xlabel('Data Points');
set(sh,'xlim',[0.0 100],'XTick',[0.0:10:100]);
set(sh,'ylim',[0.0 2],'YTick',[0.0:0.4:2]);
tiy=get(gca,'Ytick')';
set(gca,'yticklabel',num2str(tiy,'%.1f'));