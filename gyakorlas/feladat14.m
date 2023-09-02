%Három pont egy érintős Hermite-Ív
clear 
syms a0 a1 a2 a3 b0 b1 b2 b3 t %Felveszem a változókat, meg paramétereket amiket fogok használni
hold on 
axis equal
px=[-2,6,10];py=[-2,-2,2]; v=[6,-4]; %Pontok és a kezdőérintő felvétele
t0=0;t1=1;t2=1.5;%Paraméterek felvétele
plot(px,py,'k.','MarkerSize',20); quiver(px(1),py(1),v(1),v(2)) %Pontok és kezdőérintő megrajzolása

x(t)=a3 * t^3 + a2 * t^2 + a1 * t + a0; %x koordinátafüggvény
xd=diff(x,t); 
ex = [x(t0)  == px(1),... %A t0 paraméternél az első pont x értéke kell legyen
      x(t1)  == px(2),... %A t1 paraméternél az második pont x értéke kell legyen
      x(t2)  == px(3),... %A t2 paraméternél az harmadik pont x értéke kell legyen
      xd(t0) == v(1)];    %Illetve a t0 paraméternél az x deriváltja a kezdőérintő x értéke kell legyen
mx =solve(ex, [a0 a1 a2 a3]); %X koordinátafüggvény egyenletrendszerének megoldása
cx(t) = subs(x, [a0 a1 a2 a3],[mx.a0 mx.a1 mx.a2 mx.a3]); %Behelyettesíti az értékeket a subs parancs

y(t)=b3 * t^3 + b2 * t^2 + b1 * t + b0; %y koordinátafüggvény
yd=diff(y,t);
ey = [y(t0)  == py(1),... %A t0 paraméternél az első pont y értéke kell legyen
      y(t1)  == py(2),... %A t1 paraméternél az második pont y értéke kell legyen
      y(t2)  == py(3),... %A t2 paraméternél az harmadik pont y értéke kell legyen
      yd(t0) == v(2)];    %Illetve a t0 paraméternél az y deriváltja a kezdőérintő y értéke kell legyen
 
my =solve(ey, [b0 b1 b2 b3]); %X koordinátafüggvény egyenletrendszerének megoldása
cy(t) = subs(y, [b0 b1 b2 b3],[my.b0 my.b1 my.b2 my.b3]); %Behelyettesíti az értékeket a subs parancs
fplot(cx,cy, [t0 t2],'r','LineWidth',1) %Hermite-Ív megrajzolása
hold off;

