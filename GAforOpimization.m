% GA for unconstrained single-objective optimization
%   max F(x1,x2) = 21.5 + x1*sin(4*pi*x1) + x2*sin(20*pi*x2)
%   S.t.  -3.0 <= x1 <= 12.1
%          4.1 <= x2 <= 5.8
%   The precision required is 0.0001
%   
%   March 30, 2017, by HanzheTeng

% Parameters
clear variables
Pc = 0.25;      % Probability of CrossOver
Pm = 0.01;      % Probability of Mutation
PopSize = 1000;  % Population Size
Gen = 200;      % Generation
Len1 = 18;      % Bits of x1 
Len2 = 15;      % Bits of x2
tic

% Binary encoding initialization
Genes = logical(randi([0 1], PopSize, Len1+Len2));
BestGenes = zeros(Gen, Len1+Len2);
BestGenesEver = zeros(Gen, Len1+Len2);
BestGene = Genes(1,:);
BestGeneEver = Genes(1,:);
Fits = zeros(PopSize, 1);
BestFits = zeros(Gen, 1);
BestFitsEver = zeros(Gen, 1);
BestFit = 0;
BestFitEver = 0;
GenEver = 0;
point1 = zeros(Gen, 1);
point2 = zeros(Gen, 1);

% GeneticAlg
for i=1:Gen
    % compute fitness
    [x1,x2] = Decoding(Genes);
    Fits = Fitness(x1,x2);
    
    % save the best gene
    BestFit = max(Fits);
    GeneRow = find(Fits==BestFit,1); % save only the first index
    BestGene = Genes(GeneRow,:);
    BestFits(i) = BestFit;
    BestGenes(i,:) = BestGene(1,:);
    if BestFit > BestFitEver
        BestFitEver = BestFit;
        BestFitsEver(i) = BestFit;
        BestGeneEver(1,:) = BestGene(1,:);
        BestGenesEver(i,:) = BestGene(1,:);
        GenEver = i;
        point1(i) = x1(GeneRow);
        point2(i) = x2(GeneRow);
    else
        BestFitsEver(i) = BestFitEver;
        BestGenesEver(i,:) = BestGeneEver(1,:);
    end
    
    % Selection Operator
    Genes = RouletteSelection(Genes, Fits, PopSize);
    %Genes = TournamentSelection(Genes, Fits, PopSize);
    
    % CrossOver Operator
    Genes = CrossOver(Genes, Pc);
    
    % Mutation Operator
    Genes = BitMutation(Genes, Pm);
    %Genes = IndividualMutation(Genes, Pm);
end
toc

% plot preparation
dense = 50;
x1 = linspace(-3.0, 12.1, dense);
x2 = linspace(4.1, 5.8, dense);
F = zeros(40);
for i=1:dense
    for j=1:dense
        F(i,j) = Fitness(x1(i),x2(j));
    end
end
num = find(point1~=0);
p1 = point1(num);
p2 = point2(num);
FitEver = Fitness(p1,p2);
t = length(num);

% plot
figure(1)
surf(x1,x2,F)
hold on 
plot3(p1,p2,FitEver,'r.-')
plot3(p1(t),p2(t),F(t),'b*')
xlabel('x1')
ylabel('x2')
zlabel('F(x)')

figure(2)
plot(BestFits)
hold on 
grid on
plot(BestFitsEver,'r')
plot(GenEver,BestFitsEver(GenEver),'r*')
xlabel('Generation')
ylabel('F(x)')
title(['Generation = ',num2str(GenEver),'   F(x) = ',num2str(BestFitEver)])
