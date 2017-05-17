x_body=rand*65; y_body=rand*100; pos_body=[x_body y_body];
x_vec=rand*2; y_vec=sqrt(4-xVec^2); vec=[x_vec y_vec];
x_head=x_body+x_vec; y_head=y_body+y_vec; pos_head=[x_head y_head];
initCon=rand;
run(pos_body,pos_head,vec,initCon,0,0)
%turnLeft(x,y,xVec,yVec,initCon,0)


