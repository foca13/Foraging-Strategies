function [] = turnRight(pos_body,vec_tail,vec,con,per,t_turn,t,d,time,r)
if t>time
    setGlobaly(d)
    setGlobalz(false)
    r=r+1;
    num_sim=getGlobalv;
    matrix=getGlobaln;
    if r==1
        matrix=d;
    end
    main(matrix,num_sim,time,r)
end
a=getGlobalx;
angle=acosd(dot(vec,vec_tail)/(norm(vec)*norm(vec_tail)));
if angle>119
    recenter(pos_body,vec_tail,vec,con,per,t_turn,t,1,angle,d,time,r);
end
vec=vec*[cosd(24) -sind(24); sind(24) cosd(24)];
pos_head=pos_body+vec;
if pos_head(1)>=650 || pos_head(1)<=1 || pos_head(2)>=1000 || pos_head(2)<=1
    recenter(pos_body,vec_tail,vec,con,per,t_turn,t,1,angle,r);
end
plot(pos_head(1),pos_head(2),'--xr'); hold on;
per=cat(2,per,perception(pos_head,con));
con=a(round(pos_head(1)),round(pos_head(2)));
turn_terminate_base=2;
t_turn_kernel=0;
for i = 0:t_turn
    if i<=5
    t_turn_kernel=(t_turn_kernel+per(t-i+1)*((150-30*i)));
    end
    %plot_kernal(i+1)=(150-30*i);
end
r_turn_terminate=turn_terminate_base+t_turn_kernel;
p_turn_terminate=r_turn_terminate;
t=t+1;
t_turn=t_turn+1;
distance=sqrt((pos_head(1)-325)^2+(pos_head(2)-500)^2);
if t_turn>1&&t_turn~=11&&t_turn~=21&&t_turn~=31&&t_turn~=41&&t_turn~=51&&t_turn~=61&&t_turn~=71
d=cat(2,d,distance);
end
%plot(t,distance,'og'); hold on;
if rand<p_turn_terminate && angle > 37
    run(pos_body,vec_tail,vec,con,per,0,0,0,0,t,d,time,r);
else
turnRight(pos_body,vec_tail,vec,con,per,t_turn,t,d,time,r);
end
end

