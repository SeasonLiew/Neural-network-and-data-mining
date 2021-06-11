alg1='trainlm'
alg2='traingd'
alg3='trainbr'


T=T';
X=X';
labels_train_t=labels_train';
labels_test_t=labels_test';
epochs=200;
for i2=1:5
structure = [5,0,0];
structure(structure == 0) = [];

 
    net1=feedforwardnet(structure,alg1);
    net2=feedforwardnet(structure,alg1);
    net3=feedforwardnet(structure,alg1);
    net1.trainParam.epochs=epochs
    net2.trainParam.epochs=epochs
    net3.trainParam.epochs=epochs
    
%     net1=feedforwardnet(structure,alg1);
%     net1.trainParam.epochs=epochs;
%     
%     [net1,tr1]=train(net1,X,labels_train_t);
%     
%     neu_out1=sim(net1,T);
%     error1= mse(net1,labels_test_t,neu_out1);
%     fprintf("lm i1 = %d , epoch %d, error:%f",i1 ,epochs,error1);
% clc
%     net2=feedforwardnet(structure,alg2);
%     net2.trainParam.epochs=epochs
% 
%     [net2,tr1]=train(net2,X,labels_train_t)
%     neu_out2=sim(net2,T);
%     error2= mse(net2,labels_test_t,neu_out2);
%     fprintf("gd i1 = %d , epoch %d, error:%f",i1,epochs,error2);
% clc
    net3=feedforwardnet(structure,alg3);
    net3.trainParam.epochs=epochs

    [net3,tr3]=train(net3,X,labels_train_t)
    neu_out3=sim(net3,T);
    error3= mse(net3,labels_test_t,neu_out3);
    fprintf("br i1 = %d , epoch %d, error:%f",i1,epochs,error3);
 clc
   
   
end
