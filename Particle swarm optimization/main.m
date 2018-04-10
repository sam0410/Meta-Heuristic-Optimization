%Main Function of PSO

%% Contriction Coefficients
phi1=2.05;
phi2=2.05;
phi= phi1+phi2;
kappa=1;
psi= (2*kappa)/abs(2-phi-sqrt(phi^2 - 4*phi));
%% Defining parameters of PSO
params.numvar=5;                                  
params.numswarm=50;                               
params.iter=1000;                                 
params.minvar=-10*ones(1,params.numvar);                 
params.maxvar=10*ones(1,params.numvar);                  
params.w=1;                                       
params.c1=psi*phi1;                                      
params.c2=psi*phi2; 
params.wdamp=0.98;


%% optimised position
Xfinal=pso( params )