%% MTH127: homework 10 main script
%% author: james francis toy iv <nil@0xabadba.be>
%% instructor: Chris Hardin (Union College)


% get the least squares fit.
least_squares;

% set k and C since Chris uses them later
k = -b;
C = -a/b;

% solve using ODE
%[solt, soly] = ode45(@f,[0,4],.02);
%len = length(solt);

% solutions at the endpoints
%t_final = solt(len);
%y_final = soly(len);

% euler! solution
%[ta,ya] = euler(@f,[0,100],0.3,2.20); plot(ta,ya,'o');
%[tb,yb] = euler(@f,[0,100],0.3,2.45); plot(tb,yb,'o');
%[tc,yc] = euler(@f,[0,100],0.3,2.60); plot(tc,yc,'o');
%[td,yd] = euler(@f,[0,100],0.3,2.74); plot(td,yd,'o');
%[te,ye] = euler(@f,[0,100],0.3,3.00); plot(te,ye,'o');


%% numero seis
euler_given;
