clear
syms u v

fx(u,v)=u-((u^3)/3)+u*v^2;
fy(u,v)=v-((v^3)/3)+v*u^2;
fz(u,v)=u^2-v^2;
fsurf(fx,fy,fz,[-25 25 -25 25],'y');
xlabel('x')
ylabel('y')
zlabel('z')
axis equal;
hold on;

u0 = 10;
v0 = 15;

plot3(fx(u0, v0), fy(u0, v0), fz(u0, v0), '*b', 'MarkerSize', 30)
ax(u) = fx(u, v0);
ay(u) = fy(u, v0);
az(u) = fz(u, v0);
fplot3(ax, ay, az, [-25 25], 'b', 'LineWidth', 5)
axd = diff(ax, u);
ayd = diff(ay, u);
azd = diff(az, u);


quiver3(fx(u0, v0), fy(u0, v0), fz(u0, v0), axd(u0), ayd(u0), azd(u0), 'LineWidth', 3)

bx(v) = fx(u0, v);
by(v) = fy(u0, v);
bz(v) = fz(u0, v);
fplot3(bx, by, bz, [-25 25], 'g', 'LineWidth', 10)

bxd = diff(bx, v);
byd = diff(by, v);
bzd = diff(bz, v);

quiver3(fx(u0, v0), fy(u0, v0), fz(u0, v0), bxd(v0), byd(v0), bzd(v0))

a=[axd(u0), ayd(u0), azd(u0)];
b=[bxd(v0), byd(v0), bzd(v0)];

normalvektor=(cross(b,a))/100;
quiver3(fx(u0, v0), fy(u0, v0), fz(u0, v0), normalvektor(1), normalvektor(2), normalvektor(3), 'r', 'LineWidth', 3);
