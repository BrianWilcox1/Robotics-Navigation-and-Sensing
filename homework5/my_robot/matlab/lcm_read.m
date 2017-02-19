
% Let’s assume the logging file is gpgga-tenminutes in the dir below
% open log file for reading
%log_file = lcm.logging.Log('../data/cardata', 'r'); 

% now read the file 
% i = 1;
% while true
%  try
%    ev = log_file.readNext();
%    % channel name is in ev.channel
%    % there may be multiple channels but in this case you are only interested in GPGGA channel
%    if strcmp(ev.channel, 'GPS')
%         
%      % build gpgga object from data in this record
%       gps = exlcm.gpgga_data(ev.data());
% 
%       % now you can do things like depending upon the gpgga struct that was defined
%       utm_x(i) = gps.utm_x;
%       utm_y(i) = gps.utm_y;
%       timestamp(i) = gps.timestamp;
%       i = i + 1;
%    end   
%    catch err   % exception will be thrown when you hit end of file
%      break;
%   end
  %end
%end
% Let’s assume the logging file is gpgga-tenminutes in the dir below
% open log file for reading
log_file = lcm.logging.Log('../data/LOL', 'r'); 

% now read the file 
i = 1;
while true
 try
   ev = log_file.readNext();
   % channel name is in ev.channel
   % there may be multiple channels but in this case you are only interested in GPGGA channel
   if strcmp(ev.channel, 'IMU')
        
     % build gpgga object from data in this record
      vn = exlcm.vnimu_data(ev.data());

      % now you can do things like depending upon the gpgga struct that was defined
      yaw(i) = vn.yaw;
      pitch(i) = vn.pitch;
      roll(i) = vn.roll;
      magX(i) = vn.magX;
      magY(i) = vn.magY;
      magZ(i) = vn.magZ;
      i = i + 1;
   end   
   catch err   % exception will be thrown when you hit end of file
     break;
  end
  %end
end
% figure(1)
% scatter(utm_x, utm_y)
% title('Plot of GPGGA of Stationary data')
% xlabel('utm_x (m)');
% ylabel('utm_y (m)');
% figure(2)
% histogram2(utm_x,utm_y)
% title('Histogram of GPGGA of Stationary data')

