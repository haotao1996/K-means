%����������ӣ���֤ÿ�ν������ͬ
rand('seed',400);
randn('seed',400);
%����5����ά��˹�ֲ���������Ϊ���ݼ�
%��һ��
mu1=[-10,5,0];%��ѧ����
sigma1=[1,0,0;0,2,0;0,0,2];%Э�������
A=mvnrnd(mu1,sigma1,20);%����20������
%�ڶ���
mu2=[-10,0,10];
sigma2=[2,0,0;0,2,0;0,0,1];
B=mvnrnd(mu2,sigma2,20);
%������
mu3=[0,10,0];
sigma3=[1,0,0;0,2,0;0,0,1];
C=mvnrnd(mu3,sigma3,20);
%������
mu4=[0,0,10];
sigma4=[2,0,0;0,1,0;0,0,1];
D=mvnrnd(mu4,sigma4,20);
%������
mu5=[1,5,5];
sigma5=[1,0,0;0,1,0;0,0,2];
E=mvnrnd(mu5,sigma5,20);
%��ʾ���ݼ�
draw(1,'Dataset',100, 5,A,B,C,D,E);

%�ܵ����ݼ�
Dataset = [A;B;C;D;E];

%���ж�ξ��࣬�������ƽ����ȷ�������
[Jc1, C11] = Kmeans(1,Dataset);
[Jc2, C12, C22] = Kmeans(2,Dataset);
[Jc3, C13, C23,C33] = Kmeans(3,Dataset);
[Jc4, C14, C24, C34, C44] = Kmeans(4,Dataset);
[Jc5, C15, C25, C35, C45, C55] = Kmeans(5,Dataset);
[Jc6, C16, C26, C36, C46, C56, C66] = Kmeans(6,Dataset);
[Jc7, C17, C27, C37, C47, C57, C67, C77] = Kmeans(7,Dataset);
[Jc8, C18, C28, C38, C48, C58, C68, C78, C88] = Kmeans(8,Dataset);
[Jc9, C19, C29, C39, C49, C59, C69, C79, C89, C99] = Kmeans(9,Dataset);
[Jc10, C110, C210, C310, C410, C510, C610, C710, C810, C910, C1010] = Kmeans(10,Dataset);
[Jc11, C111, C211, C311, C411, C511, C611, C711, C811, C911, C1011,C1111] = Kmeans(11,Dataset);

Jc = [Jc1,Jc2,Jc3,Jc4,Jc5,Jc6,Jc7,Jc8,Jc9,Jc10,Jc11];
Xaxis = 1:1:11;
figure(4);
plot(Xaxis,Jc,'-*b');
title('���ƽ����Jc');
xlabel('C'),ylabel('Jc');
% ����Jc���ߣ�5������ã������ý��
draw(2,'Results',500,5,C15, C25, C35, C45,C55);











