clear
syms x y
f(x,y)=sin(x)-cos(y^2);
fsurf(f)
hold on
plot3(-2.5,1.1,f(-2.5,1.1),'r*','MarkerSize',20)