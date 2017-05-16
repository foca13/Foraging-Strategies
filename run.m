function [] = run(x,y,xVec,yVec,per,t)
x=x+0.1*xVec;
y=y+0.1*yVec;
p_run_terminate=0.148;
for i = 0:t
    p_run_terminate=(p_run_terminate+per(t-i+1)*(-1+i/100))/10;
    plot_kernal(i+1)=(-1+i/100);
end
plot(plot_kernal)
p=perception();
per=cat(2,per,p);
t=t+1;
x;
y;
if rand>p_run_terminate
    run(x,y,xVec,yVec,per,t);
%else if rand<0.5
       % turnLeft(x,y,xVec,yVec,per(t),0);
  %  else turnRight();
   % end
end
end


