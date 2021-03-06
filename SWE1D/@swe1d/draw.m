function draw( obj, varargin )
%DRAW Summary of this function goes here
%   Detailed explanation goes here
switch nargin
    case 1
        f_Q = obj.f_Q;
    case 2
        f_Q = varargin{1};
end

if ( isempty(obj.draw_h) || ~isvalid( obj.draw_h{1} ) )
    % 若图像未绘制或窗口被关闭
    Np = obj.mesh.cell.Np; K = obj.mesh.K;
    obj.draw_h = cell(2, 1);
    list = 1:Np:(K*Np);
    g = graph();
    for n = 1:Np-1
        g = addedge(g, list+n-1, list+n);
    end
    subplot(2,1,1); hold on; % 绘制底坡与水位
    plot(g, 'XData', obj.mesh.x(:), 'YData', obj.bot(:), ...
        'LineWidth', 1, ...
        'Marker', '.', ...
        'NodeColor','k', ...
        'EdgeColor', 'k', ...
        'MarkerSize', 2, ...
        'NodeLabel', {});

    f = f_Q(:,:,1);
    obj.draw_h{1} = plot(g, ...
        'XData', obj.mesh.x(:), 'YData', f(:)+obj.bot(:), ...
        'LineWidth', 1, ...
        'Marker', 'o', ...
        'NodeColor','b', ...
        'EdgeColor', 'b', ...
        'MarkerSize', 2, ...
        'NodeLabel', {});
    box on; grid on;
    
    subplot(2,1,2); f = f_Q(:,:,2); % 绘制流量
    obj.draw_h{2} = plot(g, ...
        'XData', obj.mesh.x(:), 'YData', f(:), ...
        'LineWidth', 1, ...
        'Marker', 'o', ...
        'NodeColor','r', ...
        'EdgeColor', 'r', ...
        'MarkerSize', 2, ...
        'NodeLabel', {});
    box on; grid on;
else % 若图像存在
    f = f_Q(:,:,1); % 更新水位
    set( obj.draw_h{1}, 'YData', f(:)+obj.bot(:) );
    f = f_Q(:,:,2); % 更新流速
    set( obj.draw_h{2}, 'YData', f(:) );
end

end

