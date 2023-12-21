%% Copyright (Optimix)
% Visit my web-site with online multi-method and multi-objective optimizer
% (https://optimix.onrender.com)
%% Clear
clear all %#ok<CLALL> 
close all
clc
%% Run
% Run GA
Sett.FlagGa  = true;  % Set it to "true" to activate the GA calculations
Sett.FlagPso = false; % Set it to "true" to activate the PSO calculations
Sett.FlagGd  = false; % Set if to "true" to activate the GD calculations
Sett.NumPar = 50; % Set the number of particles of each family
Sett.NumFam = 5;  % Set the number of families (the optimization algorithm is restarted for Sett.NumFam times and only the optimal one is considered)
Sett.NumIterMax = 200; % Set the maximum number of iterations
[XBestGlobalGa,ObjFunBestGlobalGa,~] = OptMix_v02_FamIter(Sett); % Run the GA
% Run PSO
Sett.FlagGa  = false; % Set it to "true" to activate the GA calculations
Sett.FlagPso = true;  % Set it to "true" to activate the PSO calculations
Sett.FlagGd  = false; % Set if to "true" to activate the GD calculations
Sett.NumPar = 50; % Set the number of particles of each family
Sett.NumFam = 5;  % Set the number of families (the optimization algorithm is restarted for Sett.NumFam times and only the optimal one is considered)
Sett.NumIterMax = 200; % Set the maximum number of iterations
[XBestGlobalPso,ObjFunBestGlobalPso,~] = OptMix_v02_FamIter(Sett); % Run the PSO
% Run GD
Sett.FlagGa  = false; % Set it to "true" to activate the GA calculations
Sett.FlagPso = false; % Set it to "true" to activate the PSO calculations
Sett.FlagGd  = true;  % Set if to "true" to activate the GD calculations
Sett.NumPar = 10; % Set the number of particles of each family
Sett.NumFam = 5;  % Set the number of families (the optimization algorithm is restarted for Sett.NumFam times and only the optimal one is considered)
Sett.NumIterMax = 25;
[XBestGlobalGd,ObjFunBestGlobalGd,Data] = OptMix_v02_FamIter(Sett); % Run the GD
%% Post processing
run('PostProcessing.p');