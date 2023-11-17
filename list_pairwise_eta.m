% SUMMARY: This code is written to calculate the autocorrelation values from eta(0) until eta(n) and plot the graph of eta(n) against lag n.

function list_pairwise_eta(n)

eta=zeros(2,n+1);    % create array for n and eta(n)

eta(1,:)=0:n;        % list down the values of n from 0 to n

eta(2,1)=1;          % key in the value of eta(0)=1
eta(2,2)=-1/3;       % key in the value of eta(1)=-1/3

for k=3:n+1
    if mod(k-1,2) == 0              % if k is even
        eta(2,k)=eta(2,(k-1)/2 +1); % then eta(k)=eta(k/2)
    else
        eta(2,k)=-1/2*(eta(2,floor((k-1)/2)+1)+eta(2,ceil((k-1)/2)+1)); % otherwise, eta(k)=-1/2*(eta (floor(k-1/2))+ eta (ceil(k-1/2)))
    end
end

eta(1,:)=log2(eta(1,:));
% display the list of autocorrelation values
%eta           

% plot the graph of eta(n) against n
stem(eta(1,:),eta(2,:),'LineStyle','-.','MarkerfaceColor','red') 
xlabel("n")
ylabel("\eta(n)")