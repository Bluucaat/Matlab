px = [-2 4 6 10];
py = [-2 0 -2 2];
hold on
plot(px(1), py(1), '*b');
plot(px(2), py(2), '*b');
plot(px(3), py(3), '*b');
plot(px(4), py(4), '*b');

syms a3 a2 a1 a0 b3 b2 b1 b0 t
t0=-1;t1=0;t2=2;t3=3;

ex=[a3*t0^3+a2*t0^2+a1*t0+a0==px(1)...
    a3*t1^3+a2*t1^2+a1*t1+a0==px(2)...
    a3*t2^3+a2*t2^2+a1*t2+a0==px(3)...
    a3*t3^3+a2*t3^2+a1*t3+a0==px(4)];
mx = solve(ex, [a3 a2 a1 a0]);
x(t) = mx.a3*t^3+mx.a2*t^2+mx.a1*t+mx.a0;

ey=[a3*t0^3+a2*t0^2+a1*t0+a0==py(1)...
    a3*t1^3+a2*t1^2+a1*t1+a0==py(2)...
    a3*t2^3+a2*t2^2+a1*t2+a0==py(3)...
    a3*t3^3+a2*t3^2+a1*t3+a0==py(4)];

my = solve(ey, [a3 a2 a1 a0]);
y(t) = my.a3*t^3+my.a2*t^2+my.a1*t+my.a0;
fplot(x, y, [t0 t3], 'b', 'LineWidth', 2);

xd = diff(x, t);
yd = diff(y, t);
quiver(x(t2), y(t2), xd(t2), yd(t2), 'r', 'LineWidth', 2);