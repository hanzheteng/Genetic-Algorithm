% Tournament Selection Operator
function NewGenes = TournamentSelection(Genes, Fits, PopSize)
    % Binary tournament
    NewGenes = Genes;
    for i=1:PopSize
        r1 = randi([1 PopSize]);
        r2 = randi([1 PopSize]);
        if Fits(r1) > Fits(r2)
            NewGenes(i,:) = Genes(r1,:);
        else
            NewGenes(i,:) = Genes(r2,:);
        end
    end
end
