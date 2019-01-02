function [ pCorrect ] = test( testdir )

    load('models.mat');
    classes = getClasses(testdir);
    
    n = length(classes);
    confusion = zeros(n, n);
    
    % For every class
    for i = 1:n
        
        % Get all images of that class
        imagelist = dir(sprintf('%s/%s*.gif', testdir, classes{i}));
        
        % Classify each image
        for j = 1:length(imagelist)
            imagepath = sprintf('%s/%s', testdir, imagelist(j).name);
            classification = classify(imagepath);
            
            % Increment corresponding row in confusion matrix
            for k = 1:n
                if strcmp(classes{k}, classification)
                    confusion(i,k) =  confusion(i,k) + 1;
                end
            end 
        end
    end
    
    % Normalise confusion matrix so elements sum to 1
    con = confusion./getNumImages(testdir)
    % Sum diagonal to give the fraction of images that have been correctly
    % classified
    pCorrect = sum(diag(con));

end

