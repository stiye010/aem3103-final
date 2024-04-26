%	Example 1.3-1 Paper Airplane Flight Path
%	Copyright 2005 by Robert Stengel
%	August 23, 2005
	
%	a) Equilibrium Glide at Maximum Lift/Drag Ratio
    [V,Gam,H,R] = setup_sim(); % sets up simulation
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	[to tf];
	xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);

% First Part: Individually change V and Gam
	figure
	subplot(2,1,1)
    hold on;
	plot(xa(:,4),xa(:,3),'k');
    V = 2;
    xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);
    plot(xa(:,4),xa(:,3),'r');
    V = 7.5;
    xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);
    plot(xa(:,4),xa(:,3),'g');
    title('Height vs Range : Varying Initial Velocity')
    xlabel('Range, m'), ylabel('Height, m'), grid
    legend('Nominal: V = 3.55 m/s','Lower: V = 2 m/s', ...
        'Higher: V = 7.5 m/s');
    subplot(2,1,2)
    hold on;
    [V,Gam,H,R] = setup_sim();
    xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);
    plot(xa(:,4),xa(:,3),'k');
    Gam = -0.5;
    xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);
    plot(xa(:,4),xa(:,3),'r');
    Gam = 0.4;
    xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);
    plot(xa(:,4),xa(:,3),'g');
    title('Height vs Range : Varying Initial Flight Path Angle')
    xlabel('Range, m'), ylabel('Height, m'), grid
    legend('Nominal: Gam = -0.18 rad','Lower: Gam = -0.5 rad', ...
        'Higher: Gam = 0.4 rad');
  