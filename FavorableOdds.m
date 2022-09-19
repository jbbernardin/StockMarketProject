clear all
clc

screen = get( groot, 'Screensize' );
n = 1000;
a = (0:.01:1);
N = size(a,2);

r = @(x) 1/n*log(100*(1+x)^n);
dr = @(x) 1/(1+x);

ra = zeros(1,N);
dra = zeros(1,N);

for k = 1:N
    ra(k) = r(a(k));
    dra(k) = dr(a(k));
end

localmaxmin = (dra == 0);
first = ra(1);
last = ra(N);

max = intmin;
maxa = -1;
for k = 1:N
    if localmaxmin(k) == 1
        if max<ra(k)
            max = ra(k);
            maxa = a(k);
        end
    end
end
if max<first
    max = first;
    maxa = a(1);
end
if max<last
    max = last;
    maxa = a(N);
end

figure('Position',[screen(1),screen(2)+ceil((5/72)*screen(4)),screen(3),screen(4)-ceil((25/144)*screen(4))])
plot(a,ra)
txt = ['\leftarrow Optimal a = ', num2str(maxa)];
title('Profit if Betting in Favor and Winning Every Time')
xlabel('Percent in Favor')
ylabel('Best Case Results')
text(maxa,ra(maxa),txt)
