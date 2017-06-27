matrix=[];
num_sim=50;
sim_length=1250;
for i=1:num_sim
    main(sim_length)
    if i==1
        matrix=getGlobaln;
    else
    matrix=cat(1,matrix,getGlobaln);
    end
end
avg=mean(matrix);
%dev=std(matrix);
% for i=1:size(matrix,2)
%     sum=0;
%     for j=1:size(matrix,1)
%         sum=sum+matrix(j,i);
%     end
%     avg_distance=cat(2,avg_distance,(sum/num_sim));
% end
plot(avg); hold on;
%plot(dev);