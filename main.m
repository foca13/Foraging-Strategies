x=rand*65; y=rand*100; pos1=[x,y];
xVec=rand*2; yVec=sqrt(4-xVec^2); vec=[xVec,yVec];
pos2=pos1+vec;
initCon=rand;
%run(x,y,xVec,yVec,initCon,0)
turnLeft(x,y,xVec,yVec,initCon,0)



