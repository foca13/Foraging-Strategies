x_body=rand*65; y_body=rand*100; pos_body=[x_body y_body];
x_vec=rand*2; y_vec=sqrt(4-x_vec^2); vec=[x_vec y_vec];
x_head=x_body+x_vec; y_head=y_body+y_vec; pos_head=[x_head y_head];
%x_tail=x_body-x_vec; y_tail=y_body-y_vec; pos_tail=[x_tail y_tail];
%vec_tail=[x_body-x_tail y_body-y_tail];
%run(pos_body,pos_head,vec,vec,initCon,0,0,0,0,0)
%turnLeft(pos_body,pos_head,vec,vec,initCon,0,0,0)
arena=concentration(65,100);
init_con=arena(floor(pos_head(1)),floor(pos_head(2)));
run(arena,pos_body,pos_head,vec,vec,init_con,0,0,0,0,0,0);