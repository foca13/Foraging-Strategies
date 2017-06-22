function [] = run(pos_body,vec_tail,vec,con,per,w,t_w,s,t_run,t,d,time,r)
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
if rand<0.1
    w=1;
end
if w == 1
    if angle < 5
        if rand<0.5
            vec=vec*[cosd(6) sind(6); -sind(6) cosd(6)];
            s=s+1;
        else
            vec=vec*[cosd(6) -sind(6); sind(6) cosd(6)];
        end
    else if angle < 17
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
end
pos_body=pos_body+0.1*vec;
pos_head=pos_body+vec;
if pos_head(1)>650||pos_head(1)<1
    angle=acosd(dot(vec,[0 1])/(norm(vec)));
    if pos_head(1)>650
        pos_head(1)=650;
        pos_body(1)=650;
    else if pos_head(1)<1
          pos_head(1)=1;
          pos_body(1)=1;
         end
    end
    if angle>90
        vec=[0 -20];
    else if angle<90
            vec=[0 20];
        else
            if pos_head(2)>500
                vec=[0 -20];
            else 
                vec=[0 20];
            end
        end
    end
end
if pos_head(2)>1000||pos_head(2)<1
    angle=acosd(dot(vec,[1 0])/(norm(vec)));
    if pos_head(2)>1000
        pos_head(2)=1000;
        pos_body(2)=1000;
    else if pos_head(2)<1
          pos_head(2)=1;
          pos_body(2)=1;
         end
    end
    if angle>90
        vec=[20 0];
    else if angle<90
            vec=[-20 0];
        else
            if pos_head(1)<325
                vec=[20 0];
            else vec=[-20 0];
            end
        end
    end
end
plot(pos_body(1),pos_body(2),'ob');hold on;
vec_tail=vec;
per=cat(2,per,perception(pos_head,con));
con=a(round(pos_head(1)),round(pos_head(2)));
weathervane_termination_base=2;
t_weathervane_kernel=0;
for i = 0:t_w
    if i<=1
        t_weathervane_kernel=t_weathervane_kernel+per(t-i+1)*85;
    else if i<=10
        t_weathervane_kernel=t_weathervane_kernel+per(t-i+1)*(-5);
        end
    end
end
r_weathervane_terminate=weathervane_termination_base+t_weathervane_kernel;
p_weathervane_terminate=r_weathervane_terminate*0.1;
t_w=t_w+1;
if rand<p_weathervane_terminate
w=0;
t_w=0;
s=0;
end
run_terminate_base=0.148;
t_run_kernel=0;
for i = 0:t_run
    t_run_kernel=t_run_kernel+per(t-i+1)*(-1+i/100);
end
r_run_terminate=run_terminate_base+t_run_kernel;
p_run_terminate=r_run_terminate;
t_run=t_run+1;
t=t+1;
distance=sqrt((pos_head(1)-325)^2+(pos_head(2)-500)^2);
d=cat(2,d,distance);
%plot(t,distance,'og'); hold on;
if rand>p_run_terminate || t_run<10
    run(pos_body,vec_tail,vec,con,per,w,t_w,s,t_run,t,d,time,r);
else
    if (vec(1)*vec_tail(2)-vec(2)*vec_tail(1))<0
        angle=-angle;
    end
    if abs(angle)<5
        angle=0;
    end
    if angle>0
        turnRight(pos_body,vec_tail,vec,con,per,0,t,d,time,r);
    else if angle<0
            turnLeft(pos_body,vec_tail,vec,con,per,0,t,d,time,r);
        else
            turn(pos_body,vec_tail,vec,con,per,0,t,d,time,r);
        end
    end
end
end