function [ bestN ] = featureLength(from, to)
% Determine best feature vector length in given range
% Currently, between 1 and 100 , it is found to be 8

bestN = 0;
bestP = -inf;

for N = from:to
    train('images/train', N);
    P = test('images/test');

    if P > bestP
        bestN = N;
        bestP = P;
    end
end

end

