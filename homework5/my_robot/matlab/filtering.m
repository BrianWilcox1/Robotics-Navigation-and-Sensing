clear; clc; close all;

%% Initialization
load data_170217_210458_calibrated.mat;
fc = 15;   % [Hz] cut-off frequency 
fs = 40;   % [Hz] sampling frequency
inds  = 52612 + 1 - 18868: 52612;
init = inds(1);
gyroz_deg = rad2deg(imu.gyroz(inds));
yaw0 = imu.yaw(init);

%% ode23
ts = 1/fs;
tspan = 1:ts:length(imu.gyroz(inds))*ts;
[t,yaw_ode] = ode23(@(t,yaw) gyroz2yaw(t,yaw,gyroz_deg), tspan, yaw0-180);
n = round(t*fs);
yaw_ode = mod(yaw_ode,360)-180;
%% Magnetometer Corrections
yaw_magnetometer = -atan2(imu.magy,imu.magx);
yaw_magnetometer = yaw_magnetometer(inds) * 180/pi;
%% Complementary Filter
yaw_final = 0.99 * yaw_ode + 0.01 * (yaw_magnetometer(n))';
%% Results
plot(imu.yaw(inds),'bo');
hold on;
plot(n,yaw_final,'rd');
hold on;
ylabel('Yaw [\circ]'); xlabel('n');
legend('Yaw', 'Complementary Filter','location','sw'); legend boxoff;