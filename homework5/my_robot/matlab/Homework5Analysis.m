yaw_magnetometer = atan2(-imu.magY,imu.magX);
yaw_magnetometer = yaw_magnetometer * 180/pi;
tspan = [0 18866];
cummulative(1) = 0;
for i=1:18867
    cummulative(i+1) = cummulative(i) + imu.gyroZ(i);
end
yaw_gyroZ = cummulative;
yaw_gyroZ = yaw_gyroZ*180/pi/40 + imu.yaw(1);
len = length(yaw_gyroZ);
for i = 1:len
    if(yaw_gyroZ(i) < -180)
        yaw_gyroZ(i) = yaw_gyroZ(i)+360;
    end
end
figure(1)
plot(imu.yaw)
title('Raw Yaw')
figure(2)
plot(yaw_gyroZ);
title('GyroZ Yaw')
Final_yaw = 0.98 * yaw_gyroZ + 0.02 * yaw_magnetometer;
figure(3)
plot(Final_yaw)
title('Filtered Yaw')
%[y,t] = ode23(@(t,y) odeInput, 