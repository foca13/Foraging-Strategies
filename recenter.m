function [] = recenter (pos_body,vec_tail,vec,con,per,t_turn,t,s,angle)
a=getGlobalx;
if s==0
    for i = 0:5
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
    end
else for i = 0:5
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
    end
end
t=t+5;
turn(pos_body,vec_tail,vec,con,per,t_turn,t)
end