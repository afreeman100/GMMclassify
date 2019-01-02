function [ cov ] = calcCov( in )
%Returns covariance matrix

    means = calcMean(in);               %mean of each feature
    cov = zeros(size(in,2));            %empty matrix to hold covariance

    for i = 1:size(in,2)                %for each column (feature)
        for j = 1:size(in,2)            %all pairs of features

            fi = in(:,i) - means(i);    %subtract mean from each feature vector
            fj = in(:,j) - means(j);

            fij = fi.*fj;               %multiply together elements of the vectors
            c = sum(fij);               %sum to give covariance coefficient

            cov(i,j) = c;               %put coefficient into matrix       
        end
    end

    cov = cov./ size(in, 1);            %divide by number of observations of each feature

end

