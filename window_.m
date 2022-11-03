% File name :featurebandwindow.m
% to extract band power mu and beta only from segmented data
% per task OF AUDIO DATA, data for four tasks for one subject is given as input file
% the input data file should have 2000 rows and  80coulmns
% only one channel per trial are selected 
% Program Copy Rights :Dr.Paulraj M P, UniMAP, Jejawi. <:-()

clear all;
clc;
wn = 125; % sampling frequency /2
a = xlsread('shanmugam_F_full.xlsx');
at = a';
[b1 a1] = cheby2(2,40,[0.1/wn 99/wn]);
at1 = filter(b1,a1,at);
[m n] = size(at1);
window_size = 100;
over_lap = 50.0;
window_width = ceil(window_size-window_size*over_lap/100)
total_frames = ceil(n/window_width)-1
block_start = 1;
block_width = 1;
block_finish = block_start + block_width-1;

a_whole = [];
a_row = [];
for block = 1:40
    at = at1(block_start:block_finish,:);
block_start = block_finish + 1;
block_finish = block_start + block_width - 1;
window_initial = 1;
window_final = window_initial + window_width - 1;
a_frame = [];
a_rowframe = [];
for frame = 1:total_frames       
ax = at(:,window_initial:window_final);
window_initial = window_initial + window_width;
window_final = window_initial + window_width - 1;
wn = 100;
                [b2 a2] = cheby2(2,40,[8/wn 10/wn]);
                [b3 a3] = cheby2(2,40,[10/wn 12/wn]);
                [b4 a4] = cheby2(2,40,[13/wn 15/wn]);
                [b5 a5] = cheby2(2,40,[16/wn 18/wn]);
                [b6 a6] = cheby2(2,40,[19/wn 30/wn]);
yr = [];
                count = 1;
%for j = 1:40
ys = [];
                        y1 = filter(b2,a2,ax(count,:));
                        y2 = filter(b3,a3,ax(count,:));
                        y3 = filter(b4,a4,ax(count,:));
                        y4 = filter(b5,a5,ax(count,:));
                        y5 = filter(b6,a6,ax(count,:));

                        y1s = sum(abs(y1.*y1));
                        y2s = sum(abs(y2.*y2));
                        y3s = sum(abs(y3.*y3));
                        y4s = sum(abs(y4.*y4));
                        y5s = sum(abs(y5.*y5));


yt = [y1s y2s y3s y4s y5s];
ys = [ys yt];
                        count = count +1;
yr = [yr;ys];
% end
yrdb = 20*log(yr');
%svdf = svd(ax);
a_frame = [a_frame;yrdb'];
a_rowframe = [a_rowframe;yrdb'];
end
a_whole = [a_whole;a_frame];
%a_row = [a_row;a_rowframe];
end
xlswrite('Features_Extracted.xlsx',a_whole);
fprintf('Execution Over');

