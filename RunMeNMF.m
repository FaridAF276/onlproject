clear all; clc; close all;
load exemplenmf1.mat;
r=6;
W0= rand(6,r);
H0=rand(r,6);

timelimit=15;
[W,H,e,t]=nmf_FedeFarid(X,W0,H0,timelimit);

%Graphes de l'erreur
semilogy(t,e);
W*H