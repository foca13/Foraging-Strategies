function [] = turnLeft(pos_body,pos_head,pos_tail,vec,per,c,t_turn,t)
tail_vec=pos_body-pos_tail;
p=perception();
if c<=5
angle=acosd(dot(vec,tail_vec)/(norm(vec)*norm(tail_vec)));
new_vec=vec*[cosd(24) sind(24); -sind(24) cosd(24)];
pos_head=pos_body+new_vec;
turn_terminate_base=2;
t_turn_kernel=0;
for i = 0:t_turn
    if t_turn<=5
    t_turn_kernel=(t_turn_kernel+per(t-i+1)*((150-30*i)/10));
    end
    %plot_kernal(i+1)=(150-30*i);
end
r_turn_terminate=turn_terminate_base+t_turn_kernel;
p_turn_terminate=r_turn_terminate*0.1;
per=cat(2,per,p);
t=t+1;
t_turn=t_turn+1;
c=c+1;
if 20>p_turn_terminate
    turnLeft(pos_body,pos_head,pos_tail,new_vec,per,c,t_turn,t);
end
%plot(plot_kernal,t)
%if angle>37 && rand<p_turn_terminate
    %run(pos_body,pos_head,pos_tail,new_vec,per,0,t);
%end
else if c<=11
    new_vec=vec*[cosd(-24) sind(-24); -sind(-24) cosd(-24)];
    angle=acosd(dot(vec,tail_vec)/(norm(vec)*norm(tail_vec)));
    pos_head=pos_body+new_vec;
    per=cat(2,per,p);
    t=t+1;
    t_turn=t_turn+1;
    c=c+1;
    turnLeft(pos_body,pos_head,pos_tail,new_vec,per,c,t_turn,t);
    else
        angle=acosd(dot(vec,tail_vec)/(norm(vec)*norm(tail_vec)));
        turn(pos_body,pos_head,pos_tail,vec,per,t_turn,t);
    end
end
%turnLeft(pos_body,pos_head,new_vec,per,t_turn,t);
end

