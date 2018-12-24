function [W,H,e,t]=nmf_FedeFarid(X,W0,H0,timelimit)
  % Input :
  % X est une matrice m x n
  % W0 est une matrice m x r
  % H0 est une matrice r x n
  % timelimit est le temps de resolution
  
  % Output :
  % W est une matrice m x r
  % H est une matrice r x n
  % e est le vecteur contenant les erreurs
  % t est le vecteur contenant les temps auxquels les erreurs ont ete calculees
  
  
  nX    = norm(X,'fro')^2; 
  [m,n] = size(X);
  [m,r] = size(W0);
  
  %Scaling
  A = X*H0';
  B = H0*H0';
  scale = sum(sum(A.*W0))/sum(sum(B.*(W0'*W0)));
  W=W0*scale;
  H=H0;
  alpha = 0.3;
  %Initialisation des vecteurs erreurs et temps
  temps = cputime;
  t     = 0;
  e     = nX-2*sum(sum(A.*W))+sum(sum(B.*(W'*W)));
  
  iter  = 0;
  timelimitperopt = 0.1;
  while cputime-temps<=timelimit
    %Optimisation de H
    %COMPLETER ICI
    iter = iter+1;
    for i=1:n
      [H(:,i),~,~]=nnls_FedeFarid(W,X(:,i),H0(:,i),timelimitperopt,2);
    end 
    %Optimisation de W
    %COMPLETER ICI
    for j=1:m
      [rep,~,~]= nnls_FedeFarid(H',X(j,:)',W0(j,:)',timelimitperopt,2);
      W(j,:)=rep';
    end
    %Calcul du temps et de l'erreur
    time_lost = cputime;
    e         = [e nX-2*sum(sum((X*H').*W))+sum(sum((H*H').*(W'*W)))];
    temps     = temps+(cputime-time_lost);
    t         = [t cputime-temps];
  end
  iter
end