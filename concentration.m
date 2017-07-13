 function [arena] = concentration(X,Y)
arena=zeros(X,Y);
for i = 1:X
    for j = 1:Y
        distance=sqrt((i-(X/2))^2+((j-Y/2))^2);
        arena(i,j)=exp(-(distance^2)/(40000));
    end
end
% a=zeros(1,650);
% int=0;
% for k = 1:650
%     a(k)=int;
%     int=int+1;
% end
% b=zeros(1,650);
% for l=1:650
%     b(l)=arena(l,500);
% end
% plot(a,b);
%contour(arena);
%plot(X/2,Y/2,'g^');hold on ; axis([0 X 0 Y]);hold on;
end