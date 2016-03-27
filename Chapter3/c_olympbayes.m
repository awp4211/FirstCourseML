clear all;close all;clc;

%% load data and process data
load olympics

x = male100(:,1);
t = male100(:,2);
x = x - x(1);
x = x./4;

%% Define sprior destiny
mu0 = [0;0];% mean
si0 = [100 0;0 5]; %variance
ss = 2;
%%%%asidohasgiuhsdfpg

w = gauss(mu0,si0);
X = [x.^0 x.^1];
%plot the data and the function
figure(1);
hold off
plot(x,t,'bo','markersize',10);
hold on
x1 = xlim;
y1 = ylim;
for i = 1:10
    plot(x,X * w(i,:)','r');
end
xlim(x1);
ylim(y1);