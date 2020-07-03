function draw(board_num,name,pos_x,K,varargin)
    %nameΪͼ��title��pos_x��������Ļչʾλ�õĺ���������
    %Kָ����������Ҳ����varargin�ж��ٸ��������
    %board_numָ��ʹ���Ŀ黭��
    figure(board_num);
    data_cell = cell(1,K);
    style = ['o','v','s','p','*','h','+','x','D','1','2','3','4','8'];
    for k = 1:K
        data_cell{1,k} = varargin{k};
        x1=data_cell{1,k}(:,1);
        y1=data_cell{1,k}(:,2);
        z1=data_cell{1,k}(:,3);
        scatter3(x1,y1,z1,style(k));
        hold on;
    end
    title(name);
    xlabel('x'),ylabel('y'),zlabel('z');
    set(gcf,'Position',[pos_x 300 650 500]);
end

