function [] = LeTry()
a=[0 1];
b=[-2 1];
%signed_angle=atan(b(2)/a(2))-atan(b(1)/a(1))
angle=acosd(dot(a,b)/(norm(a)*norm(b)))
if (a(1)*b(2) - a(2)*b(1))< 0
    angle=-angle;
end
angle
end