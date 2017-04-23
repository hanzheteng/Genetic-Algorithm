% Decoding
function [x1,x2] = Decoding(Genes)
    [row, ~] = size(Genes);
    d = zeros(row, 1);
    for i=1:18
        d = d + Genes(:,i)*2^(18-i);
    end
    x1 = d * (12.1+3.0) / 2^18 - 3.0;
    d = zeros(row, 1);
    for i=19:33
        d = d + Genes(:,i)*2^(15-(i-18));
    end
    x2 = d * (5.8-4.1) / 2^15 + 4.1;
end