for i=1:1000
    
    if out.theta.data(i)>pi/2
      
        break
    else
   
    i=i+1;
    end
end
j=i;
torque=out.torque.data(j:5*j);
theta=out.theta.data(j:5*j);
arevolve=out.revolve.data(j:5*j);
torque_int = trapz(theta, torque);
Td = torque_int/(2*pi);

Energy = cumtrapz(theta, torque-Td);
maxE=max(Energy);
minE=min(Energy);
deltaE=maxE-minE;

w0=0.35;
c=0.01;

I0=out.inertia.data(2,2,j:5*j);


Imachine=min(I0);
If=deltaE/(w0^2*c)-Imachine;

%plot(out.velocity.time(j:5*j),out.velocity.data(j:5*j));

plot(out.acceleration.time(j:5*j),out.acceleration.data(j:5*j));