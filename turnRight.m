function [] = turnRight(pos_body,pos_head,pos_tail,vec,per,t_turn,t)
p=perception();
tail_vec=pos_body-pos_tail;
angle=acosd(dot(vec,tail_vec)/(norm(vec)*norm(tail_vec)));
if angle <= -119
    turnLeft(pos_body,pos_head,pos_tail,vec,per,t_turn,t);
end
new_vec=vec*[cosd(-24) sind(-24); -sind(-24) cosd(-24)];
pos_head=pos_body+new_vec;
turn_terminate_base=2;
t_turn_kernel=0;
for i = 0:t
    if t<=5
    t_turn_kernel=(t_turn_kernel+per(t-i+1)*(150-30*i))/10;
    end
    plot_kernal(i+1)=(150-30*i);
end
r_turn_terminate=turn_terminate_base+t_turn_kernel;
p_turn_terminate=r_turn_terminate*0.1;
plot(plot_kernal,t)
per=cat(2,per,p);
t=t+1;
t_turn=t_turn+1;
%turnLeft(pos_body,pos_head,new_vec,per,t_turn,t);
if 20>p_turn_terminate
    turnRight(pos_body,pos_head,new_vec,per,0,t);
end

%if rand>p_turn_terminate

end

