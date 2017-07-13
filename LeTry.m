function [] = LeTry()
a=[0 1 7;2 4 9;5 6 8];
%b=[-2 1];
%signed_angle=atan(b(2)/a(2))-atan(b(1)/a(1))
%angle=acosd(dot(a,b)/(norm(a)*norm(b)));
% if (a(1)*b(2) - a(2)*b(1))< 0
%     angle=-angle;
% end
%angle
o=[0 0];
vec=[1 1];

for j=1:8
    plot(vec(1),vec(2),'--xr'); hold on;
    vec=vec*[cosd(45) sind(45); -sind(45) cosd(45)];
end
% fileID=fopen('RunData','w');
% for i=1:size(a,1)
%     for j=1:size(a,2)
% fprintf(fileID,'%d\v',a(i,j));
%     end
%     fprintf(fileID,'\n');
% end
end