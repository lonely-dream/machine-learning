function Y = prior(phenotype_network, phenotype_number, similar_phe_num, g_p_network, IX_col)

    [~,ix]=sort(phenotype_network,2,'descend', 'MissingPlacement','last');
    similar_phenotypes=ix(:,1:similar_phe_num+1);
    similar_phenotypes=similar_phenotypes(:,2:similar_phe_num+1);
    Y=g_p_network;

    for i=1:phenotype_number
        for j=1:similar_phe_num
            if ismember(similar_phenotypes(i,j),IX_col) == 1
                gene = find(g_p_network(:,similar_phenotypes(i,j))==1);
                Y(gene,i) =Y(gene,i)+phenotype_network(i,similar_phenotypes(i,j))/similar_phe_num;
            end
        end
    end
    Y=Y./sum(Y);
    fprintf("Part 2 over\n");

end