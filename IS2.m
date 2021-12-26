x1=[0.1:1/22:1];

d=(1+0.6*sin(2*pi*x1/0.7)+0.3*sin(2*pi*x1))/2;
plot(x1,d,'rx')

w1_1=randn(1)*0.1;
w2_1=randn(1)*0.1;
w3_1=randn(1)*0.1;
w4_1=randn(1)*0.1;

w1_2=randn(1)*0.1;
w2_2=randn(1)*0.1;
w3_2=randn(1)*0.1;
w4_2=randn(1)*0.1;

b1_1=randn(1)*0.1;
b2_1=randn(1)*0.1;
b3_1=randn(1)*0.1;
b4_1=randn(1)*0.1;

b1_2=randn(1)*0.1;

n=0.1;
for i=1:100000
for index =1:length(x1)
   
v1 = x1(index)*w1_1+b1_1;
v2 = x1(index)*w2_1+b2_1;
v3 = x1(index)*w3_1+b3_1;
v4 = x1(index)*w4_1+b4_1;

    y1_1=1/(1+exp(-v1));
    y2_1=1/(1+exp(-v2));
    y3_1=1/(1+exp(-v3));
    y4_1=1/(1+exp(-v4));
   
    v1_2=y1_1*w1_2+y2_1*w2_2+y3_1*w3_2+y4_1*w4_2+b1_2;
%y1=tanh(-v1);


    y=v1_2;
    e=d(index)-y;%5 etapas
    dout=e;%6 etapas
    delta1=y1_1*(1-y1_1)*dout*w1_2;
    delta2=y2_1*(1-y2_1)*dout*w2_2;
    delta3=y3_1*(1-y3_1)*dout*w3_2;
    delta4=y4_1*(1-y4_1)*dout*w4_2;
   
    w1_2=w1_2+n*dout*y1_1;
    w2_2=w2_2+n*dout*y2_1;
    w3_2=w3_2+n*dout*y3_1;
    w4_2=w4_2+n*dout*y4_1;
    b1_2=b1_2+n*dout;
   
   
    w1_1=w1_1+n*delta1*x1(index);
    b1_1=b1_1+n*delta1;
   
    w2_1=w2_1+n*delta2*x1(index);
    b2_1=b2_1+n*delta2;
   
    w3_1=w3_1+n*delta3*x1(index);
    b3_1=b3_1+n*delta3;
   
    w4_1=w4_1+n*delta4*x1(index);
    b4_1=b4_1+n*delta4;
   
   
   
   
end
end

% % z=zeros(1,length(d));
for index=1:20
    v1 = x1(index)*w1_1+b1_1;
v2 = x1(index)*w2_1+b2_1;
v3 = x1(index)*w3_1+b3_1;
v4 = x1(index)*w4_1+b4_1;

    y1_1=1/(1+exp(-v1));
    y2_1=1/(1+exp(-v2));
    y3_1=1/(1+exp(-v3));
    y4_1=1/(1+exp(-v4));
   
    v1_2=y1_1*w1_2+y2_1*w2_2+y3_1*w3_2+y4_1*w4_2+b1_2;
%y1=tanh(-v1);


    Y(index)=v1_2;
end
figure
plot(x1,d,'rx', x1,Y,'g*')