function [] = turnRight(pos_body,pos_head,vec_tail,vec,con,per,t_turn,t)
a=getGlobalx;
angle=acosd(dot(vec,vec_tail)/(norm(vec)*norm(vec_tail)));
if angle>=120
    recenter(pos_body,vec_tail,vec,con,per,t_turn,t,1,angle);
end
vec=vec*[cosd(24) -sind(24); sind(24) cosd(24)];
pos_head=pos_body+vec;
if pos_head(1)>=650 || pos_head(1)<=0 || pos_head(2)>=1000 || pos_head(2)<=0
    recenter(pos_body,vec_tail,vec,con,per,t_turn,t,1,angle);
end
%plot(pos_head(1),pos_head(2),'--xr'); hold on;
per=cat(2,per,perception(pos_head,con));
con=a(floor(pos_head(1)),floor(pos_head(2)));
turn_terminate_base=2;
t_turn_kernel=0;
for i = 0:t_turn
    if i<=5
    t_turn_kernel=(t_turn_kernel+per(t-i+1)*((150-30*i)/10));
    end
    %plot_kernal(i+1)=(150-30*i);
end
r_turn_terminate=turn_terminate_base+t_turn_kernel;
p_turn_terminate=r_turn_terminate*0.1;
t=t+1;
t_turn=t_turn+1;
if rand<p_turn_terminate && angle > 37
    run(pos_body,pos_head,vec_tail,vec,con,per,0,0,0,0,t);
else
turnRight(pos_body,pos_head,vec_tail,vec,con,per,t_turn,t);
end
end

