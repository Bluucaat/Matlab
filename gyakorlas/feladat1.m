% a)
clear
px = [30 45 55];
py = [10 -10 0];
plot(px, py, '*')

axis equal
hold on

syms t
x(t) = t*0;
y(t) = t*0;
n = 2
for i=0:n
    bruh(t) = nchoosek(n, i)*t^i*(1-t)^(n-i);
    x(t) = x(t) + px(i+1) * bruh(t)
    y(t) = y(t) + py(i+1) * bruh(t)
 end
fplot(x(t), y(t), [0, 1])

% b)
plot(x(0.3), y(0.3), 'r*')

% c)
dx(t) = diff(x(t), t);
dy(t) = diff(y(t), t);

quiver(x(0.3), y(0.3), dx(0.3), dy(0.3))
