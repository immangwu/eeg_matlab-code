%h= xlsread('rough_code.xlsx');
clear all;
clc;
h= xlsread('input_train.xlsx');%100%
i=xlsread('output_train.xlsx');
columnIndicesToDelete = [1 4 7 10 13];
h(columnIndicesToDelete,:)=[];
i(columnIndicesToDelete,:)=[];
xlswrite('input_test.xlsx',h);%60
xlswrite('output_test.xlsx',i);
fprintf('Execution over')


    
    