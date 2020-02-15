% This script plots the figure of a typical linear combination of ReLU 
% function.

%%% Code for paper WIM, arxiv:1910.11248


w = 2 * rand(1, 10);
b = 2 * (rand(1, 10) - 0.5 );
x = linspace(-1, 1, 100);
y = zeros(1, 100);

for i = 1:100
    for j = 1:10
        y(i) = y(i) + ReLU(w(j) * (x(i) - b(j)));
    end
    y(i) = y(i)/10;
end

plot(x,y,'LineWidth',3)
hold on;
a = linspace(min(y) - 0.1, max(y) + 0.1, 100);
for j = 1:10
     b_ = ones(1, 100) * b(j);
     plot(b_, a, 'LineWidth',1);
     hold on;
end

axis([-1 1 min(y) - 0.1 max(y) + 0.1]);
set(gca,'XTick',[-1:0.2:1]);
set(gca,'FontSize',12);
xlabel('x','fontsize',15);
ylabel('y','fontsize',15);
l = legend('y(x;\theta)','b_1','b_2','b_3','b_4','b_5','b_6','b_7','b_8','b_9','b_{10}');
set(l,'Interpreter','tex');