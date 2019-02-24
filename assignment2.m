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

%%%%% Part 1 - A %%%%%
nx = 75;
V0 = 1; 
V = numeric1D(nx, V0, 0);
f_p1a_numeric = figure();
hold on;
plot(V);
ylabel('Voltage (V)');
xlabel('x');
xlim([0 nx]);

%%%%% Part 1 - B %%%%%
nx = 75;
ny = 50;
V0 = 1; 
cMap = conductionMap(nx, ny, 1, 1E-2, 0, 0);

V_numeric = numeric(nx, ny, cMap, V0, V0, 0, 0);
V_analytic = analytic(nx, ny, V0, 50);

% Numeric plot
f_p1b_numeric = figure();
hold on;
surf(linspace(0,1.5,ny), linspace(0,1,nx), V_numeric,'EdgeColor','none','LineStyle','none');
shading interp 
xlabel('x');
ylabel('y');
zlabel('Voltage (V)');
view([120 25]);

% Analytic plot
f_p1b_analytic = figure();
hold on;
surf(linspace(0,1.5,ny), linspace(0,1,nx), V_analytic,'EdgeColor','none','LineStyle','none');
shading interp 
xlabel('x');
ylabel('y');
zlabel('Voltage (V)');
view([120 25]);

%%%%% Part 2 - A %%%%%
nx = 75;
ny = 50;
V0 = 1; 
f_p2a_cMap = figure();
hold on;
cMap = conductionMap(nx, ny, 1, 1E-2, 20, 10);
surf(linspace(0,1.5,ny), linspace(0,1,nx), cMap,'EdgeColor','none','LineStyle','none');
shading interp 
xlabel('x');
ylabel('y');
zlabel('Conduction (Mho)');
view([120 25]);

%generateReport(f_p1a_numeric, f_p1b_numeric, f_p1b_analytic);
close(f_p1a_numeric);
%close(f_p1b_numeric);
close(f_p1b_analytic);
close(f_p2a_cMap);
