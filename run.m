function [] = run(pos_body,pos_head,pos_tail,vec,per,t_run,t)
r_weathervane_cast_termination=2;
r_weathervane_cast_resume=1;

p=perception();
pos_body=pos_body+0.1*vec;
pos_head=pos_head+0.1*vec;
pos_tail=pos_tail+0.1*vec;

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
if rand>p_run_terminate && t_run>10
    run(pos_body,pos_head,pos_tail,vec,per,t_run,t);
%else turnLeft(pos_body,pos_head,pos_tail,vec,per,0,t);
%else if rand<0.5
       % turnLeft(x,y,xVec,yVec,per(t),0);
  %  else turnRight();
   % end
end
end