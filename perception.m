function [ p ] = perception(arena,pos_head,prev_con)
%arena=concentration(65,100);
x=abs(floor(pos_head(1)));
y=abs(floor(pos_head(2)));
if x<0
    x=1;
end
if x>100
    x=100;
end
if y<0
    y=1;
end
if y>100
    y=100;
end
p=(arena(x,y)-prev_con);
end