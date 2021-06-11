% 97641
d1=8; 
d2=2; 
d3=2; 
d4=1; 
d5=1;
tn=(d1*T1+d2*T2+d3*T4+d4*T4+d5*T5)/(d1+d2+d3+d4+d5);

X=[X1,X2];
structure = [70,15,15] ; 
structure(structure == 0) = [] ;
net1 = feedforwardnet(structure, 'trainbr') ; 

net1.trainParam.epochs=10000;
% net1.divideParam.trainRatio=3/4;
% net1.divideParam.valRatio=1/4;
% net1.divideParam.testRatio=1/4;

[net1,tr1] = train(net1,X',tn') ;
res4 = sim(net1,X') ;
goodness=mse(net1,tn,res4);