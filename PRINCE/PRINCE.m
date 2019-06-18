clear;clc;
%% Part 0 Init
% Load all data
load('ppi_network.mat');
load('g_p_network.mat');
load('phenotype_network.mat');

gene_number=size(ppi_network,1);
phenotype_number=size(phenotype_network,1);

phenotype_network=phenotype_network(:,2:phenotype_number+1);

IX_col=find(sum(g_p_network,1)>0);
c=0.5;
alpha=0.7;
similar_phe_num = 100;

ppi_pro = ppi_network./sum(ppi_network);
e = eye(gene_number);

p1 = walk(ppi_pro, e, 1 - c, ppi_pro);
Y = prior(phenotype_network, phenotype_number, similar_phe_num, g_p_network, IX_col)
F1 = walk(p1, Y, alpha, Y)

%% Part 4 Prioritize candidate genes for query
[~, genes] = sort(F1, 1, 'descend', 'MissingPlacement','last');
generes = genes(1:5, :);
fprintf("Part 4 over\n");

