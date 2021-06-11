x = linspace(0,1,21); 
x_real= linspace(0,1,210);
y = -sin(.8 * pi * x);
y_real= -sin(.8 * pi * x_real);

y_lin= -0.6502*x-0.3735

y_sqr=(y_lin-y).^2
MSE= sum(y_sqr)/21


plot(x,y,'o');
hold on
plot(x_real,y_real);

