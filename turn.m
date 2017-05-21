function [] = turn (pos_body,pos_head,vec_tail,vec,per,t_run,t)
if rand<0.5
    turnLeft(pos_body,pos_head,vec_tail,vec,per,0,t_run,t)
else turnRight(pos_body,pos_head,vec_tail,vec,per,0,t_run,t)
end

