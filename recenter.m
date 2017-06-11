function [] = recenter (pos_body,vec_tail,vec,con,per,t_turn,t,s,angle)
if s==0
    vec=vec*[cosd(angle) -sind(angle); sind(angle) cosd(angle)];
else vec=vec*[cosd(angle) sind(angle); -sind(angle) cosd(angle)];
end
pos_head=pos_body+vec;
t=t+5;
turn(pos_body,pos_head,vec_tail,vec,con,per,t_turn,t)
end