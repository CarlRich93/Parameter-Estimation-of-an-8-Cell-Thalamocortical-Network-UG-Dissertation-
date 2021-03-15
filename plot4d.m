clear all; close all; clc;
                              
g_R = [7.21e-02, 3.76e-01, 6.11e-02, 6.70e-02, 5.99e-02, 3.47e-01, 5.53e-02, 4.77e-01,...
       3.18e-01, 3.06e-01, 5.56e-02, 4.02e-01]';
g_L = [1.68e-01, 2.01e-01, 1.54e-01, 1.60e-01, 1.48e-01, 1.43e-01, 1.36e-01, 1.36e-01,...
       1.33e-01, 1.43e-01, 1.33e-01, 1.30e-01]';
tau = [3.16e+00, 2.07e+00, 4.46e+00, 4.02e+00, 5.47e+00, 6.86e+00, 9.73e+00, 1.00e+01,...
       1.75e+01, 6.39e+00, 1.43e+01, 1.70e+01]';
loss = [71362.52, 396321.7, 47154.11, 54111.12, 45792.49, 381327.1, 57610.64,...
       525680, 402833.7, 338582.2, 68494.58, 483741.1]';

figure;
scatter3(g_R, g_L, tau, 40, loss, 'filled')    % draw the scatter plot
% 40 is marker size
% Loss is marker colour
axis([0 0.6 0 0.6 0 20])
view(-31,14);
ax = gca;
ax.FontSize = 10;
xlabel('Maximal RE GABA conductance');
ylabel('Maximal LTS GABA conductance');
zlabel('GABA synaptic time constant');
title('Located Minimums of Baseline Objective Function');
cb = colorbar; % create and label the colorbar
cb.Label.String = 'Loss';

g_R_SFAO = [1.66e-01, 2.14e-01, 1.32e-01, 3.60e-01, 7.83e-02, 1.86e-01, 1.26e-01, 1.65e-01,...
    1.52e-01, 4.05e-01, 2.72e-01, 5.57e-01]';
g_L_SFAO = [4.81e-01, 5.35e-01, 4.79e-01, 4.59e-01, 4.93e-01, 4.47e-01, 4.62e-01, 5.71e-01,...
    5.71e-01, 5.11e-01, 4.51e-01, 4.52e-01]';
tau_SFAO = [9.40e+00, 6.01e+00, 9.62e+00, 1.27e+01, 8.09e+00, 1.60e+01, 1.26e+01, 4.75e+00,...
    7.06e+00, 7.06e+00, 1.46e+01, 1.47e+01]';
loss_SFAO = [99321.46, 358640, 104142.2, 179414.9, 211997.1, 49534.01, 81689.39, 655580.5,...
    4151277, 307471.6, 150515.6, 291367.1]';

figure;
scatter3(g_R_SFAO, g_L_SFAO, tau_SFAO, 40, loss_SFAO, 'filled')    % draw the scatter plot
% 40 is marker size
% Loss is marker colour
axis([0 0.6 0 0.6 0 20])
view(-31,14);
ax = gca;
ax.FontSize = 10;
xlabel('Maximal RE GABA conductance');
ylabel('Maximal LTS GABA conductance');
zlabel('GABA synaptic time constant');
title({'Located Minimums of Strong Frontal Alpha Oscillations', 'Objective Function'});
cb = colorbar; % create and label the colorbar
cb.Label.String = 'Loss';