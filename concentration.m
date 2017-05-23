function [arena] = concentration(X,Y)
arena=zeros(X,Y);
for i = 1:X
    for j = 1:Y
        distance=sqrt((i-(X/2))^2+((j-Y/2))^2+1);
        arena(i,j)=1/distance;
    end
end
plot(X/2,Y/2,'g^');hold on ; axis([0 X 0 Y]);hold on;
end

%contour(arena(i,j)(:,1));