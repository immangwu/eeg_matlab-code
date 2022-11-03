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
    r_ = randi([1 b],1,re);
    columnIndicesToDelete = [r_];
    p1(:,columnIndicesToDelete)=[];
    t1(:,columnIndicesToDelete)=[];
    p1=p1';
    t1=t1';
end
xlswrite('input_Power_70.xlsx',p1);
xlswrite('output_Power_70.xlsx',t1);

    
