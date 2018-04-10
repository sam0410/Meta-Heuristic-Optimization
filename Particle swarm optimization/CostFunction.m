function [ z ] = CostFunction( x )
%the cost function can modified for any other function

z= sum(x.*x);   %basic sphere function

end

