clear all;
clc;
h= xlsread('shanmugam_F_full.xlsx');
ht=h';
wn=125; %sampling frequency/2
[b1 a1]=cheby2(2,40,[0.5/wn 3/wn]); %http://matlab.izmiran.ru/help/toolbox/signal/cheby2.html delta (1–3 Hz)
%freqz(b1,a1)
[b2 a2]=cheby2(2,40,[4/wn 7/wn]); %theta (4–7 Hz)
%figure;
%freqz(b2,a2)
[b3 a3]=cheby2(2,40,[8/wn 13/wn]);%alpha (8–12 Hz)
%figure;
%freqz(b3,a3)
[b4 a4]=cheby2(2,40,[14/wn 20/wn]);%beta (13–30 Hz)
%figure;
%freqz(b4,a4)
yr=[];
count =1;
for j=1:5 %no.of task * no.of trials
    ys=[];
    for i=1:2 %no of electrode signals
        y1=filter (b1,a1,ht(count,:)); %https://in.mathworks.com/help/matlab/ref/filter.html
        y2=filter (b2,a2,ht(count,:));
        y3=filter (b3,a3,ht(count,:));
        y4=filter (b4,a4,ht(count,:));
        %y1s=arburg(y1,6); %https://in.mathworks.com/help/signal/ref/arburg.html
        mx1=mean(y1);
        Ex1 = norm(y1,2)^2;  % the energy 
        Px1 = 1/numel(y1)*norm(y1,2)^2; % power
        y2s=arburg(y2,6);
        y3s=arburg(y3,6);
        y4s=arburg(y4,6);
        yt=[Ex1 y2s y3s y4s];%feature from l electrode 
        ys=[ys yt];
        count = count+1;
    end
    yr=[yr;ys];
end
%yrdb =20*log(yr);
xlswrite('shanmugam_F_full_feature.xlsx',yr);
fprintf('Execution over')

    
        
        
        

