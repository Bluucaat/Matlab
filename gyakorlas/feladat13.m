clear
syms u v
fx(u,v)=u-((u^3)/3)+u*v^2; 
fy(u,v)=v-((v^3)/3)+v*u^2;
fz(u,v)=u^2-v^2;                %Paraméteres felület koordinátafüggvényei
fsurf(fx,fy,fz,[-25 25 -25 25],'y') %Felület megrajzolása, mindkét paraméter a -25 25 intervallumban
xlabel('x')
ylabel('y')
zlabel('z') %Koordináta tengelyek elnevezése
hold on
u0=10;
v0=15; %Pont megadása
plot3(fx(u0,v0),fy(u0,v0),fz(u0,v0),'b*','MarkerSize',30)  %Pont megrajzolása a tér megadott pontjában
ax(u)=fx(u,v0); 
ay(u)=fy(u,v0);
az(u)=fz(u,v0); %Az egyik paramétervonal függvényei, ahol v0 rögzített, és u 'fut' a megadott intervallumon
fplot3(ax,ay,az,[-25 25 ],'b','LineWidth',5); %Az egyik paramétervonal megrajzolása
axd=diff(ax,u);
ayd=diff(ay,u);
azd=diff(az,u); %Lederiválom az u paramétervonal függvényeit
quiver3(fx(u0,v0),fy(u0,v0),fz(u0,v0),axd(u0),ayd(u0),azd(u0),'w','LineWidth',3) 
%Megrajzolom az u paramétervonal érintőjét ami az u0 v0 pontból megy, és a deriváltfüggvényekbe "mutat" az u0 helyen
bx(v)=fx(u0,v);
by(v)=fy(u0,v);
bz(v)=fz(u0,v); %A másik paramétervonal függvényei, ahol u0 rögzített, és v 'fut' a megadott intervallumon
fplot3(bx,by,bz,[-25 25 ],'g','LineWidth',5); %A másik paramétervonal megrajzolása
bxd=diff(bx,v);
byd=diff(by,v);
bzd=diff(bz,v);%Lederiválom az v paramétervonal függvényeit
quiver3(fx(u0,v0),fy(u0,v0),fz(u0,v0),bxd(v0),byd(v0),bzd(v0),'c','LineWidth',3)
%Megrajzolom a v paramétervonal érintőjét, ami az u0 v0 pontból megy, és a deriváltfüggvényekbe "mutat" az v0 helyen
a=[axd(u0),ayd(u0),azd(u0)];
b=[bxd(v0),byd(v0),bzd(v0)];
%Az eddig megrajzolt két vektor felvétele, hogy megcsináljam velük később a vektoriális szorzást 
normalvektor=(cross(b,a))/100; % a és b vektoriális szorzata, elosztva, hogy jobban látszódjon
%Fura, nem vagyok benne biztos ez így jó, de elvileg annak kéne lennie
quiver3(fx(u0,v0),fy(u0,v0),fz(u0,v0),normalvektor(1),normalvektor(2),normalvektor(3),'r','LineWidth',3) 
% a és b vektorok normálvektorának megrajzolása
hold off