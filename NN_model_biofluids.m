clear all;
clc;
p1=xlsread('input_train1');
t1=xlsread('output_train1');
tic
p=p1';
t=t1';
net=newff(minmax(p),[4,1],{'logsig','tansig'},'trainlm');
net.trainparam.show=50;
net.trainparam.lr=0.0001;
net.trainparam.epochs=15000;
net.trainparam.goal=0;%1e-5;
% maximum validation failiures
net.trainparam.max_fail=6;
%Factor to use for memory / speed trade off.
net.trainparam.mem_reduc=1;
%minimum performance gradient
net.trainparam.min_grad = 1e-5;
%initial mu
net.trainparam.mu=0.001;
% mu decreases factor 
net.trainparam.mu_dec=0.1;
% mu increase factor 
net.trainparam.mu_inc=10;
% maximun mu 
net.trainparam.mu_max=200;
[net, tr]=train(net,p,t);
toc
%ares = bin_denor_x]s(a','maxmin_out.xls');
%tres=bin_denor_x]s(t','maxmin_out.xls');
%atres=[tres ares]
save net1 net;

%Testing the network for classification
p1=xlsread('input_train');
t1=xlsread('output_train');
p=p1';
t=t1';
tic
a=sim(net,p);
%[a(1,:)'t(1,:)' a(2,:)' t(2,:)' a(3,:)' t(3,:)']
e=a-t;
et=e';
[m n]=size(et);
count =0;
for i = 1:m
    flag=0;
    for j=1:n
        if(et(i,j)>0.1)
            flag=1;
        end
    end
    if flag ==0
        count=count+1;
    end
end
toc
perc_class=count/m;


