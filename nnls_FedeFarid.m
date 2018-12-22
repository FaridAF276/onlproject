function [x,e,t]=nnls_FedeFarid(A,b,x0,timelimit,choix)
  % Entrees :
  % A est une matrice m x n
  % b est un vecteur m x 1
  % x0 est l'itere initial (vecteur n x 1)
  % timelimit est le temps de resolution
  % si choix==1 -> methode du gradient
  % si choix==2 -> methode du gradient accelere
  % si choix==3 -> methode coordinate descent
  
  % Sorties :
  % x est vecteur n x 1
  % e est le vecteur contenant les erreurs
  % t est le vecteur contenant les temps auxquels les erreurs ont ete calculees
  
  %Initialisations et scaling
  AtA = A'*A;
  Atb = A'*b;
  btb = b'*b;
  L   = max(eig(AtA));
  gamma = -((Atb'*x0)/(x0'*AtA*x0))
  x     = gamma*x0;
  
  %Initialisation des vecteurs erreurs et temps
  temps = cputime;
  t     = 0;
  e     = 0.5*(x'*AtA*x-2*Atb'*x+btb); 
  
  alpha = 0.9; %necessaire pour la methode du gradient accelere
  iter  = 0;
  maxiter = ;
  while cputime-temps<=timelimit
    iter=iter+1;
    
    if choix==1
      d=Atb-AtA*x; %dir initale
      for i=1:maxiter
    
        x_n=x+(1/L)*d; %calcule de nouvel itéré
        x=x_n; %nouvel itéré
        d=Atb-AtA*x; %nouvelle direction
      end
    end
    
    if choix==2
       x= y_k = x0;
      for i=1:maxiter
        %Calculs des paramètres
        alpha_n=0.5*(sqrt(alpha^4 + 4*alpha^2)-alpha^2);
        b_k = (alpha*(1-alpha))/((alpha^2)+alpha_n);
        
        %Calculs des points : 
        
        x_n = y_k-(1/L)*(AtA*y_k-Atb);
        y_k = x_n + b_k *(x_n-x);
        x=x_n;
        alpha=alpha_n;
      end
    end
    
    
    if choix==3
      n = length(x);
      grad = AtA*x-Atb;
      for i=1:maxiter
        x_n = x;
        %itéré précédent
        j=mod(i, length(x))+1;
        
        %La mise à jour à effectuer
        x_n(j) = x(j)-grad(j)/AtA(j,j);
        delta = x_n-x;
        x(j)=x_n(j);
       
        grad = grad + AtA(:,j)*delta(j);
   
      end
    end   
    
    %Calcul du temps et de l'erreur
    time_lost = cputime;
    e         = [e 0.5*(x'*AtA*x-2*Atb'*x+btb)]; 
    temps     = temps+(cputime-time_lost);
    t         = [t cputime-temps];
  end
end