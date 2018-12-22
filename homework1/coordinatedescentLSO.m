function x=coordinatedescentLSO(A,b,x0,maxiter)
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
    C= A'*b;
    grad = Q*x0-C;
  for i=1:maxiter
    x_n = x;
    %itéré précédent
    j=mod(i, length(x))+1;
    
    %La mise à jour à effectuer
    x_n(j) = x(j)-grad(j)/Q(j,j);
    delta = x_n-x;
    x(j)=x_n(j);
    %Au lieu de recalculer à chaque fois le gradient 
    % on écrit juste la misé à jour
    %grad=Q*x-C; 
    grad = grad + Q(:,j)*delta(j);
   
  end
  fprintf('Nombre diteration '); i

end
