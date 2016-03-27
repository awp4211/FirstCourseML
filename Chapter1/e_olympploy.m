clear all;close all;clc;

%% 八阶多项式函数拟合


%% Load the Olympic data
load data/olympics.mat
x = male100(:,1);
t = male100(:,2);
x = x - x(1);
x = x./4;
%plot data
figure(1);hold off
plot(x,t,'bo','markersize',10);
xlabel('Olympic number');
ylabel('Winning time');

%% Linear model
plotx = [x(1) - 2:0.01:x(end)+2]';
X = [];
plotX = [];
for k = 0:1
    X = [X x.^k];
    plotX = [plotX plotx.^k];
end

w = inv(X' * X) * X' * t;

% plot the model
subplot(2,2,1);hold off
plot(x,t,'bo','markersize',10);
xlabel('Olympic number');
ylabel('Wining time');
hold on
plot(plotx,plotX * w,'r','linewidth',2);
title('Linear Model');

%% Quadratic model
plotx = [x(1)-2:0.01:x(end)+2]';
X = [];
plotX = [];
for k = 0:2
    X = [X x.^k];
    plotX = [plotX plotx.^k];
end

w = inv(X'*X)*X'*t;

% Plot the model
subplot(2,2,2);hold off
plot(x,t,'bo','markersize',10);
xlabel('Olympic number (note, not year!)');
ylabel('Winning time');
hold on
plot(plotx,plotX*w,'r','linewidth',2);
title('Quadtatic Model');

%% Quartic model
plotx = [x(1)-2:0.01:x(end)+2]';
X = [];
plotX = [];
for k = 0:4
    X = [X x.^k];
    plotX = [plotX plotx.^k];
end

w = inv(X'*X)*X'*t;

% Plot the model
subplot(2,2,3);hold off
plot(x,t,'bo','markersize',10);
xlabel('Olympic number (note, not year!)');
ylabel('Winning time');
hold on
plot(plotx,plotX*w,'r','linewidth',2)
title('Quartic Model');

%% 8th order model
plotx = [x(1)-2:0.01:x(end)+2]';
X = [];
plotX = [];
for k = 0:8
    X = [X x.^k];
    plotX = [plotX plotx.^k];
end

w = inv(X'*X)*X'*t;

% Plot the model
subplot(2,2,4);hold off
plot(x,t,'bo','markersize',10);
xlabel('Olympic number (note, not year!)');
ylabel('Winning time');
hold on
plot(plotx,plotX*w,'r','linewidth',2);
title('8th order Model');