fourier_sigma(30, 2*pi, 2);

function fourier_sigma(Num, P, a) % I explain arguments in report
    % Print the real value of sigma result
    fprintf('Actual value of sigma 1/n^2 (pi^2/6) is : %f\n', pi^2/6);

    % Calculating the value of sigma 1/n^2 
    result = 0;
    for n = 1:Num
        result = result + 1/n^2;
    end
    % I print the real result and sigma result
    fprintf('Value of sigma 1/n^2 with first %d terms is : %f\n',Num, result); 
    
    % I define the original function f(x) = x^a
    f = @(x) x.^a;
    % Then calculate the half period L
    L = P / 2;

    % Now Compute the a0 (the average value of the function over one period)
    a0 = (1/P) * integral(@(x) f(x), -L, L);

    % These are arrays to store Fourier coefficients a_n and b_n
    a_n = zeros(1, Num);
    b_n = zeros(1, Num);

    % Now Calculate the Fourier coefficients a_n and b_n for n=1 to Num
    for n = 1:Num
        a_n(n) = (1/L) * integral(@(x) f(x) .* cos(pi * n * x / L), -L, L);
        b_n(n) = (1/L) * integral(@(x) f(x) .* sin(pi * n * x / L), -L, L);
    end

    % Create a range of x values for plotting
    x = linspace(-L, L, 1000);
    % It's the main part: At first I initialize the Fourier series approximation with the a0 term 
    F_sigma = a0;
    % Then add the first Nshow terms of the Fourier series to the
    % approximation (now we want to calculate f in x=pi , so we put pi
    % instead of x in Q21 code 
    for n = 1:Num
        F_sigma = F_sigma + a_n(n) * cos(pi * n * pi / L) + b_n(n) * sin(pi * n * pi / L);
    end
    
    % Finaly print result of sourier series
    fprintf('Fourier series in x = pi : %f\n', F_sigma);
    fprintf('So sigma 1/n^2 according to fouries series is : %f\n', (F_sigma - pi^2/3)/4);

    
end

