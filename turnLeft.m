function [] = turnLeft(pos_body,vec_tail,vec,con,per,t_turn,t)
check=0;
a=getGlobalx;
angle=acosd(dot(vec,vec_tail)/(norm(vec)*norm(vec_tail)));
if angle>119
    setGlobalz(3);
    check=3;
end
vec=vec*[cosd(24) sind(24); -sind(24) cosd(24)];
pos_head=pos_body+vec;
if pos_head(1)>=650 || pos_head(1)<=1 || pos_head(2)>=1000 || pos_head(2)<=1
    setGlobalz(3);
    check=3;
    
    if pos_head(1)>650
        pos_head(1)=650;
        pos_body(1)=650;
    else if pos_head(1)<1
          pos_head(1)=1;
          pos_body(1)=1;
         end
    end
     if pos_head(2)>1000
        pos_head(2)=1000;
        pos_body(2)=1000;
    else if pos_head(2)<1
          pos_head(2)=1;
          pos_body(2)=1;
         end
    end
end
%plot(pos_head(1),pos_head(2),'--xr'); hold on;
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
t_turn=t_turn+1;
setGlobaly(per);
setGlobalv(pos_body,pos_head,vec_tail,vec,con,0,0,0,0,t_turn,angle,0);
if rand<p_turn_terminate && angle > 37 && check ~= 3
    setGlobalz(0);
end
end