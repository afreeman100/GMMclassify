function [ mean ] = calcMean( in )
    column = 1:size(in, 2);
    mean = sum(in(:,column)) / length(in(:,column));

end

