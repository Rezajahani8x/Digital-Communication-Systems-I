function l=average_length(chain,k)
        L=length(chain);
        index=L/k;
        index=floor(index);
        chain=chain(1:k*index);
        symbols=reshape(chain,[k,index]);
        symbols=transpose(symbols);
        [C,~,ic]=unique(symbols,'rows','stable');
        unique_symbols=1:length(C);
        counts=accumarray(ic,1);
        p=counts/index;
        [~,l]=huffmandict(unique_symbols,p);
end