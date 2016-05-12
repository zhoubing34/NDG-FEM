function TransferProcess
filename = 'Convection2D_2_80_tri.nc';

time = ncread(filename, 'time');
% timestep = numel(time)
x = ncread(filename, 'x'); nx = numel(x);
y = ncread(filename, 'y');

itime = 1;
var = ncread(filename, 'h', [1, itime],[inf, 1]);

p_h = point3D(filename, x, y, var, time);

end% func

function p_h = point3D(filename, x, y, var, time)
ind = 1:6:numel(x);

subplot(2, 1, 1);
p_h = plot3(x(ind), y(ind), var(ind), '.');
zlim([-0.5, 1.2])

subplot(2, 1, 2);
np = 100;
r = linspace(-1, 1, np);
[X, Y] = meshgrid(r, r);
Z = griddata(x, y, var, X, Y, 'linear');
v = [-0.4:0.1:-0.1, 0:0.2:1];
[c, c_h] = contourf(X, Y, Z, v);

sumCell = zeros(numel(time), 1);

for itime = 1:numel(time)
    var = ncread(filename, 'h', [1, itime],[inf, 1]);
    
%     set(p_h, 'ZData', var(ind));
    
%     Z = griddata(x, y, var, X, Y, 'linear');
%     set(c_h, 'ZData', Z);
%     drawnow;
    sumCell(itime) = sum(var(1:6));
    fprintf('Processing: %f ...\n', itime/numel(time))
    
%     if itime > 780
%         keyboard;
%     end
%     if sum(abs(var(1:6))) > 0.01
%         keyboard;
%     end
end% for

plot(time, sumCell)
end% func