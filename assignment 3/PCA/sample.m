%  X = randn(500,50);
clear;
load choles_all;
X=p';

for t=1:21
[eigval,eigvec]=linearpca(X,t);
col_mean=mean(mean(X));
    for i=1:21
    
    X_mean_in(:,i)=X(:,i)-col_mean;
     
    end


[eigvals,eigvec]=linearpca(X_mean_in,t);


z=  X_mean_in*eigvec;
X_rec=z*eigvec';

    col_mean=mean(mean(X_rec));
    for i=1:21
    
    X_hat(:,i)=X_rec(:,i)+col_mean;
     
    end

mse_list(t)=sqrt(mean(mean((X-X_hat).^2)))

end