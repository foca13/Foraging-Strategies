function [] = run(pos_body,pos_head,vec,per,t_run,t)
pos_body=pos_body+0.1*vec;
pos_head=pos_head+0.1*vec;
%p_run_terminate=0.148;
%for i = 0:t
    %p_run_terminate=(p_run_terminate+per(t-i+1)*(-1+i/100))/10;
    %plot_kernal(i+1)=(-1+i/100);
%end
run_terminate_base=0.148;
t_run_kernel=0;
for i = 0:t_run
    t_run_kernel=t_run_kernel+per(t-i+1)*(-1+i/10);
    %plot_kernal(i+1)=(-1+i/10);
end
r_run_terminate=run_terminate_base+t_run_kernel;
p_run_terminate=r_run_terminate*0.1;
%plot(plot_kernal);
p=perception(pos_head);
per=cat(2,per,p);
t_run=t_run+1;
t=t+1;
t
if rand>p_run_terminate
    run(pos_body,pos_head,vec,per,t_run,t);
%else turnLeft(pos_body,pos_head,vec,per,0,t);
%else if rand<0.5
       % turnLeft(x,y,xVec,yVec,per(t),0);
  %  else turnRight();
   % end
end
end