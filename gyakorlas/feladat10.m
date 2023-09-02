clear
syms u v
px = [0, 0]; py = [0, 1]; pz = [0, 1];
rx = [1, 1]; ry = [0, 1]; rz = [1, 0];

Px(u)=(1-u)*px(1)+u*px(2);
Py(u)=(1-u)*py(1)+u*py(2);
Pz(u)=(1-u)*pz(1)+u*pz(2);

fplot3(Px(u), Py(u), Pz(u), [0 1], 'r', 'LineWidth', 4)

hold on

Rx(u)=(1-u)*rx(1)+u*rx(2);
Ry(u)=(1-u)*ry(1)+u*ry(2);
Rz(u)=(1-u)*rz(1)+u*rz(2);

fplot3(Rx(u), Ry(u), Rz(u), [0 1], 'r', 'LineWidth', 4)

sx(u,v)=(1-v)*Px(u)+v*Rx(u);
sy(u,v)=(1-v)*Py(u)+v*Ry(u);
sz(u,v)=(1-v)*Pz(u)+v*Rz(u);

fsurf(sx, sy, sz, [0 1 0 1]);
axis equal;




