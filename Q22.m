fourier_ln(10, 8, 2, 4, 5);

% I change the function `fourier` and build function `fourier_ln`
function fourier_ln(Num, P, alpha, Beta, Nshow) % I explain arguments in report
    
    % I define the original function f(x) = x^(bate)*ln(alpha*x)
    f = @(x) (x.^Beta).* log(alpha .* x);
   
    % Then calculate the half period L
    L = P / 2;

    % Now Compute the a0 (the average value of the function over one period)
    a0 = (1/P) * integral(@(x) f(x), 0, P);
    
    % These are arrays to store Fourier coefficients a_n and b_n
    a_n = zeros(1, Num);
    b_n = zeros(1, Num);

    % Now Calculate the Fourier coefficients a_n and b_n for n=1 to Num
    for n = 1:Num
        a_n(n) = (1/L) * integral(@(x) f(x) .* cos(pi * n * x / L), 0, P);
        b_n(n) = (1/L) * integral(@(x) f(x) .* sin(pi * n * x / L), 0, P);
    end

    % Create a range of x values for plotting
    x = linspace(0, P, 1000);
    % It's the main part: At first I initialize the Fourier series approximation with the a0 term 
    F_s = a0 * ones(size(x));
    % Then add the first Nshow terms of the Fourier series to the approximation
    for n = 1:Nshow
        F_s = F_s + a_n(n) * cos(pi * n * x / L) + b_n(n) * sin(pi * n * x / L);
    end
    
    % Print the coefficients and the terms of the Fourier series
    fprintf('a0 is %f\n', a0);
    for n = 1:Nshow
        fprintf('%dth term of series is\n',n);
        fprintf('%f * cos(%d * pi * x / %d) + %f * sin(%d * pi * x / %d)\n', a_n(n), n, L, b_n(n), n, L);
    end
    
   
    % Plot the original function and the Fourier series approximation
    figure;
    fplot(@(x) f(x), [0 P], 'LineWidth', 1.5);
    hold on;
    plot(x, F_s, 'r', 'LineWidth', 1.5);
    legend('Actual Function', 'Fourier Series');
    xlabel('x');
    ylabel('Vertical Axis');
    title(['Fourier Series / x^', num2str(Beta),'ln(', num2str(alpha) ,'x) / ', num2str(Nshow), ' terms used in plot']);
    grid on;
    hold off;
    
end

