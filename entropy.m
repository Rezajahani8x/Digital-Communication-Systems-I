function G=entropy(transition_states,k)

    %%% Obtaining state vector
        n=length(transition_states); % n states
        P=[zeros(1,n),1]/[transition_states-eye(n),ones(n,1)];
        
    %%% H(X1,X2,...,Xk) Calculation
           %H(s0)
        H_s0=0;
        for i=1:length(P)
             ps=P(i);
             H_s0=H_s0-(ps*log2(ps));
        end
           %H(s1|s0)
        H_s1s0=0;
        for i=1:length(P)
            Pi=P(i);
            Hi=0;
            for j=1:length(transition_states)
                pt=transition_states(i,j);
                if(pt==0)
                    continue;
                end
                Hi=Hi-(pt*log2(pt));
            end
            H_s1s0=H_s1s0+Pi*Hi;
        end
  
        H=H_s0+k*H_s1s0;
        
     %%% Calculating Gk
        G=H/k;
        
end