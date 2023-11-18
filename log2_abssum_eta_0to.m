% NAME: CHANG WEN TENG
% STUDENT ID: MAM2109001
% SUMMARY: This code is written to calculate the value of log2 sum_{n=0}^{2^m-1} |eta(n)| for m in [0,m], plot the graph and find the difference between consecutive log2 sum_{n=0}^{2^m-1} |eta(n)|.

function log2_abssum_eta_0to(m)

log2abssum=zeros(2,m+1); % create array for m and log2_abssum_eta(n)
log2abssum(1,:)=0:m; % list down the values of m from 0 to m

% To list down autocorrelation eta(n) for n in [0,2^(m)-1]
q=2^m -1;
eta=zeros(2,q+1);    % create array for n and eta(n)

eta(1,:)=0:q;        % list down the values of n from 0 to n

eta(2,1)=1;          % key in the value of eta(0)=1
eta(2,2)=-1/3;       % key in the value of eta(1)=-1/3

for k=3:q+1
    if mod(k-1,2) == 0              % if k is even
        eta(2,k)=eta(2,(k-1)/2 +1); % then eta(k)=eta(k/2)
    else
        eta(2,k)=-1/2*(eta(2,floor((k-1)/2)+1)+eta(2,ceil((k-1)/2)+1)); % otherwise, eta(k)=-1/2*(eta (floor(k-1/2))+ eta (ceil(k-1/2)))
    end
end

for z=0:m
    % key in the abssum of eta(n) for n in [0,2^m-1]
    log2abssum(2,(z+1):end)=sum(abs(eta(2,1:2^z))); 
end

% apply log2 to the abssum of eta(n)
log2abssum(2,:)=log2(log2abssum(2,:))                   

% plot the graph of log2 abssum of eta(n) where n in [0,2^(m)-1] against m
plot(log2abssum(1,:),log2abssum(2,:),'--o','MarkerFaceColor','red')     
xlabel("m")
ylabel("absolute sum of \eta(n) for 0\leq n \leq 2^{m}-1")

% display the slope value between two consecutive points
slope=diff(log2abssum(2,:))