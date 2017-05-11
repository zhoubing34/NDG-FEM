function [ rhs ] = rhs_term(obj, f_Q )
%RHS_TERM Summary of this function goes here
%   Detailed explanation goes here

[ E, G ] = flux_term(obj, f_Q); % volume flux term
[ dflux ] = surf_term( obj, f_Q ); % surface flux deviation

rhs = - obj.mesh.rx.*(obj.mesh.cell.Dr*E) ...
    - obj.mesh.sx.*(obj.mesh.cell.Ds*E) ...
    - obj.mesh.ry.*(obj.mesh.cell.Dr*G) ...
    - obj.mesh.sy.*(obj.mesh.cell.Ds*G) ...
    + obj.mesh.cell.LIFT*( obj.mesh.eidfscal.*dflux );
end

