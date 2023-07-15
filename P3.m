    %%Creating the chain
chain='';
size=10000000;
probability_indicator=rand;
if probability_indicator >= 0 && probability_indicator <= 8/13
    s=1;
else
    s=2;
end

for i=1:size
   p=rand;
   if s==1
       if p>=0 && p<=0.5
           s=1;
           chain(i)='B';
       else
           s=2;
           chain(i)='A';
       end
   else
       if p>=0 && p<=0.8
           s=1;
           chain(i)='A';
       else
           s=2;
           chain(i)='B';
       end
   end
end
        %% Obtaining Gk ... Values
transition_states=[0.5 0.5;0.8 0.2];
H=entropy(transition_states,100000000000);
transition_states=[0.5 0.5;0.8 0.2];
G=zeros(1,10);
code_len_avg=zeros(1,10);
coding_eff=zeros(1,10);
H_=zeros(1,10);
for k=1:10
    G(k)=entropy(transition_states,k);
    code_len_avg(k)=average_length(chain,k);
    coding_eff(k)=k*H/code_len_avg(k);
    H_(k)=H;
end
        %% Plotting the values
k=1:10;
figure(1); %average_length + Gk
plot(k,G,'r');hold on
plot(k,code_len_avg,'g');
xlabel('k');
title('G_k & Average Code Length');
legend('G_k','Average Code Length');
hold off
figure(2); % Coding efficiency
plot(k,coding_eff,'r'); hold on
plot(k,H_,'b');
xlabel('k');
title('Coding Efficicency in comparison with H');
legend('Coding Efficiency','H(X)');