% Individual Mutation Operator
function Genes = IndividualMutation(Genes, Pm)
% Mutation on each individual
    [row, col] = size(Genes);
    for i=1:row
        if rand < Pm
            j = randi([1, col]);
            Genes(i,j) = ~Genes(i,j);
        end
    end
end