function [classname] = classify(imagepath)

    % Load the model that was created in training
    load('models');
    N = length(models(1).mean);

    % Get features of the shape to classify, using same number of features
    % as the training used
    features = getFeatures(imagepath, N);

    maxscore = -inf;
    %Determine which class the features are most likely to belong to
    for idx = 1:length(models)
        model = models(idx);

        mu = model.mean';
        C = model.cov;

        t1 = log(model.prior);
        t2 = 0.5*log(det(C));
        t3 = 0.5*(features-mu);
        t4 = 0.5*(features-mu)';
        
        score = t1 -t2 - t3*inv(C)*t4;

        % See if this is highter than the score of the current best class
        if score > maxscore
            maxscore = score;
            bestclass = idx;
        end
    end
    classname = classes(bestclass);
end