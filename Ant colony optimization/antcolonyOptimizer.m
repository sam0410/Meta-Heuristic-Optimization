clear all;
clc;
population=10;
iterations=500;
numVariables=5;
SampleSize=40;
VarSize=[1 numVariables];
VarMin=-10;
VarMax=10;
q=0.5;              % Intensification Factor (Selection Pressure)
zeta=1;             % Deviation-Distance Ratio

ant.Position=[];
ant.Cost=[];
antColony= repmat(ant,population,1);

%% Initialisation
for i= 1: population
antColony(i).Position= unifrnd(VarMin,VarMax,VarSize);
antColony(i).Cost=CostFunction(antColony(i).Position);
end

[~, SortedPop]=sort([antColony.Cost]);
antColony=antColony(SortedPop);

BestSolution= antColony(1);
BestCostEveryIteration= zeros(iterations,1);

weights=1/(sqrt(2*pi)*q*population)*exp(-0.5*(((1:population)-1)/(q*population)).^2); %weights by ACO formula.
probability= weights/sum(weights);
%% Main Loop
for i= 1:iterations

 sigma= zeros(population,numVariables); %standard deviation
 
 for j=1:population
    stdDev=zeros(numVariables,1);
    for k=1:population
        stdDev=stdDev+abs(antColony(j).Position-antColony(k).Position);        
    end
    sigma(j,:)=stdDev*zeta/(population-1);
 end
 
 newColony= repmat(ant,SampleSize,1);
 
 for j=1:SampleSize
        newColony(j).Position=zeros(numVariables,1);
     for k=1:numVariables
         ind=SelectWithProbability( probability );
         newColony(j).Position(k)=  antColony(ind).Position(k) + sigma(ind,k)*randn;
     end
     newColony(j).Cost=CostFunction(newColony(j).Position);
 end
 
antColony=[antColony 
           newColony];
[~, SortedPop]=sort([antColony.Cost]);
antColony=antColony(SortedPop);

antColony=antColony(1:population);
BestSolution= antColony(1);
BestCostEveryIteration(i)=BestSolution.Cost;

end




