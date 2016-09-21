function SnapShot_ObliqueHydraulicJump2d

%% Parameter
T        = 0.49;
meshtype = 'tri';
filename = {'SWE2D.nc'};
order    = 1;
PostproTri  = Utilities.PostProcess.Postprocess(filename, meshtype, order);
fileID   = 1;
time     = [(1e-12:0.1:1)*T, T];

for i = 1:numel(time)
    figure
    PostproTri.Snapshot2D('h', time(i), fileID);
    xlim([0, 40]);
    ylim([0,30]);
    view(30, 32);
    zlabel('ˮλ (m)','FontSize', 14);
    xlabel('x (m)','FontSize', 14);
    ylabel('y (m)','FontSize', 14);
    box on
end% for
end% func