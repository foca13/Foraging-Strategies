function [] = turnLeft(pos_body,pos_head,vec,per,t)
new_vec=vec*[cosd(24) sind(24); -sind(24) cos(24)];
p_turn_terminate=2;
for i = 0:t
    if t<=5
    p_turn_terminate=(p_turn_terminate+per(t-i+1)*(150-30*i))/10;
    end
    plot_kernal(i+1)=(150-30*i);
end
plot(plot_kernal,t)
p=perception();
per=cat(2,per,p);
t=t+1;

%if rand>p_turn_terminate
if 0.5>rand
    turnLeft(pos_body,pos_head,new_vec,per,t);
end
end

