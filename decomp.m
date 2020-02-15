% This function plot the figure of the density function and scoer function
% associated with the Gaussian mixture models

%%% Code for paper WIM, arxiv:1910.11248
    
    X = linspace(-5, 5, 1000);
    rho = normpdf(X, -3, 0.3) * 0.3 + normpdf(X, 3, 0.2) * 0.7;
    F = normcdf(X, -3, 0.3) - normcdf(X, 3, 0.2);
    
    plot(X,rho,'r','LineWidth',5);
    hold on;
    plot(X,F,'g','LineWidth',5);
    set(gcf,'outerposition',get(0,'screensize'));
    set(gca,'fontsize',20,'fontname','Times');
    title("Gaussian mixture family with parameter (\mu_1,\sigma_1^2)=(-3, 0.3), (\mu_2,\sigma_2^2)=(3, 0.2)");
    
    xlabel('x');
    ylabel('y');
    legend('0.3\rho_1 + 0.7\rho_2','F_1 - F_2');
    grid on;
    
    print(figure(1),"decomp.jpg" , '-djpeg', '-r500');