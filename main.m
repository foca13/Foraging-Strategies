function main(matrix,num_sim,time,r)
setGlobaln(matrix)
if r>=num_sim
    setGlobalw(false)
    subroutine
end
z=getGlobalz;
if z==true
rng shuffle;
x_body=rand*630; y_body=rand*980; pos_body=[x_body y_body];
x_vec=rand*20; y_vec=sqrt(400-x_vec^2); vec=[x_vec y_vec];
x_head=x_body+x_vec; y_head=y_body+y_vec; pos_head=[x_head y_head];
arena=concentration(650,1000);
setGlobalx(arena);
d=[];
init_con=arena(round(pos_head(1)),round(pos_head(2)));
run(pos_body,vec,vec,init_con,0,0,0,0,0,0,d,time,r);
%distancearray appaend =getGlobaly;
end
distance=getGlobaly;
matrix=cat(1,matrix,distance);
setGlobalz(true);
main(matrix,num_sim,time,r)
end