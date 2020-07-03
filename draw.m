function draw(board_num,name,pos_x,K,varargin)
    %name为图的title，pos_x设置在屏幕展示位置的横坐标像素
    %K指明类别个数，也就是varargin有多少个输入参数
    %board_num指定使用哪块画板
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

