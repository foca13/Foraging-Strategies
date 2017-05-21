function [] = weathervane(pos_body,pos_head,vec_tail,vec,perception,t_weathervane,t_run,t)
angle=acosd(dot(vec,vec_tail)/(norm(vec)*norm(vec_tail)));
new_vec=vec*[cosd(6) sind(6); -sind(6) cosd(6)];
%pos_head=pos_body+new_vec;
weathervane(pos_body,pos_head,vec_tail,new_vec,perception,t_weathervane,t_run,t);
run(pos_body,pos_head,vec_tail,new_vec,perception,0,t_run,t);
end

