function out = helper(t,temp, data)

fs = 40;
n = min(round(t*fs),length(data));

out = data(n);