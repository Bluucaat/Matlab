clear
px=[0,0,1,1];
py=[0,1,0,1];
pz=[0,1,1,0];
plot3(px, py, pz, 'b*');

axis equal
syms t
hold on

cx(t)=(1-t) * px(1)+t * px(2);
cy(t)=(1-t) * py(1)+t * py(2);
cz(t)=(1-t) * pz(1)+t * pz(2);

fplot3(cx,cy,cz,[0 1]); 

dx(t)=(1-t) * px(3)+t * px(4);
dy(t)=(1-t) * py(3)+t * py(4);
dz(t)=(1-t) * pz(3)+t * pz(4);

fplot3(dx,dy,dz,[0 1]); 

syms u v

sx(u,v)=(1-v) * cx(u)+v * dx(u);
sy(u,v)=(1-v) * cy(u)+v * dy(u);
sz(u,v)=(1-v) * cz(u)+v * dz(u);
fsurf(sx,sy,sz,[0 1 0 1])

u0 = 0.5;
dxp(v)=sx(u0, v);
dyp(v)=sy(u0, v);
dzp(v)=sz(u0, v);

fplot3(dxp,dyp,dzp,[0 1],'r','LineWidth',2);