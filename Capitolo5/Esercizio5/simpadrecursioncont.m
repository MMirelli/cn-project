function nrec = simpadrecursioncont(a, b, fun, tol, fEvalIn)
% nrec = simpadrecursioncont(a, b, fun, tol)
% 
% Effettua la generica chiamata ricorsiva per il calcolo della 
% formula di Simpson composita adattativa. Restituisce il numero di
% chiamate ricorsive effettuate.
k = (b-a)/6;
m1 = (3*a + b)/4;
m2 = (a + 3*b)/4;
If_2 = k * (fEvalIn(1) + 4*fEvalIn(2) + fEvalIn(3));
fEvalCur = [fun(m1) fun(m2)];
If_22 = If_2/2 + k*(2*fEvalCur(1) + 2*fEvalCur(2) - fEvalIn(2));

if abs(If_2 - If_22)/15 > tol 
    % se non ho ancora raggiunto la tolleranza richiesta effettuo 
    % le due chiamate ricorsive
    tmp = fEvalIn(3);             
    fEvalIn(3) = fEvalIn(2);
    fEvalIn(2) = fEvalCur(1); 
    nrecLeft = simpadrecursioncont(a,(a+b)/2,fun,tol/2,fEvalIn);    
    
    fEvalIn(1) = fEvalIn(3);
    fEvalIn(2) = fEvalCur(2); 
    fEvalIn(3) = tmp; 
    nrecRight = simpadrecursioncont((a+b)/2,b,fun,tol/2,fEvalIn); 
   
    nrec = 2 + nrecLeft + nrecRight;
else
    % se ho raggiunto la tolleranza non effettuo chiamate ricorsive
    nrec = 0;
end

return;

