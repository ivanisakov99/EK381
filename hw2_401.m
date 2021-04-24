figure
hold on
for i=-16:16
     x=i;
    if x==0
        y=0.25;
        stem(x,y,'k*')
    else
   
    y=sin(x*(0.25*pi))/(pi*x);
    stem(x,y,'k*')
    grid on
    end
end
hold off