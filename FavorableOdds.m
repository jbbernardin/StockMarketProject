clear all
clc

screen = get( groot, 'Screensize' );
n = 1000;
p = .75;
X0 = 100;
a = 0:.01:1;
len = length(a);
N = 10000;
avgrap = zeros(1,len);

for k = 1:len
    rap = zeros(1,N);
    for m = 1:N
        Xn = X0;
        for i = 1:n
            if rand < p
                Xn = Xn*(1+a(k));
            else
                Xn = Xn*(1-a(k));
            end
        end
        rap(m) = 1/n*log(Xn);
    end
    avgrap(k) = mean(rap);
end

[rmax,maxIndex] = max(avgrap);
amax = a(maxIndex);

figure('Position',[screen(1),screen(2)+ceil((5/72)*screen(4)),screen(3),screen(4)-ceil((25/144)*screen(4))])
plot(a,avgrap)
title(['Average r(a,p) with Fixed p = ', num2str(p), ' and Varied a'])
ylabel('r(a,p)')
xlabel('a')
txt = ['\leftarrow Optimal a = ', num2str(amax)];
text(amax,rmax,txt)
