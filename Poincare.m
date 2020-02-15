function [ ] =  Poincare( sigma, num_p, num_s )
% This function study the dynamics of our Wasserstein 
% natural gradient algorithm, especially the one that
% is concerned with our Poincare inequality.

%%% Code for paper WIM, arxiv:1910.11248

    %num_p = 100;                       % number of parallel iterations
    %num_s = 10000;                     % number of iterations     
    theta = zeros(num_s,num_p);
    theta(99,:) = 19.99;

    for t = 100:num_s
        x = randn(1,num_p) + 20;
        theta(t,:) = theta(t - 1,:) + (x - theta(t - 1,:))/(sigma * sigma * t);
    end

    %print "Finish Iteration!";

    plot(log(100:num_s),log(mean(abs(20 - theta(100:num_s,:)),2)) .* 2);
    set(gcf,'outerposition',get(0,'screensize'));
    set(gca,'fontsize',20,'fontname','Times');
    title("Gaussian Family with reference measure (\mu,\sigma)=(20," + sigma + ")");

    xlabel('Log Number of Interation');
    ylabel("Log of Wasserstein Covariance");
    grid on;
    
    print(figure(1), "Poincare-" + sigma +  "-" +  num_p + "-log.jpg" , '-djpeg', '-r500');

end