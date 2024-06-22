% Example data
x = [0, pi/3, 2*pi/3, pi, 4*pi/3, 5*pi/3, 2*pi];
f_x = [1, 1.4, 1.9, 1.7, 1.5, 1.2, 1];

% Call the function
fourier_series_approx(x, f_x, 1);
fourier_series_approx(x, f_x, 2);
fourier_series_approx(x, f_x, 3);
fourier_series_approx(x, f_x, 4);

function fourier_series_approx(x, f_x, num_harmonics)
    % Number of sample points
    N = length(x);

    % Initialize Fourier coefficients
    A0 = (2/N) * sum(f_x);
    An = zeros(1, num_harmonics);
    Bn = zeros(1, num_harmonics);

    % Calculate An and Bn for n = 1 to num_harmonics
    for n = 1:num_harmonics
        cos_sigma = 0;
        sin_sigma = 0;
        for i = 1: N
            cos_sigma = cos_sigma + (f_x(i) * cos(n * x(i)));
            sin_sigma = sin_sigma + (f_x(i) * sin(n * x(i)));
        end
        An(n) = (2 * cos_sigma) / n;
        Bn(n) = (2 * sin_sigma) / n;
    end
    
    % print fourier seri, term by term to selected harmonic
    fprintf('Fourier seri, from first Harmonic to %dth Harmonic: \n', num_harmonics);
    fprintf('f(x) = %f', A0 / 2);
    for n = 1:num_harmonics
        fprintf(' + (%f)cos(%dx) + (%f)sin(%dx) ', An(n), n, Bn(n), n);
    end
    fprintf('\n')
    
    % Construct the Fourier series approximation
    syms X;
    f_approx = A0 / 2;
    for n = 1:num_harmonics
        f_approx = f_approx + An(n) * cos(n*X) + Bn(n) * sin(n*X);
    end
    
    % Create a dense grid for plotting the approximation
    x_dense = linspace(x(1) - 2   , x(end) + 2, 1000);
    f_approx_func = matlabFunction(f_approx, 'vars', X);
    f_approx_values = f_approx_func(x_dense);
    
    % Plot the original points and Fourier series approximation
    figure;
    plot(x, f_x, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'Data points');
    hold on;
    plot(x_dense, f_approx_values, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Fourier series approximation');
    legend show;
    xlabel('x');
    ylabel('f(x)');
    title(['Fourier Series Approximation with ', num2str(num_harmonics), ' Harmonics']);
    grid on;
    hold off;
end
