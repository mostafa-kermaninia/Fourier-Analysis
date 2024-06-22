% Define the first test case: cosine function
Fourier_Transform(@(t) cos(pi * t), 1000, [-2 2]);

% Define the second test case: constant function (all ones)
Fourier_Transform(@(t) ones(size(t)), 1000, [-2 2]);

% Define the third test case: delta function (approximated by a Kronecker delta)
Fourier_Transform(@(t) (t==0), 1000, [-2 2]);

% Function to analyze and plot the Fourier transform of a given function
function Fourier_Transform(f, freq, time)
    % Generate time vector from the given range with specified sampling frequency
    t = time(1):1/freq:time(2);

    % Evaluate the function handle at the time points
    x = f(t);

    % Plot the original function
    figure;  % Create a new figure
    plot(t, x);  % Plot the function
    title('Original Function');  % Set the title of the plot
    xlabel('Time');  % Label the x-axis
    ylabel('y');  % Label the y-axis

    % Compute the Fourier transform of the function
    X = fft(x);  % Compute the fast Fourier transform
    X_shifted = fftshift(X);  % Shift zero frequency component to the center
    f = (-length(X)/2:length(X)/2-1)*(freq/length(X));  % Frequency vector for plotting

    % Plot the Fourier transform
    figure;  % Create a new figure
    plot(f, abs(X_shifted));  % Plot the magnitude of the Fourier transform
    title('Fourier Transform');  % Set the title of the plot
    xlabel('Frequency (Hz)');  % Label the x-axis
    ylabel('Magnitude');  % Label the y-axis
end
