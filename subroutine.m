function [d] = subroutine (R,T,W)
matrix=[];
num_sim=50;
sim_length=1200;
for i=1:num_sim
    main(sim_length,R,T,W)
    matrix=cat(1,matrix,getGlobaln);
end
avg=mean(matrix);
avg_d=mean(avg);
d=avg(sim_length+1);
%plot(avg); hold on;
end