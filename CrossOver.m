% CrossOver Operator
function Genes = CrossOver(Genes, Pc)
    [row, col] = size(Genes);
    for i=1:ceil(row/2)
        if rand > Pc
            continue
        end
        row1 = randi([1 row]);
        row2 = randi([1 row]);
        p1 = randi([1 col]);
        p2 = randi([1 col]);
        if p1 <= p2
            TempGene = Genes(row1,p1:p2);
            Genes(row1,p1:p2) = Genes(row2,p1:p2);
            Genes(row2,p1:p2) = TempGene(1,:);
        else
            TempGene = Genes(row1,1:p2);
            Genes(row1,1:p2) = Genes(row2,1:p2);
            Genes(row2,1:p2) = TempGene(1,:);
            TempGene = Genes(row1,p1:col);
            Genes(row1,p1:col) = Genes(row2,p1:col);
            Genes(row2,p1:col) = TempGene(1,:);
        end
    end
end