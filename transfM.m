%转轴法向量为 N =（u,v,w)
%转轴的位置为 O =（a,b,c)
%转角为 theta，单位为°
function y = transfM(u,v,w,theta,a,b,c)

    r11 = u^2 + (v^2 + w^2) * cos(theta);
    r12 = u * v * (1 - cos(theta)) - w * sin(theta);
    r13 = u * w * (1 - cos(theta)) + v * sin(theta);
    r21 = u * v * (1 - cos(theta)) + w * sin(theta);
    r22 = v^2 + (u^2 + w^2) * cos(theta);
    r23 = v * w * (1 - cos(theta)) - u * sin(theta);
    r31 = u * w * (1 - cos(theta)) - v * sin(theta);
    r32 = v * w * (1 - cos(theta)) - u * sin(theta);
    r33 = w^2 + (u^2 + v^2) * cos(theta);
    t1 = (a * (v^2 + w^2) - u * (b*v + c*w)) * (1 - cos(theta)) + (b*w - c*v) * sin(theta);
    t2 = (b * (u^2 + w^2) - v * (a*u + c*w)) * (1 - cos(theta)) + (c*u - a*w) * sin(theta);
    t3 = (c * (u^2 + v^2) - w * (a*u + b*v)) * (1 - cos(theta)) + (a*v - b*u) * sin(theta);
    y = [r11 r12 r13 t1;...
         r21 r22 r23 t2;...
         r31 r32 r33 t3;...
         0   0   0   1];

end