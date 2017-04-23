% Bit Mutation Operator
function Genes = BitMutation(Genes, Pm)
% Mutation on each bit
    [row, col] = size(Genes);
    for i=1:row*col
        if rand < Pm
            Genes(i) = ~Genes(i);
        end
    end
end