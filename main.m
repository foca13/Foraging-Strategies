function main(time)
d=[];
rng shuffle;
x_body=rand*630; y_body=rand*980; pos_body=[x_body y_body];
x_vec=rand*20; y_vec=sqrt(400-x_vec^2); vec=[x_vec y_vec];
x_head=x_body+x_vec; y_head=y_body+y_vec; pos_head=[x_head y_head];
arena=concentration(650,1000);
setGlobalx(arena);
init_con=arena(round(pos_head(1)),round(pos_head(2)));
setGlobalv(pos_body,pos_head,vec,vec,init_con,0,0,0,0,0,0,0)
setGlobalz(0);
setGlobaly([]);
t=0;
%parameters:pos_body,pos_head,vec_tail,vec,con,per,t_run,w,t_w,s,t_turn,angle,d
while t<=time
    var=getGlobalv;
    pos_body=[var(1) var(2)];
    vec_tail=[var(5) var(6)];
    vec=[var(7) var(8)];
    con=var(9);
    t_run=var(10);
    w=var(11);
    t_w=var(12);
    s=var(13);
    t_turn=var(14);
    angle=var(15);
    t_r=var(16);
    per=getGlobaly;
    z=getGlobalz;
    if z==4
        if rand<0.5
            z=1;
        else z=2;
        end
    end
    switch z
        case 0
            run(pos_body,vec_tail,vec,con,per,t_run,w,t_w,s,t)
        case 1
            turnLeft(pos_body,vec_tail,vec,con,per,t_turn,t)
        case 2
            turnRight(pos_body,vec_tail,vec,con,per,t_turn,t)
        case 3
            recenter(pos_body,vec_tail,vec,con,per,s,t_turn,angle,t_r)
    end
    var=getGlobalv;
    pos_head=[var(3) var(4)];
    distance=sqrt(abs((pos_head(1)-325)^2+(pos_head(2)-500)^2));
    d=cat(2,d,distance);
    t=t+1;
end
setGlobaln(d)
end