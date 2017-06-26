matrix=[];
num_sim=1;
setGlobalv(num_sim);
w=getGlobalw;
if w==true
main(matrix,num_sim,5000,0)
end
matrix=getGlobaln;
avg_distance=[];
for i=1:size(matrix,2)
    sum=0;
    for j=1:size(matrix,1)
        sum=sum+matrix(j,i);
    end
    avg_distance=cat(2,avg_distance,(sum/num_sim));
end
plot(avg_distance,'xb')
error('I am done in a lazy way');