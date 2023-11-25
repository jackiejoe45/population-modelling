% Census data
censusyear = [1967, 1978, 1988, 2002, 2012];
censuspopulation = [12313469, 17512610, 23174335, 34443603, 44928923];

% Define the initial population and growth rate for the exponential model
N0 = 12313469;  % 1967 population
a = (log(censuspopulation(end)) - log(N0)) / (censusyear(end) - 1967);

% Define parameters for the logistic model
K = 2976857550; % Maximum population
N_logistic = K ./ (1 + ((K - N0) / N0) * exp(-a * (censusyear - 1967)));

% Create a time vector
t = 1967:2012;

% Calculate the exponential model predictions
N_exponential = N0 * exp(a * (t - 1967));

% Plot the census data, exponential model, and logistic model
figure;
plot(censusyear, censuspopulation, 'bo-', 'LineWidth', 2);
hold on;
plot(t, N_exponential, 'g--', 'LineWidth', 2);
plot(censusyear, N_logistic, 'r-', 'LineWidth', 2);
xlabel('Year');
xlim([1960 2020])
ylabel('Population');
title('Population Growth Models vs. Census Data');
legend('Census Data', 'Exponential', 'Logistic');
