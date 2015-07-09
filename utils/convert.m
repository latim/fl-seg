function [X, labels] = convert(L, annotations, imagelist)

    X = zeros(size(annotations, 1), size(L{1}, 3));
    labels = zeros(size(annotations, 1), 1);
    mapobj = containers.Map(imagelist, 1:length(imagelist));
    
    % Loop through annotations, assigning features and labels
    for i = 1:length(labels)
        
        % Get the label
        labels(i) = annotations(i,4) + 1;
        
        % Get the features
        q = L{mapobj(annotations(i,3) + 1)}(annotations(i, 2) + 1 , annotations(i, 1) + 1, :);
        X(i,:) = q(:);
        
    end
        
end

