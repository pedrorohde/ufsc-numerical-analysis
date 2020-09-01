function Abnovo = ajusteMatrizPivotMax(Ab,linha,coluna)
%Determina dimensão da matriz Ab
[n m] = size(Ab);
%Percorre as linhas da matriz desde a linha de interesse até n, encontrando
%o max aij
pivotMax         = Ab(linha,coluna);
posLinhaPivotMax = linha;
for(i=linha+1:n)        
    if(abs(Ab(i,coluna)) > abs(pivotMax))
        posLinhaPivotMax = i;
        pivotMax = Ab(i,coluna);
    end  
end
Abnovo = Ab;
%Intercambio de posição de linhas
Abnovo(linha,:) = Ab(posLinhaPivotMax,:);
Abnovo(posLinhaPivotMax,:) = Ab(linha,:);
end