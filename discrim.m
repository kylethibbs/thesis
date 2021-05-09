
function discrim

% myFig = figure;
% grid on;
% hold on
% 
% f1 = [1 0 -3 4];
% f2 = [1 0 -3 2];
% f3 = [1 0 -3 0];
% f4 = [1 0 -3 -2];
% f5 = [1 0 -3 -4];
% 
% x = -5:.01:5;
% y = -10:.01:10;
% 
% xline = zeros(length(x));
% yline = zeros(length(y));
% 
% y1 = polyval(f1,x);
% y2 = polyval(f2,x);
% y3 = polyval(f3,x);
% y4 = polyval(f4,x);
% y5 = polyval(f5,x);
% 
% line(x,xline,'Color','k','LineStyle','-','LineWidth',1);
%  line(yline,y,'Color','k','LineStyle','-','LineWidth',1);
% 
% l1 = line(x,y1,'Color','b','LineStyle','-','LineWidth',2);
% l2 = line(x,y2,'Color','r','LineStyle','--','LineWidth',2);
% l3 = line(x,y3,'Color','g','LineStyle','-.','LineWidth',2);
% 
% l4 = line(x,y4,'Color','b','LineStyle','-','LineWidth',2);
% l5 = line(x,y5,'Color','r','LineStyle','--','LineWidth',2);
% 
% 
% 
% rt = [2.1958;roots(f2);roots(f3);roots(f4);-2.1958];
% zero = zeros(length(rt),1);
% 
% 
% 
% scatter(rt,zero, 500, 'Marker','.','MarkerFaceColor','k','MarkerEdgeColor','k');
% 
% 
% text(.1,-.5,'\Delta > 0')
% text(-1,-1,'\Delta = 0')
% text(1,1,'\Delta = 0')
% text(-1,-4,'\Delta < 0')
% text(1,4,'\Delta < 0')


myFig = figure;
grid on;
hold on

f1 = [1 0 -9];
f2 = [1 0 0];
f3 = [1 0 9];


x = -5:.01:5;
y = -10:.01:35;

xline = zeros(length(x));
yline = zeros(length(y));

y1 = polyval(f1,x);
y2 = polyval(f2,x);
y3 = polyval(f3,x);

line(x,xline,'Color','k','LineStyle','-','LineWidth',1);
line(yline,y,'Color','k','LineStyle','-','LineWidth',1);

l1 = line(x,y1,'Color','b','LineStyle','-','LineWidth',2);
l2 = line(x,y2,'Color','r','LineStyle','--','LineWidth',2);
l3 = line(x,y3,'Color','g','LineStyle','-.','LineWidth',2);




rt = [roots(f1);roots(f2);roots(f3)];
zero = zeros(length(rt),1);



scatter(rt,zero, 500, 'Marker','.','MarkerFaceColor','k','MarkerEdgeColor','k');


text(-.2,-7,'\Delta > 0')
text(-.2,3,'\Delta = 0')

text(-.2,13,'\Delta < 0')



end

 