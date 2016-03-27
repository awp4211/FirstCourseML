clear all;close all;clc;

load coin_data

%% Plot the prior density
alpha = 50;
beta = 50;
fprintf('\nPrior parameters: alpha: %g, beta: %g',alpha,beta);
r = [0:0.01:1];
subplot(2,2,1);
plot(r,betapdf(r,alpha,beta));
xlabel('r');
ylabel('p(r)');

%% Incorporate the data one toss at a time
post_alpha = alpha;
post_beta = beta;
ch = {'T','H'};
toss_string = [];
subplot(2,2,2);
for i = 1:length(toss_data)
    %%
   toss_string = [toss_string ch{toss_data(i)+1}];
   figure(1);hold off
   plot(r,betapdf(r,post_alpha,post_beta),'k--');    
   post_alpha = post_alpha + toss_data(i);
   post_beta = post_beta + 1 - toss_data(i);
   hold on
   plot(r,betapdf(r,post_alpha,post_beta),'k');
   legend('Previous posterior','New posterior');
   ti = sprintf('Posterior after %g',i);
   title(ti);
   xlabel('r');ylabel('p(r|...)');
end

%% Incorporate another ten
subplot(2,2,3);
figure(1);hold off
plot(r,betapdf(r,post_alpha,post_beta),'k--');
hold on
N = length(toss_data2);
post_alpha = post_alpha + sum(toss_data2);
post_beta = post_beta + N - sum(toss_data2);
plot(r,betapdf(r,post_alpha,post_beta),'k');
legend('Posterior after 10','Posterior after 20');
xlabel('r');ylabel('p(r|...)');

%% Incorpoate another 1000
subplot(2,2,4);
figure(1);hold off
plot(r,betapdf(r,post_alpha,post_beta),'k--');
hold on
N = length(big_data);
post_alpha = post_alpha + sum(big_data);
post_beta = post_beta + N - sum(big_data);
plot(r,betapdf(r,post_alpha,post_beta),'k');
legend('Posterior after 20','Posterior after 1020');
xlabel('r');ylabel('p(r|...)');
