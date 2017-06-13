function [] = recenter (pos_body,vec_tail,vec,con,per,t_turn,t,s,angle)
if s==0
    for i = 0:5
        vec=vec*[cosd(angle/5) -sind(angle/5); sind(angle/5) cosd(angle/5)];
        pos_head=pos_body+vec;
        per=cat(2,per,perception(pos_head,con));
    end
else for i = 0:5
        vec=vec*[cosd(angle/5) sind(angle/5); -sind(angle/5) cosd(angle/5)];
        pos_head=pos_body+vec;
        per=cat(2,per,perception(pos_head,con));
    end
end
pos_head=pos_body+vec;
t=t+5;
turn(pos_body,pos_head,vec_tail,vec,con,per,t_turn,t)
end