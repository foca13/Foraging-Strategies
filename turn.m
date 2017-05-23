function [] = turn (arena,pos_body,pos_head,vec_tail,vec,con,per,t_turn,t)
if rand<0.5
    turnLeft(arena,pos_body,pos_head,vec_tail,vec,con,per,0,t_turn,t)
else turnRight(arena,pos_body,pos_head,vec_tail,vec,con,per,0,t_turn,t)
end

