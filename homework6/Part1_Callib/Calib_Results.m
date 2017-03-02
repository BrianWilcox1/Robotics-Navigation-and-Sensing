% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 2913.288414724798700 ; 2850.096330511542900 ];

%-- Principal point:
cc = [ 1299.574879499335800 ; 1582.223287428536000 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.062592050715805 ; -0.063628039357085 ; -0.012613543905756 ; 0.005444854412542 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 61.688101361165799 ; 48.997408532847601 ];

%-- Principal point uncertainty:
cc_error = [ 22.502892256327922 ; 66.272251197477758 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.025255899452510 ; 0.101600305170220 ; 0.004309033750319 ; 0.003396527463153 ; 0.000000000000000 ];

%-- Image size:
nx = 2448;
ny = 3264;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 17;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.101105e+00 ; 1.819111e+00 ; -2.429614e-01 ];
Tc_1  = [ -1.205820e+02 ; -2.085612e+02 ; 5.279247e+02 ];
omc_error_1 = [ 9.336760e-03 ; 8.804340e-03 ; 1.426499e-02 ];
Tc_error_1  = [ 4.223840e+00 ; 1.118661e+01 ; 1.115884e+01 ];

%-- Image #2:
omc_2 = [ 2.288638e+00 ; 1.519531e+00 ; -4.772428e-01 ];
Tc_2  = [ -1.087543e+02 ; -1.507516e+02 ; 4.340554e+02 ];
omc_error_2 = [ 1.003011e-02 ; 9.714078e-03 ; 1.566481e-02 ];
Tc_error_2  = [ 3.451831e+00 ; 9.301999e+00 ; 9.069885e+00 ];

%-- Image #3:
omc_3 = [ NaN ; NaN ; NaN ];
Tc_3  = [ NaN ; NaN ; NaN ];
omc_error_3 = [ NaN ; NaN ; NaN ];
Tc_error_3  = [ NaN ; NaN ; NaN ];

%-- Image #4:
omc_4 = [ 1.820011e+00 ; 2.078291e+00 ; -3.728318e-01 ];
Tc_4  = [ -8.244079e+01 ; -1.764096e+02 ; 4.254587e+02 ];
omc_error_4 = [ 8.190263e-03 ; 9.721243e-03 ; 1.468616e-02 ];
Tc_error_4  = [ 3.398224e+00 ; 8.948981e+00 ; 8.987432e+00 ];

%-- Image #5:
omc_5 = [ 2.004947e+00 ; 2.164258e+00 ; -6.313070e-01 ];
Tc_5  = [ -9.271321e+01 ; -1.492361e+02 ; 4.002213e+02 ];
omc_error_5 = [ 4.826337e-03 ; 1.085575e-02 ; 2.067599e-02 ];
Tc_error_5  = [ 3.166259e+00 ; 8.637983e+00 ; 8.196001e+00 ];

%-- Image #6:
omc_6 = [ 1.943047e+00 ; 1.799955e+00 ; -6.162747e-01 ];
Tc_6  = [ -6.873376e+01 ; -1.428598e+02 ; 4.351390e+02 ];
omc_error_6 = [ 1.010224e-02 ; 1.180215e-02 ; 1.616812e-02 ];
Tc_error_6  = [ 3.432944e+00 ; 9.353272e+00 ; 8.931083e+00 ];

%-- Image #7:
omc_7 = [ 1.986361e+00 ; 1.754409e+00 ; -3.230439e-01 ];
Tc_7  = [ -7.033294e+01 ; -1.505186e+02 ; 3.772219e+02 ];
omc_error_7 = [ 1.155850e-02 ; 9.217675e-03 ; 1.321537e-02 ];
Tc_error_7  = [ 3.006994e+00 ; 7.966501e+00 ; 7.926344e+00 ];

%-- Image #8:
omc_8 = [ 2.013818e+00 ; 1.633965e+00 ; -5.647156e-01 ];
Tc_8  = [ -8.302621e+01 ; -1.291197e+02 ; 3.790971e+02 ];
omc_error_8 = [ 1.161332e-02 ; 1.134392e-02 ; 1.505368e-02 ];
Tc_error_8  = [ 2.998220e+00 ; 8.143929e+00 ; 7.772513e+00 ];

%-- Image #9:
omc_9 = [ 2.153564e+00 ; 1.646821e+00 ; -7.971051e-01 ];
Tc_9  = [ -1.224688e+02 ; -7.819719e+01 ; 4.732710e+02 ];
omc_error_9 = [ 9.062709e-03 ; 1.368330e-02 ; 1.837662e-02 ];
Tc_error_9  = [ 3.648265e+00 ; 1.068278e+01 ; 9.169860e+00 ];

%-- Image #10:
omc_10 = [ 1.762451e+00 ; 1.836309e+00 ; 4.827174e-03 ];
Tc_10  = [ -6.988563e+01 ; -1.416453e+02 ; 3.702306e+02 ];
omc_error_10 = [ 1.600017e-02 ; 9.054514e-03 ; 1.187167e-02 ];
Tc_error_10  = [ 2.924639e+00 ; 8.110151e+00 ; 7.443242e+00 ];

%-- Image #11:
omc_11 = [ NaN ; NaN ; NaN ];
Tc_11  = [ NaN ; NaN ; NaN ];
omc_error_11 = [ NaN ; NaN ; NaN ];
Tc_error_11  = [ NaN ; NaN ; NaN ];

%-- Image #12:
omc_12 = [ NaN ; NaN ; NaN ];
Tc_12  = [ NaN ; NaN ; NaN ];
omc_error_12 = [ NaN ; NaN ; NaN ];
Tc_error_12  = [ NaN ; NaN ; NaN ];

%-- Image #13:
omc_13 = [ NaN ; NaN ; NaN ];
Tc_13  = [ NaN ; NaN ; NaN ];
omc_error_13 = [ NaN ; NaN ; NaN ];
Tc_error_13  = [ NaN ; NaN ; NaN ];

%-- Image #14:
omc_14 = [ NaN ; NaN ; NaN ];
Tc_14  = [ NaN ; NaN ; NaN ];
omc_error_14 = [ NaN ; NaN ; NaN ];
Tc_error_14  = [ NaN ; NaN ; NaN ];

%-- Image #15:
omc_15 = [ NaN ; NaN ; NaN ];
Tc_15  = [ NaN ; NaN ; NaN ];
omc_error_15 = [ NaN ; NaN ; NaN ];
Tc_error_15  = [ NaN ; NaN ; NaN ];

%-- Image #16:
omc_16 = [ NaN ; NaN ; NaN ];
Tc_16  = [ NaN ; NaN ; NaN ];
omc_error_16 = [ NaN ; NaN ; NaN ];
Tc_error_16  = [ NaN ; NaN ; NaN ];

%-- Image #17:
omc_17 = [ NaN ; NaN ; NaN ];
Tc_17  = [ NaN ; NaN ; NaN ];
omc_error_17 = [ NaN ; NaN ; NaN ];
Tc_error_17  = [ NaN ; NaN ; NaN ];

