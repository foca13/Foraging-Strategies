function [] = turnLeft(pos_body,pos_head,vec_tail,vec,per,c,t_turn,t)
if c<=4
new_vec=vec*[cosd(24) sind(24); -sind(24) cosd(24)];
angle=acosd(dot(new_vec,vec_tail)/(norm(new_vec)*norm(vec_tail)));
pos_head=pos_body+new_vec;
p=perception();
per=cat(2,per,p);
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
t=t+1;
t_turn=t_turn+1;
c=c+1;
if rand<p_turn_terminate && angle > 37
    run(pos_body,pos_head,vec_tail,new_vec,per,0,0,t);
end
else if c<=9
    new_vec=vec*[cosd(-24) sind(-24); -sind(-24) cosd(-24)];
    angle=acosd(dot(new_vec,vec_tail)/(norm(new_vec)*norm(vec_tail)));
    pos_head=pos_body+new_vec;
    p=perception();
    per=cat(2,per,p);
    t=t+1;
    t_turn=t_turn+1;
    c=c+1;
    turnLeft(pos_body,pos_head,vec_tail,new_vec,per,c,t_turn,t);
    else
        turn(pos_body,pos_head,vec_tail,vec,per,t_turn,t);
    end
end
turnLeft(pos_body,pos_head,vec_tail,new_vec,per,c,t_turn,t);
end

