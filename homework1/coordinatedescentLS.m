function x=coordinatedescentLS(A,b,x0,maxiter)
  % Entrées :
  % A est une matrice m x n
  % b est un vecteur m x 1
  % x0 est l'itéré initial (vecteur n x 1)
  % maxiter est le nombre d'itérations à effectuer
  
  % Sortie :
  % x est vecteur n x 1 (minimisant ||Ax-b||_2^2)
  
  % ICI :Algorithme à implémenter
  x=x0;
  Q=A'*A;
   C= b'*A;
  for i=1:maxiter
    %itéré précédent
    j=mod(i, length(x))+1;
    
     %on s'en debarasse de x(i) en l'égalisant à 0 pour ainsi ne pas je faire  apparaitre C(j,j)*x(j)² dans le calcul
     % de new_x
    x(j)=0;
    %La mise à jour à effectuer
    new_x = (C(j) - 0.5*Q(:,j)'*x - 0.5*Q(j,:)*x)/Q(j,j);
    x(j)=new_x; %new_x est la valeur optimale pour x(j)
    
    %Si les itérés sont suffisement proches les uns des autres on s'arrête
   
  end
  fprintf('Nombre diteration '); i

end
