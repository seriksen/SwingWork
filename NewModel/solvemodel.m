% Solves the pendulum equation

% Close open figures
close all

%% Declare initial conditions
T_start = 0;
T_end = 600;
theta_dot0 = -0.5;
theta0 = pi/33;

%% Solve the eqaution
[t, v] = ode45(@pendulum, [T_start T_end], [theta0, theta_dot0]);

%% Extract values
theta = wrapToPi(v(:,1));
theta_dot = v(:,2);

%% Plot results
figure
plot(t, theta);

rads = zeros(length(t),1);
drad_dtheta = zeros(length(t),1);
drad_dtheta_dot = zeros(length(t),1);
for i = 1:length(theta)
[rads(i,1),drad_dtheta(i,1), drad_dtheta_dot(i,1)] = radius(theta(i),theta_dot(i));
end

hold on
plot(t,(rads-10))
xlabel('time (s)')
ylabel('$\theta$','interpreter','latex')
hold off

% sanity check
figure
plot(theta, theta_dot)
xlabel('$\theta$','interpreter','latex')
ylabel('$\dot{\theta}$','interpreter','latex')
% plots a circle.