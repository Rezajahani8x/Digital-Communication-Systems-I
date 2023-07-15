sample_size=1000;
%% Source X1
p1=[0.7 0.29 0.01];
a1=1:3;
chain_X1=randsrc(sample_size,1,[a1;p1]);
H_x1=0;
for i=1:3
   H_x1=H_x1-p1(i)*log2(p1(i));
end

%% Source X2
p2=kron(p1,p1);
a2=1:9;
chain_X2=randsrc(sample_size,1,[a2;p2]);
H_x2=0;
for i=1:9
   H_x2=H_x2-p2(i)*log2(p2(i));
end

%% Source X3
p3=kron(p1,p2);
a3=1:27;
chain_X3=randsrc(sample_size,1,[a3;p3]);
H_x3=0;
for i=1:27
    H_x3=H_x3-p3(i)*log2(p3(i));
end

%%% Calculation of Values

%X1
Gk1=zeros(1,10);
avg1=zeros(1,10);
eff1=zeros(1,10);
H_1=zeros(1,10);
[~,avgg1]=huffmandict(1:3,p1);
for k=1:10
   Gk1(k)=(k+1)/k * H_x1;
   avg1(k)=average_length(chain_X1,k);
   eff1(k)=H_x1/avgg1;
   H_1(k)=H_x1;
end

%X2
Gk2=zeros(1,10);
avg2=zeros(1,10);
eff2=zeros(1,10);
H_2=zeros(1,10);
[~,avgg2]=huffmandict(1:9,p2);
for k=1:10
   Gk2(k)=(k+1)/k * H_x2;
   avg2(k)=average_length(chain_X2,k);
   eff2(k)=H_x2/avgg2;
   H_2(k)=H_x2;
end

%X3
Gk3=zeros(1,10);
avg3=zeros(1,10);
eff3=zeros(1,10);
H_3=zeros(1,10);
[~,avgg3]=huffmandict(1:27,p3);
for k=1:10
   Gk3(k)=(k+1)/k * H_x3;
   avg3(k)=average_length(chain_X3,k);
   eff3(k)=H_x3/avgg3;
   H_3(k)=H_x3;
end

%%%Plot values
k=1:10;
%X1
figure(1);
plot(k,Gk1,'b');hold on
plot(k,avg1,'r');
xlabel('k');
title('Source X^1');
legend("G_k","Average Code Length");
hold off;
figure(2);
plot(k,eff1,'b');hold on
plot(k,H_1,'r');
xlabel('k');
title('Source X^1');
legend("Coding Efficiency","H(X)");

%X2
figure(3);
plot(k,Gk2,'r');hold on
plot(k,avg2,'b');
xlabel('k');
title('Source X^2');
legend("G_k","Average Code Length");
hold off;
figure(4);
plot(k,eff2,'r');hold on
plot(k,H_2,'b');
xlabel('k');
title('Source X^2');
legend("Coding Efficiency","H(X^2)");

%X3
figure(5);
plot(k,Gk3,'r');hold on
plot(k,avg3,'b');
xlabel('k');
title('Source X^3');
legend("G_k","Average Code Length");
hold off;
figure(6);
plot(k,eff3,'r');hold on
plot(k,H_3,'b');
xlabel('k');
title('Source X^3');
legend("Coding Efficiency","H(X^3)");