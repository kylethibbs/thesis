% 
% 
% data1 = readcell('C:\School\Endicott\MATLAB\Thesis\cubicTimeTestXL.xlsx','Sheet','times');
% 
% rtdata = cell2mat(data1(2:end,6));
% cddata = cell2mat(data1(2:end,7));
% cdsdata = cell2mat(data2(2:end,8));
% 
% [h1,p1,ci1,stats1] = ttest2( cddata, rtdata,'Tail','left');
% 
% data2 = readcell('C:\School\Endicott\MATLAB\Thesis\quadraticTimeTestXL.xlsx','Sheet','times');
% 
% rtqdata = cell2mat(data2(2:end,6));
% qddata = cell2mat(data2(2:end,7));
% qdsdata = cell2mat(data2(2:end,8));
% 
% [h2,p2,ci2,stats2] = ttest2( qddata,rtqdata, 'Tail','left');


data1 = readcell('C:\School\Endicott\MATLAB\Thesis\cubicTimeTestXL.xlsx','Sheet','timesImaginary');

rtdata = cell2mat(data1(2:end,6));
cddata = cell2mat(data1(2:end,7));
cdsdata = cell2mat(data2(2:end,8));

[h1,p1,ci1,stats1] = ttest2( cddata, rtdata,'Tail','left');

data2 = readcell('C:\School\Endicott\MATLAB\Thesis\quadraticTimeTestXL.xlsx','Sheet','timesImaginary');

rtqdata = cell2mat(data2(2:end,6));
qddata = cell2mat(data2(2:end,7));
qdsdata = cell2mat(data2(2:end,8));

[h2,p2,ci2,stats2] = ttest2( qddata,rtqdata, 'Tail','left');