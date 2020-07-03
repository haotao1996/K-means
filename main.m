%设置随机种子，保证每次结果都相同
rand('seed',400);
randn('seed',400);
%生成5组三维高斯分布的数据作为数据集
%第一组
mu1=[-10,5,0];%数学期望
sigma1=[1,0,0;0,2,0;0,0,2];%协方差矩阵
A=mvnrnd(mu1,sigma1,20);%生成20个样本
%第二组
mu2=[-10,0,10];
sigma2=[2,0,0;0,2,0;0,0,1];
B=mvnrnd(mu2,sigma2,20);
%第三组
mu3=[0,10,0];
sigma3=[1,0,0;0,2,0;0,0,1];
C=mvnrnd(mu3,sigma3,20);
%第四组
mu4=[0,0,10];
sigma4=[2,0,0;0,1,0;0,0,1];
D=mvnrnd(mu4,sigma4,20);
%第五组
mu5=[1,5,5];
sigma5=[1,0,0;0,1,0;0,0,2];
E=mvnrnd(mu5,sigma5,20);
%显示数据集
draw(1,'Dataset',100, 5,A,B,C,D,E);

%总的数据集
Dataset = [A;B;C;D;E];

%进行多次聚类，根据误差平方和确定类别数
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
title('误差平方和Jc');
xlabel('C'),ylabel('Jc');
% 根据Jc曲线，5类结果最好，画出该结果
draw(2,'Results',500,5,C15, C25, C35, C45,C55);











