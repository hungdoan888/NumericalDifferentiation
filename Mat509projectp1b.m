clc;
format shorte;

M=1;

h = zeros(16, 1);
table = zeros(16, 3);
for i=1:16
    h(i)=10^(-i);    
    error=M*h(i)/2+2*eps/h(i); 
    table(i, 1)=h(i);
    table(i, 2)=error;
end

a=1;  
for i=1:16
    h(i)=10^(-i);     
    error=M*h(i)/2+2*eps/h(i);     
    table(i, 3)=error;
end

f=figure;
data=table;
colnames={'h', 'error (a=0)', 'error (a=1)'};
t=uitable(f, 'Data', data, 'ColumnName', colnames);

figure
loglog(h, table(:,2))
hold on;
loglog(h, table(:,3))

hopt=2*sqrt(eps);
error=M*hopt/2+2*eps/hopt; 
plot(hopt, error, 'o')

title('Error in Approximation')
xlabel('h')
ylabel('Error')
legend('a=0', 'a=1', 'h_{opt}', 'Location', 'northeast')


