% SUMMARY: This code is written to plot the graph of alpha^(a)_c from a=2
% until a=n

function alpha_c_value(n) 

abssum_beta=zeros(3,n-1); % create the array for a, absolute sum of beta and alpha^(a)_c
abssum_beta(1,:)=2:n;

beta_list1=zeros(1,3);    % this is the list of beta_{a,r} for a=1
beta_list1(1,2)=-1/2;
beta_list1(1,3)=1;

for a=2:n    
beta_list2=zeros(2,2^a+1); % create the array for r and beta_{a,r}
beta_list2(1,:)=0:2^a; % list down r from 0 to 2^a

beta_list2(2,2^a+1)=1; % key in beta_{a,2^a}=1, beta_{a,0}=0

for r=2:2^a
    if mod(r-1,2) == 0              % if r is even
        beta_list2(2,r)=beta_list1(1,(r-1)/2 +1); % then beta_a,r=eta_a-1,r/2
    else
        beta_list2(2,r)=-1/2*(beta_list1(1,floor((r-1)/2)+1)+beta_list1(1,ceil((r-1)/2)+1)); % otherwise, beta_a,r=-1/2*(beta_a-1,(floor((r-1)/2))+ beta_a-1,(ceil((k-1)/2)))
    end
end

% display the list of beta values for specific a
%beta_list2 

beta_list1=beta_list2(2,:); % save the list of beta values for calculation of next a
abssum_beta(2,a-1)=sum(abs(beta_list1))-1; % find the absolute sum of beta_{a,1} to beta_{a,2^a-1}
abssum_beta(3,a-1)=(log(1+2*abssum_beta(2,a-1)))/(log(2^a)); % find the alpha_c for each a
end

%list down a, absolute sum of beta and alpha^(a)_c
format long
abssum_beta


%plot the graph of alpha^(a)_c against a
plot(abssum_beta(1,:),abssum_beta(3,:),'--o','MarkerFaceColor', 'r')
xlabel("a")
ylabel("\alpha_c")