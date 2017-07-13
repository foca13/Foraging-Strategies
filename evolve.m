function evolve (pop_size,num_gen,num_sim,sim_length,s1,s2,s3)
population=[];
fileID=fopen('RunData','w'); %open the file where the data is gonna be recorded
fprintf(fileID,'%s','population size:');
fprintf(fileID,'%d',pop_size);
fprintf(fileID,'\n%s','number of generations:');
fprintf(fileID,'%d',num_gen);
fprintf(fileID,'\n%s','number of simulations:');
fprintf(fileID,'%d',num_sim);
for i=1:pop_size
    rng shuffle
    R=rand*s1;
    T=rand*s2;
    W=rand*s3;
    d=subroutine(R,T,W,num_sim,sim_length);
    larva=[d R T W];
    population=cat(1,population,larva);
end %each iteration of the loop is a larva with a set R T and W values that runs subroutine
%create initial population with random R,T and W values
distance=mean(population(:,1))
run=mean(population(:,2));
turn=mean(population(:,3));
weathervane=mean(population(:,4));
gen='generation-1';
fprintf(fileID,'\n%s',gen);
fprintf(fileID,'\n');
for r=1:size(population,1)
    for x=1:size(population,2)
        fprintf(fileID,'%.4f\v\v',population(r,x));
    end
    fprintf(fileID,'\n');
end
fprintf(fileID,'\n');
fprintf(fileID,'%.4f\v\v',distance);
fprintf(fileID,'%.4f\v\v',run);
fprintf(fileID,'%.4f\v\v',turn);
fprintf(fileID,'%.4f\v\v',weathervane);
fprintf(fileID,'\n\n');
g=0;
generation=[];
distance=[];
run=[];
turn=[];
weathervane=[];
for i=1:num_gen-1
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
    %get the furthest and closest larvae from the population 
    parents=[];
    sum=0;
    for k=1:size(population,1)
        population(k,1)=(1-(population(k,1)-min)/(max-min));
        population(k,1)=round((population(k,1)^2)*100);
        sum=sum+population(k,1);
        p=zeros(1,population(k,1));
        for l=1:population(k,1)
          p(l)=k;
        end
        parents=cat(2,parents,p);
    end
    %new_population=zeros(size(population,1),4);
    for m=1:pop_size
        rng shuffle
        mother_index=round(rand*size(parents,2));
        if mother_index==0
            mother_index=1;
        end
        mother=parents(mother_index);
        father_index=round(rand*size(parents,2));
        if father_index==0
            father_index=1;
        end
        father=parents(father_index);
        R=population(mother,2);
        T=population(father,3);
        if rand<0.5
            W=population(mother,4);
        else
            W=population(father,4);
        end
%         R=(population(mother,2)+population(father,2))/2;
%         T=(population(mother,3)+population(father,3))/2;
%         W=(population(mother,4)+population(father,4))/2;
        %mutation rate
        if rand<0.01
            if rand<0.3333
                T=round(rand*200);
            elseif rand<0.6666
                R=round(rand*200);
            else
                W=round(rand*200);
            end
        end
        d=subroutine(R,T,W,num_sim,sim_length);
        larva=[d R T W];
        if m==1
            new_population=larva;
        else
        new_population=cat(1,new_population,larva);
        end
    end
    population=new_population;
    str=int2str(i+1);
    num='generation';
    gen=strcat(num,'-',str);
    fprintf(fileID,'%s',gen);
    fprintf(fileID,'\n');
    for r=1:size(population,1)
        for x=1:size(new_population,2)
            fprintf(fileID,'%.4f\v\v',population(r,x));
        end
        fprintf(fileID,'\n');
    end
    distance=cat(2,distance,mean(population(:,1)));
    run=cat(2,run,mean(population(:,2)));
    turn=cat(2,turn,mean(population(:,3)));
    weathervane=cat(2,weathervane,mean(population(:,4)));
    fprintf(fileID,'\n');
    fprintf(fileID,'%.4f\v\v',distance(i));
    fprintf(fileID,'%.4f\v\v',run(i));
    fprintf(fileID,'%.4f\v\v',turn(i));
    fprintf(fileID,'%.4f\v\v',weathervane(i));
    fprintf(fileID,'\n\n');
    g=g+1;
    generation=cat(2,generation,g);
    distance(i)
end
plot(generation,distance,'b'); hold on;
plot(generation,run,'g'); hold on;
plot(generation,turn,'r'); hold on;
plot(generation,weathervane,'y'); hold on;
end