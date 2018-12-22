function x=coordinatedescentLSO(A,b,x0,maxiter)
  % Entr�es :
  % A est une matrice m x n
  % b est un vecteur m x 1
  % x0 est l'it�r� initial (vecteur n x 1)
  % maxiter est le nombre d'it�rations � effectuer
  
  % Sortie :
  % x est vecteur n x 1 (minimisant ||Ax-b||_2^2)
  
  % ICI :Algorithme � impl�menter
    x=x0;
    Q=A'*A;
    C= A'*b;
    grad = Q*x0-C;
  for i=1:maxiter
    x_n = x;
    %it�r� pr�c�dent
    j=mod(i, length(x))+1;
    
    %La mise � jour � effectuer
    x_n(j) = x(j)-grad(j)/Q(j,j);
    delta = x_n-x;
    x(j)=x_n(j);
    %Au lieu de recalculer � chaque fois le gradient 
    % on �crit juste la mis� � jour
    %grad=Q*x-C; 
    grad = grad + Q(:,j)*delta(j);
   
  end
  fprintf('Nombre diteration '); i

end
