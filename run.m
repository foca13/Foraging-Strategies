function [] = run(pos_body,pos_head,vec_tail,vec,per,w,t_run,t)

if t_run<10
    pos_head=pos_body+0.1*vec;
    pos_body=pos_body+0.1*vec;
    vec_tail=vec;
    per=cat(2,per,percetion());
    t=t+1;
    t_run=t_run+1;
    run(pos_body,pos_head,vec_tail,vec,per,w,t_run,t);
end

if w==0 && rand>0.1
        w=w+1;
end

if w == 1 && angle<abs(20)
    if rand<0.5
        new_vec=vec*[cosd(6) sind(6); -sind(6) cosd(6)];
    else
        new_vec=vec*[cosd(-6) sind(-6); -sind(-6) cosd(-6)];
    end
end
r_weathervane_cast_termination=2;

p=perception();
pos_body=pos_body+0.1*vec;
pos_head=pos_head+0.1*vec;

run_terminate_base=0.148;
t_run_kernel=0;
for i = 0:t_run
    t_run_kernel=t_run_kernel+per(t-i+1)*(-1+i/10);
    %plot_kernal(i+1)=(-1+i/10);
end
r_run_terminate=run_terminate_base+t_run_kernel;
p_run_terminate=r_run_terminate*0.1;
%plot(plot_kernal);
per=cat(2,per,p);
t_run=t_run+1;
t=t+1;
t
if rand>p_run_terminate
    run(pos_body,pos_head,vec_tail,vec,per,w,t_run,t);
%else turnLeft(pos_body,pos_head,pos_tail,vec,per,0,0,t);
%else if rand<0.5
       % turnLeft(x,y,xVec,yVec,per(t),0);
  %  else turnRight();
   % end
end
end