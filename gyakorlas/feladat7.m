clear
px = [-3 3];
py = [1 3];
plot(px,py,'r*')
axis([-6 6 -1 5])
axis equal
hold on
vx = [2 -2];
vy = [3 3];

t0 = -1;
t1 = 1;

syms a3 a2 a1 a0 t
cx(t) = a3*t^3+a2*t^2+a1*t+a0;
cxd(t) = diff(cx,t);

eq = [cx(t0) == px(1), cx(t1) == px(2), ...
    cxd(0.4) == vx(1), cxd(t1) == vx(2)];

m = solve(eq, [a3 a2 a1 a0]);
x(t) = subs(cx, [a3 a2 a1 a0], [m.a3 m.a2 m.a1 m.a0]);

syms b3 b2 b1 b0
cy(t) = b3 * t ^3 + b2 * t ^2 + b1 * t + b0;
cyd(t) = diff(cy,t);

eq = [cy(t0) == py(1), cy(t1) == py(2),...
    cyd(0.4) == vy(1), cyd(t1) == vy(2)];
m=solve(eq,[b3 b2 b1 b0]);
y(t) = subs(cy, [ b3 b2 b1 b0], [m.b3 m.b2 m.b1 m.b0]);

quiver (x(0.4), y(0.4), vx(1), vy(1))
quiver (x(1), y(1), vx(2), vy(2))

fplot(x, y, [t0 t1])

rx=12;
ry=-5;
v1=[2, 10];
dx(t)=diff(x(t), t);
dy(t)=diff(y(t), t);
quiver(px(2), py(2), dx(1), dy(1))
v2=[dx(0), dy(0)]
x(t) = a3*t^3+a2*t^2+a1*t+a0;
y(t) = a3*t^3+a2*t^2+a1*t+a0;
dx(t)=diff(x(t), t);
dy(t)=diff(y(t), t);
eq=[x(0)==px(2);...
    x(1)==rx;...
    dx(0)==3*v2(1);...
    dx(1)==v1(1)];
m=solve(eq, [a0, a1, a2, a3])
x(t)=m.a3*t^3+m.a2*t^2+m.a1*t+m.a0;

eq=[y(0)==py(2);...
    y(1)==ry;...
    dy(0)==3*v2(2);...
    dy(1)==v1(2)];
m=solve(eq, [a0, a1, a2, a3])
y(t)=m.a3*t^3+m.a2*t^2+m.a1*t+m.a0;

fplot(x, y, [0 1])