function [] = turn (pos_body,pos_head,vec_tail,vec,con,per,t_turn,t)
if rand<0.5
    turnLeft(pos_body,pos_head,vec_tail,vec,con,per,t_turn,t)
else turnRight(pos_body,pos_head,vec_tail,vec,con,per,t_turn,t)
end

