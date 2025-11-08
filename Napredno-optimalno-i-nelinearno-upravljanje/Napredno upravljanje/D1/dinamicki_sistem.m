function dx = dinamicki_sistem(t,x)
    dx = zeros(2,1);
    u = sin(t);
    dx(1) = x(2);
    dx(2) = 5*x(1) - 3*x(2) + u;
end