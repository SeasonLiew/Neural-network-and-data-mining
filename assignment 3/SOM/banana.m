%% perform unsupervised learning with SOM  

% Marco Signoretto, March 2011

close all;
clear all;
clc;
load banana.mat
x_m=X';


% first we generate data uniformely distributed within two
% concentric cylinders

% we then initialize the SOM with hextop as topology function
% ,linkdist as distance function and gridsize 5x5x5
net = newsom(x_m,[5 8],'gridtop','dist'); 

% plot the data distribution with the prototypes of the untrained network
figure;plot(x_m(1,:),x_m(2,:),'.g','markersize',10);
axis([-1 1 -1 1]);
hold on
plotsom(net.iw{1},net.layers{1}.distances)
hold off

% finally we train the network and see how their position changes
net.trainParam.epochs = 100;
net = train(net,x_m);
figure;plot(x_m(1,:),x_m(2,:),'.g','markersize',10);
axis([-1 1 -1 1]);
hold on
plotsom(net.iw{1},net.layers{1}.distances)
hold off 