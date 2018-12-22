function [x,e]=acceleratedgradient1(Q,c,p,x0,maxiter)
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
  x= y_k = x0;
  alpha=0.5; %valeur initiale de alpha
	
  for i=1:maxiter
    %Calculs des paramètres
    alpha_n=0.5*(sqrt(alpha^4 + 4*alpha^2)-alpha^2);
    b_k = (alpha*(1-alpha))/((alpha^2)+alpha_n);
    
    %Calculs des points : 
    
    x_n = y_k-(1/L)*(Q*y_k-c);
    y_k = x_n + b_k *(x_n-x);
    x=x_n;
    alpha=alpha_n;
    %Calcul de l'erreur
    e(i) = 0.5*x'*Q*x-c'*x+p;
  end
end
