figure
hold on
for i=-32:32
     x=i;
    if x==0
        y=0.125;
        stem(x,y,'k*')
    else
   
    y=sin(x*(0.125*pi))/(pi*x);
    stem(x,y,'k*')
    grid on
    end
end
hold off