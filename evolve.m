population_size=50;
population=[];
num_generations=50;
for i=1:population_size
    rng shuffle
    R=rand*200;
    T=rand*200;
    W=rand*200;
    d=subroutine(R,T,W);
    larva=[d R T W];
    population=cat(1,population,larva);
end
distance=mean(population(1));
%create initial population
g=0;
generation=[];
distance=[];
run=[];
turn=[];
weathervane=[];
for p=1:num_generations
    min=population(1,1);
    max=0;
    for j=1:size(population,1)
        if population(j,1)<min
            min=population(j,1);
        end
        if population(j,1)>max
            max=population(j,1);
        end
    end
    parents=[];
    for k=1:size(population,1)
        population(k,1)=(population(k,1)-min)/(max-min);
        population(k,1)=round(population(k,1)*100);
        p=zeros(1,population(k,1));
        for l=1:population(k,1)
           p(l)=k;
        end
        parents=cat(2,parents,p);
    end
    %new_population=zeros(size(population,1),4);
    for m=1:population_size
        rng shuffle
        mother_index=round(rand*size(parents,2));
        if mother_index~=0
        mother=parents(mother_index);
        end
        father_index=round(rand*size(parents,2));
        if father_index~=0
        father=parents(father_index);
        end
        R=(population(mother,2)+population(father,2))/2;
        T=(population(mother,3)+population(father,3))/2;
        W=(population(mother,4)+population(father,4))/2;
        %mutation rate
        if rand<0.1
            if rand<0.3333
                T=rand*200;
            elseif rand<0.666
                R=rand*200;
            else
                W=rand*200;
            end
        end
        d=subroutine(R,T,W);
        larva=[d R T W];
        if m==1
            new_population=larva;
        else
        new_population=cat(1,new_population,larva);
        end
    end
    population=new_population;
    distance=cat(2,distance,mean(new_population(1)));
    run=cat(2,run,mean(new_population(2)));
    turn=cat(2,turn,mean(new_population(3)));
    weathervane=cat(2,weathervane,mean(new_population(4)));
    g=g+1;
    generation=cat(2,generation,g);
end
plot(generation,distance,'b'); hold on;
plot(generation,run,'g'); hold on;
plot(generation,turn,'r'); hold on;
plot(generation,weathervane,'y'); hold on;
