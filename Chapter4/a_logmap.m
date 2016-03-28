clear all;close all;clc;

%% load the classification data
load logregdata.mat
%plot the data
subplot(1,3,1);
hold off
plot(X(1:20,1),X(1:20,2),'ko','markersize',10,'markerfacecolor','k');
hold on
plot(X(21:40,1),X(21:40,2),'ks','markersize',10,'linewidth',2);

%% Initisliase the parameters
w = repmat(0,2,1); % start at zero (w = [0 0]' )
tolerance = 1e-6;%stopping tolerance
Nits = 100;
w_all = zeros(Nits,2);%store evolution of w values
ss = 10;% prior variance on parameters of w
change  = inf;%change value = infinite
iteration = 0; %iteration count = 0
while change>tolerance & iteration <Nits
    prob_t =1./(1 + exp(-X * w));
    %Gradient
    grad = -(1/ss) * w' + sum(X.*(repmat(t,1,length(w)) - repmat(prob_t,1,length(w))),1);
    %Hessian
    H = -X'* diag(prob_t.*(1 - prob_t)) * X;
    H = H - (1/ss)*eye(length(w));
    %Update w
    w = w - inv(H) * grad';
    iteration = iteration + 1;
    w_all(iteration,:) = w';
    if(iteration > 1)
         change = sum((w_all(iteration,:) - w_all(iteration-1,:)).^2);
    end
end
w_all(iteration+1:end,:) = [];

%% plot the ecolution of w
subplot(1,3,2);
hold off
plot(w_all);
xlabel('Iterations');
ylabel('w');

%% Plot the probability contours
subplot(1,3,3);
hold off
plot(X(1:20,1),X(1:20,2),'ko','markersize',10,'markerfacecolor','k')
hold on
plot(X(21:40,1),X(21:40,2),'ks','markersize',10,'linewidth',2)
[Xv,Yv] = meshgrid(-5:0.1:5,-5:0.1:5);
Probs = 1./(1+exp(-(w(1).*Xv + w(2).*Yv)));
[cs,h] = contour(Xv,Yv,Probs);
clabel(cs,h);
fprintf('\nProbabilities are probabilities of belonging to the square class');
    