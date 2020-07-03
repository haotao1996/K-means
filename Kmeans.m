function [Jc, varargout] = Kmeans(K, Data)
    %ʵ��K-means�����㷨,K�������������
    %��������
    I = 1;
    %��ʼ������ĵ��ȷ��
    %ѡ�����ξ��뾡����Զ��K����
    %�������ѡ��һ������Ϊ��һ����ʼ������ĵ㣬Ȼ��ѡ�����õ���Զ���Ǹ�����Ϊ�ڶ�����ʼ������ĵ㣬
    %Ȼ����ѡ�����ǰ����������ľ������ĵ���Ϊ��������ʼ��ص����ĵ㣬�Դ����ƣ�ֱ��ѡ��K����ʼ������ĵ㡣
    %���ݼ������ĸ���
    data_num = size(Data,1);
    
    Z = cell(1,K);
    Z{1,1} = Data(1,:);
    %��¼�Ѿ��ӽ��������ĵĵ㣬��ֹ���������ظ�
    exist_p = [1];
    %���ɳ�ʼ��������
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
            %�����������ݵ��������ĵľ���
            for k = 1:K
                Distance{1,k} = sum((Data(i,:)-Z{1,k}).^2);
            end
            L = [];    
            for k = 1:K
                L = cat(2, L,Distance{1,k});
            end
            %�����Сֵ����λ��
            [~, p] = min(L);
            %��ÿ���������ൽ����ľ���������
            Class{1,p}= [Class{1,p};Data(i,:)];
        end
        %���¼����������,���Ҽ�¼һ�¾ɵľ�������
        Zold = Z;
        for k =1:K
            Z{1,k} = mean( Class{1,k},1);
        end
        I = I+1;
        %����µľ������ĺ;ɵľ���������ͬ���˳�ѭ��
        if isequal(Z,Zold)
            %�������ƽ����Jc
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
            disp(['�������',num2str(K),'�����ݸ�����',num2str(data_num),'������������',num2str(I)]);
            break
        end
    end        
end
