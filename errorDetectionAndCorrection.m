clc;
clear all;
close all;

%% Encoder for Linear Block Code
k = 3;
n = 6;
P = [1 1 0; 0 1 1; 1 0 1];
Ik = eye(k,k);
G = [Ik P];
disp('Generator Matrix');
disp(G);

%% Input
M = input('Enter the Message Sequence');
disp('Message Signal');
disp(M)

%% Transmitted Codeword
E = [];
for i=1:n
    t1 = 0;
    for j=1:k
        t1 = bitxor(t1, bitand(M(j), G(j,i)));
    end
    E = [E t1];
end
disp('Transmitted Codeword');
disp(E);

%% Received Codeword
R = input('Enter the Received Codeword');
disp('Received Codeword');
disp(R);

%% Decoder for Linear Block Code
Ink = eye(n-k, n-k);
H = [P' Ink];
disp('Parity Check Matrix');
disp(H);

%% Syndrome Calculation
S = [];
for i=1:k
    t1 = 0;
    for j=1:n
        t1 = bitxor(t1, bitand(R(j), H(i,j)));
    end
    S = [S t1];
end
disp('Syndrome');
disp(S);

%% Error Detection
Rc = zeros(1, n);
if (S==zeros(1, k))
    disp('No Error Occurs in Received Codeword');
    Rm = R(1:k);
    disp('Recovered Message Signal');
    disp(Rm);
else
    disp('Error Occurs in Received Codeword');
    %% Error Correction
    th = H';
    for (i=1:n)
        if (S==th(i,:))
            fprintf('Error occured in the position %d \n', i);
            Rc(i) = ~(R(i));
        else
            Rc(i) = R(i);
        end
    end
    disp('Corrected Codeword');
    disp(Rc);
    Rm = Rc(1:k);
    disp('Recovered Message Signal');
    disp(Rm);
end
