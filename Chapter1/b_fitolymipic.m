clear all;close all;clc;

load data/olympics.mat

%% load data and compute average
%male 100m data
x = male100(:,1);%Olympic years
t = male100(:,2);%Winning times
N = length(x);
m_x = sum(x)/N;
m_t = sum(t)/N;
m_xx = sum(x.*x)/N;
m_xt = sum(x.*t)/N;

%% compute the weight values
w_1 = (m_xt - m_x * m_t)/(m_xx - m_x * m_x);
w_0 = m_t - w_1 * m_x;

%% plot the data
figure(1);hold off
plot(x,t,'bo','markersize',10,'linewidth',2);
xplot = [min(x)-4 max(x)+4];
xlim(xplot);
hold on
plot(xplot,w_0 + w_1 * xplot,'r','linewidth',2);
xlabel('Olympic year');
ylabel('Winning time');