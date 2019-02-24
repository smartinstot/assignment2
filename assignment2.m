%%%%%%%%%%%% ELEC 4700 Assignment - 2 Finite Difference Method %%%%%%%%%%%%
%                           By David Bascelli                             %
%                           Febuary 24th, 2019                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath code;
clear;
global C;
clear;

% Physical constants
C.q_0 = 1.60217653e-19;             % electron charge
C.hb = 1.054571596e-34;             % Dirac constant
C.h = C.hb * 2 * pi;                    % Planck constant
C.m_0 = 9.10938215e-31;             % electron mass
C.kb = 1.3806504e-23;               % Boltzmann constant
C.eps_0 = 8.854187817e-12;          % vacuum permittivity
C.mu_0 = 1.2566370614e-6;           % vacuum permeability
C.c = 299792458; % speed of light

% Global constants
nx = 75;
ny = 50;
V0 = 1; 

V = numeric(nx, ny, ones(nx, ny), V0, V0, 0, 0);

f = figure();
hold on;
surf(V,'EdgeColor','none','LineStyle','none','FaceLighting','phong');
%plot(E_plot(:,n));

%generateReport(f);