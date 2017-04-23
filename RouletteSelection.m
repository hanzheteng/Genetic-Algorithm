% Roulette Wheel Selection Operator
function NewGenes = RouletteSelection(Genes, Fits, PopSize)
    % Cumulative Probability
    CumuProb = zeros(1,PopSize);
    for i=1:PopSize
        CumuProb(i) = sum(Fits(1:i));
    end
    MaxProb = CumuProb(PopSize);
    % New Genes
    NewGenes = Genes;
    for j=1:PopSize
        P = rand * MaxProb;
        Ind = find(CumuProb > P,1); % return only the first index
        NewGenes(j,:) = Genes(Ind,:);
    end
end
