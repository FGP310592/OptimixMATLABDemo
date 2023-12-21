%% Copyright (Optimix)
% Visit my web-site with online multi-method and multi-objective optimizer
% (https://optimix.onrender.com)
%% Clear
clear all %#ok<CLALL> 
close all
clc
%% Run
Sett.FlagGa  = true; % Set it to "true" to activate the GA calculations
Sett.FlagPso = true; % Set it to "true" to activate the PSO calculations
Sett.FlagGd  = false; % Set if to "true" to activate the GD calculations
[XBestGlobal,ObjFunBestGlobal,Data] = OptMix_v02_IterFam(Sett); % Run the GA
%% Post-processing
SSE = ObjFunBestGlobal;
AverageRelativeError = sqrt(SSE)/abs(mean(Data.Z(:,1)))/length(Data.Z(:,1));
%% Plotting
% Calculation
xmap = (-25+273.15:5:50+273.15)';
ymap = (0:0.1:2)';
[xmapgrid, ymapgrid] = meshgrid(xmap, ymap);
zmapgrid = 0 * xmapgrid;
for j = 1:1:length(xmap)
    for i = 1:1:length(ymap)
        zmapgrid(i,j) = Data.Function(XBestGlobal, [xmapgrid(i,j),ymapgrid(i,j)]);
    end
end
% Plot
figure;
surfc(xmapgrid, ymapgrid, zmapgrid, 'Linewidth', 1.5);
hold on;
scatter3(Data.X(:,1), Data.X(:,2), Data.Z(:,1), 'Linewidth', 1.5);
legend('Fitting', 'Experimental', 'Location', 'best');
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;