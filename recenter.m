function [] = recenter (pos_body,vec_tail,vec,con,per,t_turn,t,s,angle,d,time,r)
if t>time
    setGlobaly(d)
    setGlobalz(false)
    r=r+1;
    num_sim=getGlobalv;
    matrix=getGlobaln;
    if r==1
        matrix=d;
    end
    clearvars -except matrix num_sim time r;
    main(matrix,num_sim,time,r)
end
a=getGlobalx;
if s==0
    for i = 1:5
        if t>time
            break 
        end
        vec=vec*[cosd(angle/5) -sind(angle/5); sind(angle/5) cosd(angle/5)];
        pos_head=pos_body+vec;
        if pos_head(1)>=650
            pos_head(1)=650;
        end
        if pos_head(1)<=1
            pos_head(1)=1;
        end
        if pos_head(2)>=1000
            pos_head(2)=1000;
        end
        if pos_head(2)<=1
            pos_head(2)=1;
        end
        per=cat(2,per,perception(pos_head,con));
        con=a(round(pos_head(1)),round(pos_head(2)));
        distance=sqrt((pos_head(1)-325)^2+(pos_head(2)-500)^2);
        d=cat(2,d,distance);
        t=t+1;
        t_turn=t_turn+1;
    end
else for i = 1:5
        if t>time
            break 
        end
        vec=vec*[cosd(angle/5) sind(angle/5); -sind(angle/5) cosd(angle/5)];
        pos_head=pos_body+vec;
        if pos_head(1)>=650
            pos_head(1)=650;
        end
        if pos_head(1)<=1
            pos_head(1)=1;
        end
        if pos_head(2)>=1000
            pos_head(2)=1000;
        end
        if pos_head(2)<=1
            pos_head(2)=1;
        end
        per=cat(2,per,perception(pos_head,con));
        con=a(round(pos_head(1)),round(pos_head(2)));
        distance=sqrt((pos_head(1)-325)^2+(pos_head(2)-500)^2);
        d=cat(2,d,distance);
        t=t+1;
        t_turn=t_turn+1;
    end
end
turn(pos_body,vec_tail,vec,con,per,t_turn,t,d,time,r)
end