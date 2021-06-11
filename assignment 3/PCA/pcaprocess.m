clear;
clc;
load choles_all;

for t=1:21

    norm_x=mapstd(p);
[processed,PS]= processpca(norm_x,0.1*(0.1).^(t-1));
Y= processpca('reverse',processed,PS);
rmsq(t)=sqrt(mean(mean((p-Y).^2)))

end

mean(mean(norm_x));