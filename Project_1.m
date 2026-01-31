format long; clc; clear;

%% 1) Choose n >= 4 and build a random column-stochastic matrix A
n = 6;  % n >= 4 (rubric)
B = rand(n);                 % random positive entries
A = B ./ sum(B,1);           % normalize each column so columns sum to 1

% Verify column-stochastic: column sums should be ~ones(1,n)
colSums = sum(A,1);

%% Create a random stochastic vector u (nonnegative, sums to 1)
u = rand(n,1);
u = u / sum(u);

%% Compute A^k u up to k=101 and check convergence near k=100
k1 = 100; k2 = 101;

Au_100 = (A^k1) * u;
Au_101 = (A^k2) * u;

diff_u = norm(Au_101 - Au_100, 2);

% Check "stochastic" property (allow tiny floating-point drift)
min_u100 = min(Au_100);
sum_u100 = sum(Au_100);

%% Print the required outputs for the example
disp('--- Part 1: Random u ---');
disp('A ='); disp(A);
disp('u ='); disp(u);
disp('A^100 u ='); disp(Au_100);
disp('A^101 u ='); disp(Au_101);
disp('norm(A^101 u - A^100 u) ='); disp(diff_u);
disp('min(A^100 u) and sum(A^100 u) ='); disp([min_u100, sum_u100]);
disp('Column sums of A (should be 1s) ='); disp(colSums);

%% 2) Prescribed vector v: v1=1, others 0
v = zeros(n,1);
v(1) = 1;

Av_100 = (A^k1) * v;
Av_101 = (A^k2) * v;

diff_v = norm(Av_101 - Av_100, 2);

min_v100 = min(Av_100);
sum_v100 = sum(Av_100);

disp('--- Part 2: Prescribed v = e1 ---');
disp('v ='); disp(v);
disp('A^100 v ='); disp(Av_100);
disp('A^101 v ='); disp(Av_101);
disp('norm(A^101 v - A^100 v) ='); disp(diff_v);
disp('min(A^100 v) and sum(A^100 v) ='); disp([min_v100, sum_v100]);

%% 3) Compare the limits (relationship between the two)
limit_diff = norm(Au_100 - Av_100, 2);

disp('--- Part 3: Compare apparent limits ---');
disp('norm(A^100 u - A^100 v) ='); disp(limit_diff);