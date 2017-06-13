function [ p ] = perception(pos_head,prev_con)
x=abs(floor(pos_head(1)));
y=abs(floor(pos_head(2)));
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
p=(1/a(x,y))*(a(x,y)-prev_con)*10;
plot(p,'g'); hold on;
end