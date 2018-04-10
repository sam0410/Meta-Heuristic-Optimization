
population=10;
iterations=500;
numVariables=5;
VarSize=[1 numVariables];
VarMin=-10;
VarMax=10;
q=0.5;              % Intensification Factor (Selection Pressure)


ant.Position=[];
ant.Cost=[];
antColony= repmat(ant,population,1);

%% Initialisation
for i= 1: population
antColony(i).Position= unifrnd(VarMin,VarMax,VarSize);
antColony(i).Cost=CostFunction(antColony(i).Position);
end

[~, SortedPop]=sort([population.Cost]);
population=population(SortedPop);

BestSolution= population(1);
BestCostEveryIteration= zeros(iterations,1);

weights=1/(sqrt(2*pi)*q*population)*exp(-0.5*(((1:population)-1)/(q*population)).^2); %weights by ACO formula.
probability= weights/sum(weights);

for i= 1:iterations

    
    
[~, SortedPop]=sort([population.Cost]);
population=population(SortedPop);
BestSolution= population(1);
BestCostEveryIteration(i)=BestSolution.Cost;

end




