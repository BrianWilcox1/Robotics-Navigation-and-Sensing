load data_170217_210458.mat;
load analysisvalues.mat;
load utms.mat

fs = 40;   % [Hz] sampling frequency
ts = 1/fs;
init = inds(1);
accelX = imu.accelx(inds);
accelx0 = accelX(1);
accelX = accelX;
tspan = 1:ts:length(imu.accelx(inds))*ts;
[t,velocityX] = ode23(@(t,temp) helper(t,temp,accelX), tspan, accelx0);
n = round(t*fs);
figure(1)
plot(n,velocityX);
% title('Velocity in the X direction')
figure(2)
plot(accelX)
% title('Acceleration in the X direction')

test(1) = 0;
accelY = imu.accely(inds);
accely0 = accelY(1);
tspan = 1:ts:length(imu.accely(inds))*ts;
[t_y,velocityY] = ode23(@(t_y,temp) helper(t_y,temp,accelY), tspan, accely0);
n = round(t*fs);
% figure(3)
% plot(velocityY)
% title('Velocity in the Y direction')
% figure(4)
% plot(accelY)
% title('Acceleration in the Y direction')
gyroZ = imu.gyroz(inds);
Calc_accelY = gyroZ(40:end).*velocityX';
figure(5); plot(Calc_accelY); hold on; plot(accelY);
legend('Calculated','Raw');

%% Find Displacement
t = t';
ve(1) = 0;
vn(1) = 0;


for i = 2:length(velocityX)
    ve(i) = (cos(imu.yaw(inds(i+39))*pi/180)*velocityX(i));
    vn(i) = -sin(imu.yaw(inds(i+39))*pi/180)*velocityX(i);
    xe(i) = trapz(t(1:i), ve(1:i));
    xn(i) = trapz(t(1:i), vn(1:i));
end

figure(6);
plot(xe, xn);
title('Derived Position Plot');
xlabel('Derived Relative East')
ylabel('Derived Relative North')

figure(7);

plot(utmx, utmy);
title('Acutal Position Plot');
xlabel('East utm_x (meters)')
ylabel('North utm_y (meters)')

%% xc calculation

w_prime = diff(imu.gyroz(inds)).*fs;
indx = find(abs(w_prime) == 0);
w_prime(indx) = median(w_prime);
b = ones(1,20)*1/20;
a = 1;
accelY = filter(b,a,accelY);
Calc_accelY = filter(b,a,Calc_accelY);
xc = (accelY(40:end) - Calc_accelY)./w_prime(39:end);

figure(8)
histogram(xc)
title('Center of Mass of the car')
xlabel('x_c (m)')