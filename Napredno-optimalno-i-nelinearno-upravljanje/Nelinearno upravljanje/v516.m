% Matlab/Simulink fazne analize nelinearnih sistema

global eps
eps= 0.5;
[X1,X2] =meshgrid(-5:.2:5); %definisanje grid-a u faznom prostoru
for i=1:size(X1,1)
   for j=1:size(X2,1)
      DX1(i,j) = X2(i,j);
      DX2(i,j) = -X1(i,j)+eps*(1-X1(i,j)^2)*X2(i,j);
   end
end
% racuna izvode u tackama grida
figure(1),clf
quiver(X1,X2,DX1,DX2) %strelice u tackama
hold on
x10=0;x20=0;
while (max(x10, x20) < 5.5)
   [x10,x20]=ginput(1);
   sim('vdpol') %Simulink model sa pocetnim uslovima u integratorima x10 i x20
   figure(1),plot(yout(:,1),yout(:,2),'r')
end
