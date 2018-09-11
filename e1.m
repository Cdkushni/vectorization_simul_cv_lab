% Vectorize the following
% Note the use of the tic/toc calls to time execution
% Compare the time once you have vectorized it
c1 = 0;
c2 = 0;
for i = 1:100
tic
for i = 1:1000
    t(i) = 2*i;
    y(i) = sin (t(i));
end
c1 = c1 + toc;
end
for i = 1:100
tic
    t = 2:2:2000;
    y = sin(t);
c2 = c2 + toc;
end
c1 = c1/100;
c2 = c2/100;
disp (c1)
disp (c2)
clear;
