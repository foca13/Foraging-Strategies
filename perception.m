function [ p ] = perception(pos_head,prev_con)
x=round(pos_head(1));
y=round(pos_head(2));
a=getGlobalx;
if x<1
    x=1;
end
if x>650
    x=650;
end
if y<1
    y=1;
end
if y>1000
    y=1000;
end
x
y
p=(1/a(x,y))*prev_con-(a(x,y));
%plot(p,'g');
end