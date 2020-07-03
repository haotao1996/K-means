function [Jc, varargout] = Kmeans(K, Data)
    %实现K-means聚类算法,K代表期望类别数
    %迭代次数
    I = 1;
    %初始类簇中心点的确定
    %选择批次距离尽可能远的K个点
    %首先随机选择一个点作为第一个初始类簇中心点，然后选择距离该点最远的那个点作为第二个初始类簇中心点，
    %然后再选择距离前两个点的中心距离最大的点作为第三个初始类簇的中心点，以此类推，直至选出K个初始类簇中心点。
    %数据集样本的个数
    data_num = size(Data,1);
    
    Z = cell(1,K);
    Z{1,1} = Data(1,:);
    %记录已经加进聚类中心的点，防止聚类中心重复
    exist_p = [1];
    %生成初始聚类中心
    for k = 2:K
        max_distance = 0;
        avg = [0,0,0];
        for t = 1:k-1
            avg = avg + Z{1,t};
        end
        avg = avg/t;
        for p = 1:data_num
            if not(ismember(p,exist_p))
                recent_max_distance =  sum((Data(p,:)-avg).^2);
                if recent_max_distance > max_distance
                    max_distance = recent_max_distance;
                    Z{1,k} = Data(p,:);
                    exist_p(k) = p;
                end
            end
        end
    end
    
    Class = cell(1,K);
    Distance = cell(1,K);
    while 1
        for k = 1:K
            Class{1,k} = [];
        end 
        for i = 1:data_num
            %计算所有数据到聚类中心的距离
            for k = 1:K
                Distance{1,k} = sum((Data(i,:)-Z{1,k}).^2);
            end
            L = [];    
            for k = 1:K
                L = cat(2, L,Distance{1,k});
            end
            %获得最小值及其位置
            [~, p] = min(L);
            %将每个样本归类到最近的聚类中心中
            Class{1,p}= [Class{1,p};Data(i,:)];
        end
        %重新计算聚类中心,并且记录一下旧的聚类中心
        Zold = Z;
        for k =1:K
            Z{1,k} = mean( Class{1,k},1);
        end
        I = I+1;
        %如果新的聚类中心和旧的聚类中心相同则退出循环
        if isequal(Z,Zold)
            %计算误差平方和Jc
            Jc = 0;
            for k = 1:K
                row_num = size(Class{1,k},1);
                for n = 1:row_num
                    Jc = Jc + sum((Class{1,k}(n,:)-Z{1,k}).^2);
                end
            end
            for k = 1:K
                varargout{k} = Class{1,k};
            end
            disp(['类别数：',num2str(K),'，数据个数：',num2str(data_num),'，迭代次数：',num2str(I)]);
            break
        end
    end        
end
