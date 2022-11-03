%h= xlsread('rough_code.xlsx');
clear all;
clc;
[~,sheet_name]=xlsfinfo('input_ar_1000.xlsx');
for k=1:numel(sheet_name)
  all_ans{k}=xlsread('input_ar_1000.xlsx',sheet_name{k});  
end
mat1=[];
s=1;
for i=1:k
    e=i*3;
    mat1(:,s:e)=all_ans{1,i};
    s=e+1;
end
%columnIndicesToDelete = [1 4 7 10 13 16];
columnIndicesToDelete = [1 4 7 10 13];
mat1(:,columnIndicesToDelete)=[];
xlswrite('shanmugam_n_full.xlsx',mat1);
fprintf('Execution over')
    
    