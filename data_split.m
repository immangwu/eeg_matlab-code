clear all;
clc;
p1=xlsread('INPUT_TRAIN_POWER.xlsx');
t1=xlsread('OUTPUT_TRAIN_POWER.xlsx');
p1=p1';
t1=t1';

[a,b]=size(p1);
[c,d]=size(t1);
input_perc=0.7; %if its 80% type 0.8

if b==d
    r=b*input_perc;%no of datas required
    r=round(r);
    re=b-r;%no of datas removed
    r_ = randperm(b,re);
    columnIndicesToDelete = [r_];
    p1(:,columnIndicesToDelete)=[];
    t1(:,columnIndicesToDelete)=[];
    p2=p1';
    t2=t1';
end
xlswrite('input_70.xlsx',p2);
xlswrite('output_70.xlsx',t2);

    
