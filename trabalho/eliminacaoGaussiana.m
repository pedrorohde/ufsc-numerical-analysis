clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %  ELIMINAÇÃO GAUSSIANA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ab = [3  2  4  1;
      1  1  2  2;
      4  3 -2  3];

%Exercícios Sugeridos
% Ex a)
% Ab = [4 -1 1 8;
%       2  5 2 3;
%       1 2 4 11];
  
% Ex b)
% Ab = [4  1  2  9;
%       2  4 -1 -5;
%       1  1 -3 -9];
 
% Ex c)
% Ab = [1  -1 3  2;
%       3  -3 1 -1;
%       1   1 0  3];

% Ex d)
% Ab = [2  -1.5 3  1;
%       -1  0 2 3;
%       4  -4.5 5  1];

%Determina dimensão da matriz  
[n m] = size(Ab);
for(i=1:n-1)
    Ab = ajusteMatrizPivotMax(Ab,i,i);
    aii = Ab(i,i); %pivot    
    for(k=i+1:n)
        aki = Ab(k,i);
        m = aki/aii;        
        Ab(k,:) = Ab(k,:) - m* Ab(i,:);        
    end        
end
Ab