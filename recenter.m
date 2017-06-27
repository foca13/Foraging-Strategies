function [] = recenter(pos_body,vec_tail,vec,con,per,s,t_turn,angle,t_r)
a=getGlobalx;
if s==0
        vec=vec*[cosd(angle/5) -sind(angle/5); sind(angle/5) cosd(angle/5)];
        pos_head=pos_body+vec;
else if s==1
        vec=vec*[cosd(angle/5) sind(angle/5); -sind(angle/5) cosd(angle/5)];
        pos_head=pos_body+vec;
    end
end
if pos_head(1)>=650
    pos_head(1)=650;
end
if pos_head(1)<=1
    pos_head(1)=1;
end
if pos_head(2)>=1000
    pos_head(2)=1000;
end
if pos_head(2)<=1
    pos_head(2)=1;
end
t_r=t_r+1;
per=cat(2,per,perception(pos_head,con));
con=a(round(pos_head(1)),round(pos_head(2)));
t_turn=t_turn+1;
setGlobaly(per);
setGlobalv(pos_body,pos_head,vec_tail,vec,con,0,0,0,s,t_turn,angle,t_r);
if t_r>4
    setGlobalz(4);
end
end