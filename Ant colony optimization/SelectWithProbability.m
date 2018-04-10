function [ y ] = SelectWithProbability( x )
%standard way to choose a number with given probability
cumulative= cumsum(x);
r= rand();
y= find(r<=cumulative,1,'first');
end

