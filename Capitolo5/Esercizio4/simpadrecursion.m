function If_22 = simpadrecursion(a, b, fun, tol, fEvalIn)
% If_22 = simpadrecursion(a, b, fun, tol)
% 
% Effettua la generica chiamata ricorsiva per il calcolo della 
% formula di Simpson composita adattativa.
% 
% Input:
%   a - primo estremo di integrazione
%   b - secondo estremo di integrazione
%   fun - function handle della funzione di cui si intende 
%         approssimare l'integrale definito nell'intervallo [a, b]
%   tol - limitazione ad una approssimazione dell'errore assoluto
%   fEvalIn - valutazioni di funzione effettuate alla precedente 
%             chiamata ed utili per effettuare i calcoli della 
%             corrente
% 
% Output:
%   If - approssimazione dell'integrale definito di fun in [a, b],
%        calcolato mediante la formula di Simpson composita 
%        adattativa.
k = (b-a)/6;
m1 = (3*a + b)/4; % m1 = (a + (a+b)/2)/2
m2 = (a + 3*b)/4; % m2 = ((a+b)/2 + b)/2

If_2 = k * (fEvalIn(1) + 4*fEvalIn(2) + fEvalIn(3));
% 2 valutazioni di funzione
fEvalCur = [fun(m1) fun(m2)];
If_22 = If_2/2 + k*(2*(fEvalCur(1) + fEvalCur(2)) - fEvalIn(2));

if abs(If_2 - If_22)/15 > tol  
    % se errore stimato e' maggiore della 
    % tolleranza effettuo la ricorsione su: 
    % [a, (a+b)/2] e [(a+b)/2, b], con tolleranza dimezzata
    
    % preparazione di fEvalIn che conterra' le 3 valutazioni di 
    % funzione utili alla prossima chiamata ricorsiva
    tmp = fEvalIn(3);         % tmp <- fun(b)                
    fEvalIn(3) = fEvalIn(2);  % fEvalIn(3) <- fun((a+b)/2)
    fEvalIn(2) = fEvalCur(1); % fEvalIn(2) <- fun(m1)
    
    % fEvalIn = [fun(a) fun(m1) fun((a+b)/2)]    
    IfLeft = simpadrecursion(a, (a+b)/2, fun, tol/2, fEvalIn);    
    
    fEvalIn(1) = fEvalIn(3);  % fEvalIn(1) <- fun((a+b)/2)
    fEvalIn(2) = fEvalCur(2); % fEvalIn(2) <- fun(m2)
    fEvalIn(3) = tmp;         % fEvalIn(3) <- fun(b)
    
    % fEvalIn = [fun((a+b)/2) fun(m2) fun(b)]
    IfRight = simpadrecursion((a+b)/2, b, fun, tol/2, fEvalIn); 
   
    % "al ritorno" dalla ricorsione, si sommano 
    % le approssimazioni stimate 
    If_22 = IfLeft + IfRight; 
end
return;