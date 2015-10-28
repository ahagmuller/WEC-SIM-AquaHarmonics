%% Simulation Data
simu = simulationClass();               %Create the Simulation Variable
      %Location of Simulink Model File
simu.simMechanicsFile =  'ah_6dof_rev2'
simu.endTime=60;                       %Simulation End Time [s]
simu.dt = 0.03;                          %Simulation Time-Step [s]
simu.rampT = 10;                       %Wave Ramp Time Length [s]

%% Wave Information
%% noWaveCIC, no waves with radiation CIC  
% waves = waveClass('noWaveCIC'); 

%% Regular Waves  
 waves = waveClass('regularCIC'); 
% % % % % % waves = waveClass('regular');        
% % %                                  %Create the Wave Variable and Specify Type
% % %                                  
 waves.H = 5;                          %Wave Height [m]
 waves.T =11;                            %Wave Period [s]

%% Irregular Waves using PM Spectrum with Convolution Integral Calculation
% waves = waveClass('irregular');       
% %                                %Create the Wave Variable and Specify Type
%  waves.H = 2.5;                        %Significant Wave Height [m]
%  waves.T = 10;                          %Peak Period [s]
%  waves.spectrumType = 'PM';

% Irregular Waves using BS Spectrum with State Space Calculation
%  waves = waveClass('irregular');       
% %                                %Create the Wave Variable and Specify Type
%  waves.H = 9;                        %Significant Wave Height [m]
%  waves.T = 8;                          %Peak Period [s]
%  waves.spectrumType = 'BS';
%  simu.ssCalc = 1;						%Control option to use state space model 

%% Irregular Waves using User-Defined Spectrum
% waves = waveClass('irregularImport');         
%                                %Create the Wave Variable and Specify Type
% waves.spectrumDataFile = 'ndbcBuoyData.txt';  
%                                   %Name of User-Defined Spectrum File [2,:] = [omega, Sf]

% %% User-Defined Time-Series
% waves = waveClass('userDefined');   %Create the Wave Variable and Specify Type
% waves.etaDataFile = 'umpqua46229_6_2008.mat';  % Name of User-Defined Time-Series File [:,2] = [time, wave_elev]

%% Body Data
body(1) = bodyClass('hydroData/rm3.h5',1);      
    %Create the body(1) Variable, Set Location of Hydrodynamic Data File 
    %and Body Number Within this File.        
body(1).mass =175000;                   
    %Body Mass. The 'equilibrium' Option Sets it to the Displaced Water 
    %Weight.
body(1).momOfInertia = [0.1012039E+08 0.1012038E+08 0.1845217E+08]; %FULL scale MOI

    %Moment of Inertia [kg*m^2]     
body(1).geometryFile = 'geometry/float.stl';    %Location of Geomtry File

% body(2) = bodyClass('hydroData/rm3.h5',2);     
% body(2).mass = 'equilibrium';                   
% body(2).momOfInertia = [94419614.57 94407091.24 28542224.82];
% body(2).geometryFile = 'geometry/plate.stl'; 

%% PTO and Constraint Parameters
constraint(1) = constraintClass('Constraint1'); 
                        %Create Constraint Variable and Set Constraint Name
constraint(1).loc = [0 0 -100];                    %Constraint Location [m]

% constraint(2) = constraintClass('Constraint2'); 
% %constraint(2).c=10000;                 %Create Constraint Variable and Set Constraint Name
% constraint(2).loc = [0 0 0];                    %Constraint Location [m]

pto(1) = ptoClass('PTO1');                      
                                      %Create PTO Variable and Set PTO Name
pto(1).k=0;                                     %PTO Stiffness [N/m]
pto(1).c=0; 
 pto(1).loc = [0 0 -100]; 
% pto(1).varc=100000;%PTO Daming [N/(m/s)]
%pto(1).c=1200000;                             % FULL SCALE DAMPING pto(1).c=1200000 default from RM3
pto(1).loc = [0 0 -100];                           %PTO Location [m]
ptogen.c=1.3438e8%692656%.0275e8;   %damping value
ptomotor.c=25000;         %winch force in newtons
% 
pto(2) = ptoClass('PTO2');                      
                                      %Create PTO Variable and Set PTO Name
pto(2).k=500;                                     %PTO Stiffness [N/m]
pto(2).c=300000;                               %PTO Daming [N/(m/s)]
pto(2).loc = [0 0 -2.5];                           %PTO Location [m]
% 
% pto(3) = ptoClass('PTO3');                      
%                                       %Create PTO Variable and Set PTO Name
% pto(3).k=0;                                     %PTO Stiffness [N/m]
% pto(3).c=20000000;                               %PTO Damping [N/(m/s)]
% pto(3).loc = [0 0 -3.5];                           %PTO Location [m]



%%


%%