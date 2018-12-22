function x=coordinatedescent(Q,c,p,x0,maxiter)
  clc;
  % Entrées :
  % Q est une matrice n x n semi définie positive
  % c est un vecteur n x 1
  % p est un scalaire
  % x0 est l'itéré initial (vecteur n x 1)
  % maxiter est le nombre d'itérations à effectuer
  
  % Sortie :
  % x est vecteur n x 1
  precision = 10^-5
    x=x0;
  constraint = zeros(length(x0),1);
  for i=1:maxiter
    xi=x;
    %itéré précédent
    j=mod(i, length(x))+1;

   %on s'en débarasse de x(i) en l'égalisant à 0 pour ainsi ne pas je faire  apparaitre Q(j,j)*x(j)² dans le calcul
     % de new_x
    x(j)=0;
    %La mise à jour à effectuer
    new_x = (c(j) - 0.5 *x'*Q(:,j) - 0.5 *Q(j,:)*x)/Q(j,j);
    if (new_x < constraint(j))
      x(j)=constraint(j);
    else
      x(j)=new_x; %new_x est la valeur optimale pour x(j)
    endif
    %Si les itérés sont suffisement proches les uns des autres on s'arrête
   
  end
  fprintf('Nombre diteration '); i
end
