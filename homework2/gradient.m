function [x,e]=gradient(Q,c,p,x0,maxiter)
  % Entrées :
  % Q est une matrice n x n
  % c est un vecteur n x 1
  % p est un scalaire
  % x0 est l'itéré initial (vecteur n x 1)
  % maxiter est le nombre d'itérations à effectuer
  
  % Sorties :
  % x est vecteur n x 1
  % e est vecteur maxiter x 1
  
  L = max(eig(Q));
  x = x0; %itéré initial
  d=c-Q*x0; %direction initale
  for i=1:maxiter
    
    x_n=x+(1/L)*d; %calcule de nouvel itéré
    x=x_n; %nouvel itéré
    d=c-Q*x; %nouvelle direction
    %Calcul de l'erreur
    e(i) = 0.5*x'*Q*x-c'*x+p;
  end
end
