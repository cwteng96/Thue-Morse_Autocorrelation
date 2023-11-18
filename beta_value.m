% NAME: CHANG WEN TENG
% STUDENT ID: MAM2109001
% SUMMARY: This code is written to plot the graph of beta_{a,r} for a given a and r in [0,2^a].

function beta_value(a)              

beta_list=zeros(2,2^a+1); % create the array for r and beta_{a,r}
beta_list(1,:)=0:2^a; % list down r from 0 to 2^a

beta_list(2,2^a+1)=1; % key in beta_{a,2^a}=1, beta_{a,0}=0

for r=1:2^a-1
    b=zeros(2,r);     % create the array for k
    b(1,:)=0:r-1;     % list down k from 0 to r-1
    
    for k=0:r-1
        exponent=zeros(1,a-1); % create the array for j
        for j=0:a-2            % for each j from 0 to a-2
            exponent(1,j+1)=ceil((r-mod(k,2^(j+1)))/(2^(j+1))); % key in the ceiling for each j
        end
        b(2,k+1)=sum(exponent); % sum up all the ceiling values, key in the exponent of (-1) for the respective k value 
    end
    d=(-ones(1,r)).^b(2,:);    % calculate (-1)^exponent for each k
    beta_list(2,r+1)=(-1)^r/(2^a)*sum(d); % calculate beta_{a,r}, where sum(d) is the sum of (-1)^exponent over all k's
end

% display the list of beta_{a,r} for r in [0,2^a]
beta_list             

% plot beta_{a,r} against r, for fixed a
plot(beta_list(1,1:2^a),beta_list(2,1:2^a),'--o','MarkerFaceColor', [1 0.5 0])    
xlabel("r")
ylabel("\beta_{a,r}")
title("\beta_{a,r} for r in [0,2^{a}-1]")