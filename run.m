function [] = run(pos_body,vec_tail,vec,con,per,t_run,w,t_w,s,t,R,W)
a=getGlobalx; %get the arena
angle=acosd(dot(vec,vec_tail)/(norm(vec)*norm(vec_tail))); %calculate the angle between vec and vec_tail
if rand<0.1 && t_run>10
    w=1; %transition to weathervane
end
if w == 1
    if angle < 5
        if rand<0.5
            vec=vec*[cosd(6) sind(6); -sind(6) cosd(6)];
            s=s+1;
        else
            vec=vec*[cosd(6) -sind(6); sind(6) cosd(6)];
        end
    elseif angle < 17
        if s==1
            vec=vec*[cosd(6) sind(6); -sind(6) cosd(6)];
        else
            vec=vec*[cosd(6) -sind(6); sind(6) cosd(6)];
        end
    else
        if s==1
            s=0;
            vec=vec*[cosd(6) -sind(6); sind(6) cosd(6)];
        else 
            s=1;
            vec=vec*[cosd(6) sind(6); -sind(6) cosd(6)];
        end
    end
end
%^weathervane
pos_body=pos_body+0.1*vec; %move the larva (length of the vec represents 2mm irl, larvae move 1mm/s)
pos_head=pos_body+vec;
if pos_head(1)>650||pos_head(1)<1
    angle=acosd(dot(vec,[0 1])/(norm(vec)));
    if pos_head(1)>650
        pos_head(1)=650;
        pos_body(1)=650;
    elseif pos_head(1)<1
          pos_head(1)=1;
          pos_body(1)=1;
    end
    if angle>90
        vec=[0 -20];
    elseif angle<90
            vec=[0 20];
    else if pos_head(2)>500
            vec=[0 -20];
        else vec=[0 20];
        end
    end
end
if pos_head(2)>1000||pos_head(2)<1
    angle=acosd(dot(vec,[1 0])/(norm(vec)));
    if pos_head(2)>1000
        pos_head(2)=1000;
        pos_body(2)=1000;
    elseif pos_head(2)<1
          pos_head(2)=1;
          pos_body(2)=1;
    end
    if angle>90
        vec=[20 0];
    elseif angle<90
            vec=[-20 0];
    else if pos_head(1)<325
            vec=[20 0];
        else vec=[-20 0];
        end
    end
end
%^check is larva moves out of the arena
%plot(pos_body(1),pos_body(2),'ob');hold on;
%vec_tail=vec;
per=cat(2,per,perception(pos_head,con)); %get the perception
con=a(round(pos_head(1)),round(pos_head(2))); %get the concentration at the head position
if w==1
weathervane_termination_base=0.2;
t_weathervane_kernel=0;
for i = 0:t_w
    if i<=10
        t_weathervane_kernel=t_weathervane_kernel+per(t-i+1)*85;
        %plot_kernal(i+1)=(85);
    elseif i<=100
        t_weathervane_kernel=t_weathervane_kernel+per(t-i+1)*(-5);
        %plot_kernal(i+1)=(-5);
    end
end
p_weathervane_terminate=weathervane_termination_base+t_weathervane_kernel*W;
angle=acosd(dot(vec,vec_tail)/(norm(vec)*norm(vec_tail)));
%^calculate the probability of terminating weathervane
t_w=t_w+1;
if rand<p_weathervane_terminate
w=0;
t_w=0;
s=0;
end
end
run_terminate_base=0.148;
t_run_kernel=0;
for i = 0:t_run
    t_run_kernel=t_run_kernel+per(t-i+1)*(-1+i/100);
end
p_run_terminate=run_terminate_base+t_run_kernel*R;
%^calculate the probability of terminating a run
t_run=t_run+1;
setGlobaly(per)
setGlobalv(pos_body,pos_head,vec_tail,vec,con,t_run,w,t_w,s,0,angle,0) %setting all the global parameters
%plot(t,distance,'og'); hold on;
if rand<p_run_terminate && t_run>10
    if (vec(1)*vec_tail(2)-vec(2)*vec_tail(1))<0
        angle=-angle;
    end
    if abs(angle)<5
        angle=0;
    end
    if angle>0
        setGlobalz(2)
        %turnRight
    elseif angle<0
        setGlobalz(1)
        %turnLeft
    else
        setGlobalz(4)
        %turn
    end
end
end