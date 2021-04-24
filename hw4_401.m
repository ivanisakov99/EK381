figure
hold on
for i=-32:32
    x=i;
    y=cos(0.125*pi*x) + sin(0.25*pi*x + 0.16*pi);
    stem(x,y,'k*')
    grid on
end
hold off