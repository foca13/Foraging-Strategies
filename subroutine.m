function [d] = subroutine (R,T,W,num_sim,sim_length)
matrix=[];
for i=1:num_sim
    distance=main(R,T,W,sim_length);
    matrix=cat(1,matrix,distance);
end
avg=mean(matrix);
d=mean(avg);
%d=avg(sim_length+1);
%plot(avg); hold on;
end