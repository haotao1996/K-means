# K-means
K Means Clustering with MATLAB
## 数据
自己构建五分类数据库，每类中的样本符合独立多元高斯分布。采用基于C-均值聚类算法对其分类。
## 文件说明
main.m负责生成实验数据和控制流程，运行该文件便可以得结果，该文件开始部分设置了随机种子，保证了结果的可重复性。
Kmeans.m实现了C-均值聚类算法，该文件实现function [Jc, varargout] = Kmeans(K, Data)函数，输入为期望的类别数和实验数据，返回误差平方和以及聚类结果。
draw.m主要作用为将数据进行可视化。
