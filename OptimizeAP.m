clear all
clc

screen = get( groot, 'Screensize' );
n = 1000;
p = .51:.01:1;
X0 = 100;
a = 0:.01:1;
lena = length(a);
lenp = length(p);
N = 10000;
ap = zeros(1,lenp);

tic
for j = 1:lenp
    avgrap = zeros(1,lena);
    for k = 1:lena
        rap = zeros(1,N);
        for m = 1:N
            Xn = X0;
            for i = 1:n
                if rand < p(j)
                    Xn = Xn*(1+a(k));
                else
                    Xn = Xn*(1-a(k));
                end
            end
            rap(m) = 1/n*log(Xn);
        end
        avgrap(k) = mean(rap);
    end
    [~,maxIndex] = max(avgrap);
    ap(j) = a(maxIndex);
end
toc
figure('Position',[screen(1),screen(2)+ceil((5/72)*screen(4)),screen(3),screen(4)-ceil((25/144)*screen(4))])
plot(p,ap)
title('a(p) with increasing p')
xlabel('p')
ylabel('a')