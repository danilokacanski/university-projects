function xprim = vdpolj(t,x)
% Opis Van der Pol-ove dif. jednacine
global epsilon
xprim=zeros(2,1);
xprim(1)=x(2);
xprim(2) =epsilon*x(2)*(1-x(1)^2)-x(1);
