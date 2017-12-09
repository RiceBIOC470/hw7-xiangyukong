%HW7

% Problem 1: Modeling population growth
% The simplest model for a growing population assumes that each current
% individual has equal likelihood to divide, which yields a differential
% equation dx/dt = a*x where a is the division rate. It is easy to see that
% this will grow exponentially without bound. A simple modification is to
% assume that the growth rate slows done as the population reaches some
% maximum value N so that dx/dt = a*x*(1-x/N). Defining X = x/N, we have 
% dX/dt = a*X*(1-X).  
% Part 1. This equation has two fixed points at 0 and 1. Explain the
% meaning of these two points.


%the first means when we don't have x, x will stop changing along with t,
%which means the growth stop, but this is not a stable point, if the X is
%with a number, the balance will move; whereas the second means, when x 
%reach its maximum, the will stop as well, and this point is stable.

% Part 2: Evaluate the stability of these fixed points. Does it depend on
% the value of the parameter a? 

%It does not affect stableness of each point unless a turns minus, which does not make physical sense in a 
%growth model(I can't think of one), the fix point will remain at 0 and 1.

% Part 3: Write a function that takes two inputs - the initial condition x0
% and the a parameter and integrateps the equation forward in time. Make
% your code return two variables - the timecourse of X and the time
% required for the population to reach 99% of its maximum value. 

x0 = 0.1; a = 2;
satu_point = time_r(x0,a);

% Part 4: Another possible model is to consider discrete generations
% instead allowing the population to vary continuously. e.g. X(t+1) = a*
% X(t)*(1-X(t)). Consider this model and vary the a parameter in the range 0
% < a <= 4. For each value of a choose 200 random starting points  0 < x0 < 1 
% and iterate the equation forward to steady state. For each final
% value Xf, plot the point in the plane (a,Xf) so that at the end you will
% have produced a bifucation diagram showing all possible final values of
% Xf at each value of a. Explain your results. 

for a = 0:0.2:4
    for n = 1:200
    x0 = rand(1);
    Xf = x0;
    for i = 1:100 
        Xf = a*Xf*(1-Xf);
    end
    plot(a,Xf,'r.');
    hold on;
    end
end
xlabel('a');ylabel('Xf');
%when a<1, there is a stable fixing point at 0, between 1 and 2.8, also one
%stable fixing point(not at 0), from 2.8 to 4 there will be 2 stable point
%and one unstable point between them.

% Problem 2. Genetic toggle switches. 
% Consider a genetic system of two genes A and B in which each gene
% product represses the expression of the other. Make the following
% assumptions: 
% a. Repression is cooperative:  each promotor region of one gene has 4
% binding sites for the other protein and that all of these need to be
% occupied for the gene to be repressed. 
% b. You can ignore the intermediate mRNA production so that the product of
% the synthesis of one gene can be assumed to directly repress the other
% c. the system is prefectly symmetric so that the degradation
% times, binding strengths etc are the same for both genes. 
% d. You can choose time and concentration scales so that all Michaelis
% binding constants and degradation times are equal to 1. 
%
% Part 1. Write down a two equation model (one for each gene product) for
% this system. Your model should have one free parameter corresponding to the
% maximum rate of expression of the gene, call it V.
% 
%dA/dt = V/(1+B^4)-A;
%dB/dt = V/(1+A^4)-B;
%
% Part 2. Write code to integrate your model in time and plot the results for V = 5 for two cases, 
% one in which A0 > B0 and one in which B0 > A0. 


dA = @(t,A,B) 5/(1 + B^4)-A;
dB = @(t,A,B) 5/(1 + A^4)-B;
A0 = 3;
B0 = 1;
dt = 0.1;
interval = [0 10];
nstep = (interval(2)-interval(1))/dt;
solA(1) = A0;
solb(1) = B0;
for ii = 2:nstep
    solA(ii) = solA(ii-1)+dA(ii,solA(ii-1),solb(ii-1))*dt;
    solb(ii) = solb(ii-1)+db(ii,solA(ii),solb(ii-1))*dt;
end
tt = linspace(interval(1),interval(2),nstep);
plot(tt,solA,'r.');hold on;
plot(tt,solb,'g.')


A0 = 1;
B0 = 2;
sola(1) = A0;
solB(1) = B0;
for ii = 2:nstep
    sola(ii) = sola(ii-1)+dA(ii,sola(ii-1),solB(ii-1))*dt;
    solB(ii) = solB(ii-1)+dB(ii,sola(ii),solB(ii-1))*dt;
end
tt = linspace(interval(1),interval(2),nstep);
plot(tt,sola,'r.');hold on;
plot(tt,solB,'g.')

% Part 3. By any means you want, write code to produce a bifurcation diagram showing all
% fixed points of the system as a function of the V parameter. 

%I can't make sense of it, shouldn't this be three dimensional?