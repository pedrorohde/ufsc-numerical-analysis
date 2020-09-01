clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %  GRADEINTE CONJUGADO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Dados de entrada

% % Exemplo 1 - Sistema 2x2 graficar
A = [3   2 ;
     2   4];
 
b =  [7;
      3];
  
x1 = 2:0.1:4;
x2 = -2:0.1:2;

[X1,X2] = meshgrid(x1,x2);
Z = A(1,1)*X1.^2 + A(1,2)*X1.*X2 + A(2,1)*X1.*X2 + A(2,2)*X2.^2 - 2*X1.*b(1)- 2*X2.*b(2);

figure
contour(X1,X2,Z,'ShowText','on')
figure
surf(X1,X2,Z)
colorbar
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


% % Exemplo 2 - Sistema 2x2 graficar
% A = [45   17 ;
%      17   22];
%  
% b =  [7;
%       3];
%  
% x1 = -5:0.1:5;
% x2 = -5:0.1:5;
% 
% [X1,X2] = meshgrid(x1,x2);
% Z = A(1,1)*X1.^2 + A(1,2)*X1.*X2 + A(2,1)*X1.*X2 + A(2,2)*X2.^2 - 2*X1.*b(1)- 2*X2.*b(2);
% 
% figure
% contour(X1,X2,Z,'ShowText','on')
% figure
% surf(X1,X2,Z)
% colorbar

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% % Exemplo 3 - Sistema 3x3 slides
% A = [4   3   0;
%      3   4  -1;
%      0  -1   4];
%  
% b =  [24;
%       30;
%      -24];
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %  

% % Exemplo 3 - Sistema 10x10 
% A = [40   3   4   5  2    6   1   8   9   7;
%      3   29   1   3  2    1   4   2   0   3;
%      4    1  15   9  7    5   3   2   5   1;
%      5    3   9  17   2   3   7   6   0   5;
%      2    2   7   2  32   4   8   0   4  10;
%      6    1   5   3   4  19   2   7   9   4;
%      1    4   3   7   8   2  27   1   8   0;
%      8    2   2   6   0   7   1  41   2   4;
%      9    0   5   0   4   9   8   2  15   3;
%      7    3   1   5  10   4   0   4   3   20];
% 
% b =  [24;
%       30;
%      -24;
%        2;
%        7;
%        100;
%        34;
%        -8;
%        98;
%        23];
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %  

autovalores = eig(A);

[m n] = size(A);
x =  zeros(n,1);
tolerancia = 1e-6; 

% % Algoritmo
ite = 1;

rk_1 = b - A*x;
vk = rk_1;
tic
while(true)
     
    tk = rk_1'*rk_1 / (vk'*A*vk); %Mínimo na direção vk
    x  = x + tk*vk;               %Nova aproximação para x
    
    rk = rk_1-tk*A*vk;            %Resíduo atualizado
    
%   Teste de convergência
    if(norm(rk,2) < tolerancia)
        break;
    end
    
    sk = rk'*rk/(rk_1'*rk_1);
    
    vk = rk + sk * vk;            %Direção conjugada   
    rk_1 = rk;
    
    ite = ite + 1;                %Contador iterações
    
end
tempo = toc

ite
x

