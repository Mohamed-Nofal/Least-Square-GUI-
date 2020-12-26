%% clear Old Data
clc; clear all; close all; round(5);
%% Input Data
X=-1:1:6;
Y=[10 9 7 5 4 3 0 -1];
%% Least Square
X_squar=X.^2;
X_Y=X.*Y;
%% Solve For A & B
syms A B
Sol=vpasolve([sum(X_squar)*A+sum(X)*B==sum(X_Y),sum(X)*A+length(X)*B==sum(Y)],[A,B]);
A=Sol.A
B=Sol.B
%% Calculate The error
e_squar=(A.*X+B-Y).^2;
e=sqrt(sum(e_squar))
%% Calculate The Mean
mean=1/length(X)*e
%% plot results 
figure()
grid on;hold on;% axis equal;axis tight
plot(X,Y,'*')
x=linspace(X(1),X(length(X)),200);
plot(x,A*x+B)