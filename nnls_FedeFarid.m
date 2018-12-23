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
  gamma = ((Atb'*x0)/(x0'*AtA*x0));
  x     =y_k= gamma*x0;
  %Initialisation des vecteurs erreurs et temps
  temps = cputime;
  t     = 0;
  e     = 0.5*(x'*AtA*x-2*Atb'*x+btb); 
  
  alpha = 0.3; %necessaire pour la methode du gradient accelere
  iter  = 0;
  grad=AtA*x-Atb;
  while cputime-temps<=timelimit
    i=iter=iter+1;
    
    if choix==1
        grad=AtA*x-Atb; %nouvelle direction
        dir = -grad;
        x_n=x+(1/L)*dir; %calcule de nouvel itéré
        x_n(x_n<0)=0; %On égale toutes les entrées négatives à 0
        x=x_n; %nouvel itéré
      
    end
    
    if choix==2
        %Calculs des paramètres
        alpha_n=0.5*(sqrt(alpha^4 + 4*alpha^2)-alpha^2);
        b_k = (alpha*(1-alpha))/((alpha^2)+alpha_n);
        
        %Calculs des points : 
        
        x_n = y_k-(1/L)*(AtA*y_k-Atb);
        x_n(x_n<0)=0; % On égales les entrés négatives à 0 pour rester dans le domaine (x>=0)
        y_k = x_n + b_k *(x_n-x);
        x=x_n;
        alpha=alpha_n;
    end
    
    
    if choix==3
        n=length(x); 
        [S,O] = sort(grad, 'descend'); %O nous donne permet de mettre les plus grande composantes de grad d'abord.
        for i = 1:n
          j=O(i);%vecteur avec l'ordre à respecter pour l'optimisation
          x_n = x;
          %La mise à jour à effectuer
          x_n(j) = x(j)-grad(j)/AtA(j,j);
          if(x_n(j)<0)
            x_n(j)=0;
          endif
          delta = x_n-x;
          x=x_n(j);
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