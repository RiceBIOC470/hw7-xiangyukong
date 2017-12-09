function result = time_r(x0,a)
rhs=@(t,X) 2*X.*(1-X);
interval=[0 10]; 
sol=ode23(rhs,interval,x0); 
plot(sol.x, sol.y);
xlabel('t');ylabel('dX/dt');
for ii = 1:length(sol.y);
    if sol.y(ii) > 0.99;
        time = sol.x(ii);
        break
    end
end
result = time
