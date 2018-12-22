clc;
clear all;
Q=[5,11;11,25]; %Définie positive
c=[1;2];
x0=[-2;0];
p=0;
 fprintf('Problème CD');
x=coordinatedescent(Q,c,p,x0,1500);
fprintf('La solution trouvée est ' ); x
fprintf('La vraie solution etait : ');
%vérification de la réponse
x_s=linsolve (Q , c)
A_1 = [1,0;1,3;1,4;1,7;1,8;1,10];
b_1 = [1;4;5;6;7;10];
x0_1= [0;0];
fprintf('Problème CD moindres carres ');
x=coordinatedescentLS(A_1,b_1,x0_1,120);
x3=coordinatedescentLSO(A_1,b_1,x0_1,120);
fprintf('La solution trouvée est ' ); x, x3
fprintf('La vraie solution etait : ');
%vérification de la réponse
x_s2 = linsolve ((A_1'*A_1), (b_1'*A_1)')