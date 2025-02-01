% Load data from Excel file
filename = 'D:\Drivers\sorted_data.xlsx';  % Replace with your actual file name
data = readtable(filename, 'PreserveVariableNames', true);
X = data(:, 2:end-1); % 输入特征
Y = data(:, end); % 输出标签

% 数据预处理
X = normalize(X); % 归一化输入特征
Y = normalize(Y); % 归一化输出标签

% 划分训练集和测试集
train_ratio = 0.8; % 训练集比例
train_size = round(train_ratio * size(X, 1));
X_train = X(1:train_size, :);
Y_train = Y(1:train_size, :);
X_test = X(train_size+1:end, :);
Y_test = Y(train_size+1:end, :);

% 构建LSTM模型
num_features = size(X_train, 1); % 输入特征数量
num_hidden_units = 100; % LSTM隐藏单元数量
num_epochs = 100; % 迭代次数

model = lstm(num_features, num_hidden_units);
model = train(model, X_train, Y_train, num_epochs);

% 预测
Y_pred = predict(model, X_test);

% 反归一化预测结果
Y_pred = Y_pred .* std(Y_train) + mean(Y_train);
Y_test = Y_test .* std(Y_train) + mean(Y_train);

% 计算均方根误差（RMSE）
rmse = sqrt(mean((Y_pred - Y_test).^2));

% 显示结果
plot(Y_test, 'b', 'LineWidth', 2);
hold on;
plot(Y_pred, 'r--', 'LineWidth', 2);
legend('真实值', '预测值');
xlabel('样本序号');
ylabel('碳排放');
title(['RMSE: ', num2str(rmse)]);

% 相关问题：
% 1. 如何导入数据并进行预处理？
% 2. LSTM模型的参数如何设置？
% 3. 如何进行预测和评估模型性能？

