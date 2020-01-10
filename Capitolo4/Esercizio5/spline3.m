function y = spline3(xi, fi, x, tipo)
% y = spline3(xi, fi, x, tipo)
%
% Calcola il valore della spline cubica nelle ascisse contenute 
% nel vettore x.
%
% Input:
%   xi - vettore contenente le ascisse d'interpolazione
%   fi - vettore contenente i valori assunti dalla funzione nelle 
%        ascisse d'interpolazione
%   x - vettore delle ascisse in cui calcolare la spline cubica
%   tipo - se tipo = 'naturale' viene calcolata la spline cubica 
%          naturale, se tipo = 'not-a-knot' viene calcolata la 
%          spline cubica not-a-knot
%
% Precondizioni:
%   length(xi) == length(fi)
%   xi(i) ~= xi(j) per ogni i ~= j con i, j = 1, ...,n+1
%   tipo == 'nat' oppure tipo == 'nak'
%
% Output:
%   y - valore assunto dalla spline cubica
errMsg = "Precondizione violata: ";
if length(xi) ~= length(fi)
    error("spline3:InterpolationNodesNumberMismatch", ...
          errMsg + "length(xi) == length(fi)");
elseif length(xi) ~= length(unique(xi))
    error('spline3:ManyEqualInterpolationNodes', ... 
          errMsg + ...
          "xi(i) ~= xi(j) per ogni i ~= j con i, j = 1, ...,n+1");
end

n = length(xi) - 1;
h = xi(2:n+1) - xi(1:n);
phi = h(1:n-1) ./ (h(1:n-1)+h(2:n));
ksi = h(2:n) ./ (h(1:n-1)+h(2:n));

dv = differenzeDivise(xi, fi, 2); % si calcolano differenze divise 
                                  % per polinomi di grado 2
dv = dv(3:end);

% risolvi il sistema tridiagonale
if strcmp(tipo, 'nat')
    f = tridiagonale(2*ones(1,n-1), phi(2:n-1), ksi(1:n-2), 6*dv);
    m = [0 f 0];
elseif strcmp(tipo, 'nak')
    a = [1 2-phi(1) 2*ones(1,n-3) 2-ksi(n-1) 1];
    b = [phi(1:end-1) phi(n-1)-ksi(n-1) 0];
    c = [0 ksi(1)-phi(1) phi(2:n-1)];
    f = [dv(1) dv dv(end)];

    m = tridiagonale(a, b, c, 6*f);

    m(1) = m(1) - m(2) - m(3);
    m(end) = m(end) - m(end-1) - m(end-2);
else
    error("spline3:WrongSplineType", ...
          errMsg + "tipo == 'nat' oppure tipo == 'nak'");
end

y = x;

% calcola la spline nelle ascisse assegnate
for j = 1:length(x)
    % trova il range di appartenenza dell'ascissa
    i = 2;
    while ~ ((x(j) >= xi(i-1)) && (x(j) <= xi(i)))
        i = i + 1;
    end
    
    % calcola la spline
    r = fi(i-1) - h(i-1)^2/6*m(i-1);
    q = (fi(i)-fi(i-1))/h(i-1) - h(i-1)/6*(m(i)-m(i-1));
    y(j) = ((x(j)-xi(i-1))^3*m(i) + (xi(i)-x(j))^3*m(i-1)) / ...
           (6*h(i-1)) + ...
           q*(x(j)-xi(i-1)) + r;
end
return
