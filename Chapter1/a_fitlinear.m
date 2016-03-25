clear all;
close all;
clc;

%% 最小二乘法
% t = w0 + w1*x;

%% Define Data
x = [1;3;5];
t = [4.8;11.1;17.2];
N = length(x);

%% Compute the various averages
m_x = sum(x)/N;
m_t = sum(t)/N;
m_xt = sum(x.*t)/N;
m_xx = sum(x.*x)/N;

%% Compute w1 (gradient)
w_1 = (m_xt - m_x * m_t)/(m_xx - m_x^2);
w_0 = m_t - w_1 * m_x;

%% Plot data
figure(1);hold off
plot(x,t,'bo','markersize',10,'linewidth',2);
xplot = [0 6];
xlim(xplot);
hold on
plot(xplot,w_0 +w_1 * xplot,'r','linewidth',2);
xlabel('x');
ylabel('t');