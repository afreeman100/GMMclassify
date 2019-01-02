function train(imagedir, N)
    %Train a GMM models uses shapes in imagedir using N features
    classes = getClasses(imagedir);
    totalImages = getNumImages(imagedir);
    for idx = 1:length(classes)
        class = classes{idx};
        models(idx).name = class;
        dataMatrix = getDataMatrix(imagedir, class, N);
        models(idx).mean = transpose(calcMean(dataMatrix));
        models(idx).cov = ensurePSD(calcCov(dataMatrix));
        models(idx).prior = getNumImagesForClass(imagedir, class) / totalImages;
    end
    save('models');
end