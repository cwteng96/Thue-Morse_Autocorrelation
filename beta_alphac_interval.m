% NAME: CHANG WEN TENG
% STUDENT ID: MAM2109001
% SUMMARY: This code is written to calculate the absolute sum of beta_{a,r} and alpha_c^{(a)} for given a (from p to q), and plot the graph of alpha_c^{(a)} against a.
% Take note that this code takes a longer time to run compared to the alpha_c_value function and it requires an extensively large storage to run if a exceeds 16.

function beta_alphac_interval(p,q) 

list=zeros(3,q-p+1);   % create the array for a and |sum(beta_{a,r})| and alpha_c
list(1,:)=p:q;         % list down a from p to q

for a=p:q              % for each value of a
beta_r=zeros(2,2^a-1); % create the array for r and beta_{a,r}
beta_r(1,:)=1:2^a-1;   % key in the range of r from 0 to (2^a)-1

for r=1:2^a-1
    b=zeros(2,r);      % create the array for k
    b(1,:)=0:r-1;      % list down k from 0 to r-1 
    
    for k=0:r-1
        exponent=zeros(1,a-1); % create the array for j
        for j=0:a-2            % for each j from 0 to a-2
            exponent(1,j+1)=ceil((r-mod(k,2^(j+1)))/(2^(j+1)));          % key in the ceiling for each j
        end
        b(2,k+1)=sum(exponent); % sum up all the ceiling values, key in the exponent of (-1) for the respective k value 
    end

    % calculate (-1)^exponent for each k
    d=(-ones(1,r)).^b(2,:); 
    
    % calculate beta_{a,r}, where sum(d) is the sum of (-1)^exponent over all k's
    beta_r(2,r)=(-1)^r/(2^a)*sum(d); 
end

% key in the absolute sum of beta_{a,r} for given a
list(2,a-p+1)= sum(abs(beta_r(2,:))); 

% key in the alpha_c value for given a
list(3,a-p+1)= 1/log(2^a)*log(1+2*(list(2,a-p+1))); 

end

% display the list of absolute sum of beta_{a,r} and alpha_c for given a (from p to q)
list  

% plot the graph of alpha_c against a
plot(list(1,:),list(3,:),'--o','MarkerFaceColor', 'r')
xlabel("a")
ylabel("\alpha_c")