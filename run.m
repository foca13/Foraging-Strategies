function [] = run(pos_body,vec_tail,vec,con,per,w,t_w,s,t_run,t)
a=getGlobalx;
if t>3000
    error('program completed')
end
if t_run<10
    pos_body=pos_body+0.1*vec;
    pos_head=pos_body+vec;
    if pos_head(1)>=650
        pos_head(1)=650;
        pos_body(2)=pos_body(2)*(vec(2)/vec(2)*2);
        pos_head(2)=pos_head(2)+(vec(2)/vec(2)*2);
    end
    if pos_head(1)<=1
        pos_head(1)=1;
        pos_body(2)=pos_body(2)+(vec(2)/vec(2)*2);
        pos_head(2)=pos_head(2)+(vec(2)/vec(2)*2);
    end
    if pos_head(2)>=1000
        pos_head(2)=1000;
        pos_body(1)=pos_body(1)+(vec(1)/vec(1)*2);
        pos_head(1)=pos_head(1)+(vec(1)/vec(1)*2);
    end
    if pos_head(2)<=1
        pos_head(2)=1;
        pos_body(1)=pos_body(1)+(vec(1)/vec(1)*2);
        pos_head(1)=pos_head(1)+(vec(1)/vec(1)*2);
    end
    vec_tail=vec;
    per=cat(2,per,perception(pos_head,con));
    con=a(round(pos_head(1)),round(pos_head(2)));
    t=t+1;
    t_run=t_run+1;
    plot(pos_body(1),pos_body(2),'ob'); hold on;
    run(pos_body,vec_tail,vec,con,per,w,t_w,s,t_run,t);
end
if rand<0.1
    w=1;
end
angle=acosd(dot(vec,vec_tail)/(norm(vec)*norm(vec_tail)));
if w == 1
    if abs(angle) < 5
        if rand<0.5
            vec=vec*[cosd(6) sind(6); -sind(6) cosd(6)];
            s=s+1;
        else
            vec=vec*[cosd(-6) sind(-6); -sind(-6) cosd(-6)];
        end
    else if abs(angle) < 17
            if s==1
                vec=vec*[cosd(6) sind(6); -sind(6) cosd(6)]; 
            else
                vec=vec*[cosd(-6) sind(-6); -sind(-6) cosd(-6)];
            end
        else
            if s==1
                s=0;
                vec=vec*[cosd(-6) sind(-6); -sind(-6) cosd(-6)];
            else 
                s=1;
                vec=vec*[cosd(6) sind(6); -sind(6) cosd(6)];
            end
         end
    end
    pos_head=pos_body+vec;
    plot(pos_head(1),pos_head(2),'--xr'); hold on;
end
pos_body=pos_body+0.1*vec;
pos_head=pos_body+vec;
if pos_body(1)>=650
    pos_body(1)=650;
    pos_body(2)=pos_body(2)+(vec(2)/vec(2)*2);
end
if pos_body(1)<=1
    pos_body(1)=1;
    pos_body(2)=pos_body(2)+(vec(2)/vec(2)*2);
end
if pos_body(2)>=1000
    pos_body(2)=1000;
    pos_body(1)=pos_body(1)+(vec(1)/vec(1)*2);
end
if pos_body(2)<=1
    pos_body(2)=1;
    pos_body(1)=pos_body(1)+(vec(1)/vec(1)*2);
end
if pos_head(1)>=650
    pos_head(1)=650;
    pos_head(2)=pos_head(2)+(vec(2)/vec(2)*2);
end
if pos_head(1)<=1
    pos_head(1)=1;
    pos_head(2)=pos_head(2)+(vec(2)/vec(2)*2);
end
if pos_head(2)>=1000
    pos_head(2)=1000;
    pos_head(1)=pos_head(1)+(vec(1)/vec(1)*2);
end
if pos_head(2)<=1
    pos_head(2)=1;
    pos_head(1)=pos_head(1)+(vec(1)/vec(1)*2);
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
    t_run_kernel=t_run_kernel+per(t-i+1)*(-1+i/10);
    %p=per(t-i+1);
    %plot_kernal(i+1)=(-1+i/10);
end
r_run_terminate=run_terminate_base+t_run_kernel;
p_run_terminate=r_run_terminate*0.1;
%plot(plot_kernal);
%per=cat(2,per,p);
t_run=t_run+1;
t=t+1;
%t
%pos_head
%pos_body
%plot_per(t)=per(t);
%plot(plot_per,'.r');hold on;
%plot_con(t)=con;
%plot(plot_con,'.g');hold on;
if rand>p_run_terminate && t_run<200
    run(pos_body,vec_tail,vec,con,per,w,t_w,s,t_run,t);
else
    if (vec(1)*vec_tail(2)-vec(2)*vec_tail(1))<0
        angle=-angle;
    end
    if abs(angle)<5
        angle=0;
    end
    if angle>0
        turnRight(pos_body,vec_tail,vec,con,per,0,t);
    else if angle<0
            turnLeft(pos_body,vec_tail,vec,con,per,0,t);
        else
            turn(pos_body,vec_tail,vec,con,per,0,t);
        end
    end
%else turnLeft(pos_body,pos_head,pos_tail,vec,per,0,0,t);
%else if rand<0.5
        %turnLeft(x,y,xVec,yVec,per(t),0);
  %  else turnRight();
   % end
end
end