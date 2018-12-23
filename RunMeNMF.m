clear all; clc; close all;
load exemplenmf1.mat;
W0= rand(6,2);
H0=rand(2,6);

timelimit=10;
[W,H,e,t]=nmf_FedeFarid(X,W0,H0,timelimit);

%Graphes de l'erreur
semilogy(t,e);