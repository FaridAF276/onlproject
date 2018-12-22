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
   C= b'*A;
   constraint = zeros(length(x0),1);
  for i=1:maxiter
    %it�r� pr�c�dent
    j=mod(i, length(x))+1;
    
     %on s'en debarasse de x(i) en l'�galisant � 0 pour ainsi ne pas je faire  apparaitre C(j,j)*x(j)� dans le calcul
     % de new_x
    x(j)=0;
    %La mise � jour � effectuer
    new_x = x-(Qx-c)/Q(j,j);
    
    %Si les it�r�s sont suffisement proches les uns des autres on s'arr�te
   
  end
  fprintf('Nombre diteration '); i

end
