population_size=10;
population=[];
for i=1:population_size
    rng shuffle
    R=rand*200;
    T=rand*200;
    W=rand*200;
    d=subroutine(R,T,W);
    larva=[d R T W];
    population=cat(1,population,larva);
end
max=0;
for j=1:size(population,1)
if population(j,1)>max
    max=population(j,1);
end
end
population
max