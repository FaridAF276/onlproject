function x=coordinatedescent(Q,c,p,x0,maxiter)
  clc;
  % Entr�es :
  % Q est une matrice n x n semi d�finie positive
  % c est un vecteur n x 1
  % p est un scalaire
  % x0 est l'it�r� initial (vecteur n x 1)
  % maxiter est le nombre d'it�rations � effectuer
  
  % Sortie :
  % x est vecteur n x 1
  precision = 10^-5
    x=x0; %On peut modifier l'it�r�
  for i=1:maxiter
    xi=x;
    %it�r� pr�c�dent
    j=mod(i, length(x))+1;

   %on s'en d�barasse de x(i) en l'�galisant � 0 pour ainsi ne pas je faire  apparaitre Q(j,j)*x(j)� dans le calcul
     % de new_x
    x(j)=0;
    %La mise � jour � effectuer
    new_x = (c(j) - 0.5 *x'*Q(:,j) - 0.5 *Q(j,:)*x)/Q(j,j);
    x_o = x;
    x(j)=new_x; %new_x est la valeur optimale pour x(j)
    x_n = x;
    err = (x_n-x_o);
    
    if(max(err) < precision)
      break;
    endif
    %Si les it�r�s sont suffisement proches les uns des autres on s'arr�te
   
  end
  fprintf('Nombre diteration '); i
end
