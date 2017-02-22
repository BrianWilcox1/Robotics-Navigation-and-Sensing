function dyaw = gyroz2yaw(t, yaw, gyroz_deg)

fs = 40;
n = min(round(t*fs),length(gyroz_deg));

dyaw = gyroz_deg(n);