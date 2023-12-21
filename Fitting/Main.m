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
run('PostProcessing.p');