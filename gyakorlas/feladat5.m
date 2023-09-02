clear

syms x y
fz(x,y)=sqrt(1-x^2-(0.5*(y^2))); 
fsurf(fz);
axis equal;
hold on;
x0 = 0.5;
y0 = 0.2;

plot3(0.5, 0.2, fz(x0, y0), '*', 'MarkerSize', 32)
