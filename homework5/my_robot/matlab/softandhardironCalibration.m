%% Initialization
load data_170217_210458.mat;
%% Crop the data to get the circular part
% Find the circular part
% figure; hold on; grid on; box on;
% plot3(imu.magx(ind),imu.magy(ind),1:length(ind),'b.')

% Indices for circular part
ind = 24820:33580;

figure; hold all; grid on;
h1 = plot(imu.magx(ind),imu.magy(ind),'b.');
%% Fit an ellipse
ellipse_t = fit_ellipse(imu.magx(ind),imu.magy(ind),1);
theta = -ellipse_t.phi;     % [rad] orientation of the ellipse (tilt)
r_major = ellipse_t.a;      % [m] radius of the long-axis
r_minor = ellipse_t.b;      % [m] radius of the short-axis
offset_x = ellipse_t.X0_in; % [m] x-coordinate of the centroid
offset_y = ellipse_t.Y0_in; % [m] y-coordiante of the centroid
%% Hard-iron distortion
imu.magx = imu.magx - offset_x;
imu.magy = imu.magy - offset_y;
h2 = plot(imu.magx(ind),imu.magy(ind),'g.');
%% Soft-iron distortion
R = [cos(theta), sin(theta);-sin(theta), cos(theta)];   % rotation matrix
rotation = R*[imu.magx;imu.magy];   % rotate the ellipse

scale = r_minor/r_major;
imu.magx = rotation(1,:)*scale;     % scale the long-axis for circular shape
imu.magy = rotation(2,:);
ellipse_t2 = fit_ellipse(imu.magx(ind),imu.magy(ind),1);
h3 = plot(imu.magx(ind),imu.magy(ind),'m.');
axis([-0.16 0.16 -0.16 0.16]); axis square;
xlabel('Mag_X (Gauss)'); ylabel('Mag_Y (Gauss)'); title('Iron Calibration');
legend([h1,h2,h3],{'Measured','Hard-iron calibrated',...
                   'Soft-iron calibrated'},'location','sw'); legend boxoff;