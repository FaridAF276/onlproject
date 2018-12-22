clear all; clc;
load donnees.mat;

maxiter=10;
[x_0,e_0]=gradient(Q,c,p,x0,maxiter);
[x_1,e_1]=acceleratedgradient1(Q,c,p,x0,maxiter)
[x_2,e_2]=acceleratedgradient2(Q,c,p,x0,maxiter)

%Solutions optimales
xopt=Q\c;
fopt = 0.5*xopt'*Q*xopt-c'*xopt+p;

%Graphes des erreurs
semilogy(1:maxiter,abs(e_0-fopt),'b'); hold on; %courbe bleue gradient
semilogy(1:maxiter,abs(e_1-fopt)); hold on; %courbe bleueu clair acc1
semilogy(1:maxiter,abs(e_2-fopt),'r'); hold on;%courbe rouge acc2
