clear
hold on
axis equal
syms t

px = [-2, 6]; py = [-2 -2];
vx = [6, 4]; vy = [-4, 4];

t0 = 0;
t1 = 1;
quiver(px(1), py(1), vx(1), vy(1), 'LineWidth', 3)
quiver(px(2), py(2), vx(2), vy(2), 'LineWidth', 3)
syms a3 a2 a1 a0

x(t) = a3*t^3+a2*t^2+a1*t+a0;
xd = diff(x, t);

eq = [x(t0) == px(1) ...
      xd(t0) == vx(1) ...
        x(t1) == px(2) ...
         xd(t1) == vx(2)];

mx = solve(eq, [a3 a2 a1 a0]);
cx = subs(x, [a3 a2 a1 a0], [mx.a3, mx.a2, mx.a1, mx.a0]);

syms b3 b2 b1 b0

y(t) = b3*t^3+b2*t^2+b1*t+b0;
yd = diff(y, t);

eq = [y(t0) == py(1) ...
      yd(t0) == vy(1) ...
        y(t1) == py(2) ...
         yd(t1) == vy(2)];

my = solve(eq, [b3 b2 b1 b0]);
cy = subs(y, [b3 b2 b1 b0], [my.b3, my.b2, my.b1, my.b0]);

fplot(cx, cy, [t0 t1], 'LineWidth',1)