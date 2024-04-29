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
    xlabel('Range (m)'), ylabel('Height (m)'), grid
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
    xlabel('Range (m)'), ylabel('Height (m)'), grid
    legend('Nominal: Gam = -0.18 rad','Lower: Gam = -0.5 rad', ...
        'Higher: Gam = 0.4 rad');
  
 % Second Part: Simultaneous random variations
    V_range = [2:0.1:7.5];
    Gam_range = [-0.5:0.1:0.4];
    tspan = [0:0.01:6];
    num_simulations = 100;
    trajectory_data = zeros(num_simulations, length(tspan), 2);
    
    for i = 1:num_simulations
        V = V_range(1) + (V_range(end) - V_range(1)) * rand(1);
        Gam = Gam_range(1) + (Gam_range(end) - Gam_range(1)) * rand(1);
        [H, R] = setup_sim();
        xo = [V; Gam; H; R];
        [ta, xa] = ode23(@EqMotion, tspan, xo);
        trajectory_data(i, 1:length(ta), :) = [xa(:, 4), xa(:, 3)];
    end
    
    figure;
    hold on; grid on;
    gray = [0.7 0.7 0.7];
    for i = 1:num_simulations
        plot(trajectory_data(i, :, 1), trajectory_data(i, :, 2), 'Color', gray);
    end
    title('Simulated Trajectories with Random Parameter Variations');
    xlabel('Range (m)');
    ylabel('Height (m)');