% NAME: CHANG WEN TENG
% STUDENT ID: MAM2109001
% SUMMARY: This code is written to plot the graph of eta(2^m(x+1)) against x in [2^m,2^(m+1)], for m in [p,q], where p<q are integers.

function eta_interval(p,q) 

for m=p:q
eta=zeros(2,2^m+1);     % create the array for eta(2^m) to eta(2^(m+1))
eta(1,:)=2^m:2^(m+1);   % list down the values of n
eta(2,1)=-1/3;          % key in eta(2^m)=-1/3

for a=1:2^m
    b=zeros(2,2^(m-1));  % create the array for k
    b(1,:)=0:2^(m-1)-1;  % list down the values for k
    
    for k=0:2^(m-1)-1
            exponent=zeros(1,m-1); % create the array for the exponent of -1
        for j=0:m-2
            exponent(1,j+1)=ceil((a-mod(k,2^(j+1)))/(2^(j+1))); % key in the exponent of -1 for each j
        end
        b(2,k+1)=sum(exponent); % sum the exponent of -1 over j for each k
    end
    d=(-ones(1,2^(m-1))).^b(2,:);     % take (-1)^exponent
    sum(d);            % sum up the exponents of -1 over k

    % multiply with -1^a/2^(m-1)*eta(1) to get the value of eta(2^m+a)
    eta(2,a+1)=(-1)^a/(2^(m-1))*-1/3*sum(d); 
end

% Rescale n in [2^m,2^(m+1)] to interval in [0,1]
eta(1,:)=eta(1,:)/2^m -1              

% Plot the graph of y against x for different m values
plot(eta(1,:),eta(2,:),'--o','MarkerFaceColor','blue','DisplayName',['m=' num2str(m)])    
xlabel("x")
ylabel("y")
title("\eta(2^m) to \eta(2^{(m+1)})")
hold on
end
hold off
legend