CREATE DATABASE Bank_Management;

USE Bank_Management;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at DATETIME NOT NULL
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type ENUM('Savings', 'Current') NOT NULL,
    balance DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    status ENUM('Active', 'Frozen') NOT NULL DEFAULT 'Active',
    created_at DATETIME NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_type ENUM('Deposit', 'Withdrawal') NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    transaction_date DATETIME NOT NULL,
    remarks VARCHAR(255),

    FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
);

CREATE TABLE transaction_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT NOT NULL,
    account_id INT NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    old_balance DECIMAL(12,2),
    new_balance DECIMAL(12,2),
    action_time DATETIME NOT NULL
);

CREATE TABLE deleted_accounts (
    deletion_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    customer_id INT NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    final_balance DECIMAL(12,2) NOT NULL,
    account_status VARCHAR(20) NOT NULL,
    deleted_at DATETIME NOT NULL
);


INSERT INTO customers
(customer_id, customer_name, phone, email, created_at)
VALUES
(1001, 'Arun Kumar', '9700000000', 'customer001@bankdemo.com', '2025-01-01 00:00:00'),
(1002, 'Meena Raj', '9700000001', 'customer002@bankdemo.com', '2025-01-02 00:00:00'),
(1003, 'Ravi Devi', '9700000002', 'customer003@bankdemo.com', '2025-01-03 00:00:00'),
(1004, 'Priya Sharma', '9700000003', 'customer004@bankdemo.com', '2025-01-04 00:00:00'),
(1005, 'Karthik Iyer', '9700000004', 'customer005@bankdemo.com', '2025-01-05 00:00:00'),
(1006, 'Divya Nair', '9700000005', 'customer006@bankdemo.com', '2025-01-06 00:00:00'),
(1007, 'Suresh Reddy', '9700000006', 'customer007@bankdemo.com', '2025-01-07 00:00:00'),
(1008, 'Anitha Patel', '9700000007', 'customer008@bankdemo.com', '2025-01-08 00:00:00'),
(1009, 'Vijay Das', '9700000008', 'customer009@bankdemo.com', '2025-01-09 00:00:00'),
(1010, 'Nisha Menon', '9700000009', 'customer010@bankdemo.com', '2025-01-10 00:00:00'),
(1011, 'Rahul Kumar', '9700000010', 'customer011@bankdemo.com', '2025-01-11 00:00:00'),
(1012, 'Swetha Raj', '9700000011', 'customer012@bankdemo.com', '2025-01-12 00:00:00'),
(1013, 'Manoj Devi', '9700000012', 'customer013@bankdemo.com', '2025-01-13 00:00:00'),
(1014, 'Keerthi Sharma', '9700000013', 'customer014@bankdemo.com', '2025-01-14 00:00:00'),
(1015, 'Sanjay Iyer', '9700000014', 'customer015@bankdemo.com', '2025-01-15 00:00:00'),
(1016, 'Pooja Nair', '9700000015', 'customer016@bankdemo.com', '2025-01-16 00:00:00'),
(1017, 'Dinesh Reddy', '9700000016', 'customer017@bankdemo.com', '2025-01-17 00:00:00'),
(1018, 'Lavanya Patel', '9700000017', 'customer018@bankdemo.com', '2025-01-18 00:00:00'),
(1019, 'Harish Das', '9700000018', 'customer019@bankdemo.com', '2025-01-19 00:00:00'),
(1020, 'Asha Menon', '9700000019', 'customer020@bankdemo.com', '2025-01-20 00:00:00'),
(1021, 'Arun Raj', '9700000020', 'customer021@bankdemo.com', '2025-01-21 00:00:00'),
(1022, 'Meena Devi', '9700000021', 'customer022@bankdemo.com', '2025-01-22 00:00:00'),
(1023, 'Ravi Sharma', '9700000022', 'customer023@bankdemo.com', '2025-01-23 00:00:00'),
(1024, 'Priya Iyer', '9700000023', 'customer024@bankdemo.com', '2025-01-24 00:00:00'),
(1025, 'Karthik Nair', '9700000024', 'customer025@bankdemo.com', '2025-01-25 00:00:00'),
(1026, 'Divya Reddy', '9700000025', 'customer026@bankdemo.com', '2025-01-26 00:00:00'),
(1027, 'Suresh Patel', '9700000026', 'customer027@bankdemo.com', '2025-01-27 00:00:00'),
(1028, 'Anitha Das', '9700000027', 'customer028@bankdemo.com', '2025-01-28 00:00:00'),
(1029, 'Vijay Menon', '9700000028', 'customer029@bankdemo.com', '2025-01-29 00:00:00'),
(1030, 'Nisha Kumar', '9700000029', 'customer030@bankdemo.com', '2025-01-30 00:00:00'),
(1031, 'Rahul Devi', '9700000030', 'customer031@bankdemo.com', '2025-01-31 00:00:00'),
(1032, 'Swetha Sharma', '9700000031', 'customer032@bankdemo.com', '2025-02-01 00:00:00'),
(1033, 'Manoj Iyer', '9700000032', 'customer033@bankdemo.com', '2025-02-02 00:00:00'),
(1034, 'Keerthi Nair', '9700000033', 'customer034@bankdemo.com', '2025-02-03 00:00:00'),
(1035, 'Sanjay Reddy', '9700000034', 'customer035@bankdemo.com', '2025-02-04 00:00:00'),
(1036, 'Pooja Patel', '9700000035', 'customer036@bankdemo.com', '2025-02-05 00:00:00'),
(1037, 'Dinesh Das', '9700000036', 'customer037@bankdemo.com', '2025-02-06 00:00:00'),
(1038, 'Lavanya Menon', '9700000037', 'customer038@bankdemo.com', '2025-02-07 00:00:00'),
(1039, 'Harish Kumar', '9700000038', 'customer039@bankdemo.com', '2025-02-08 00:00:00'),
(1040, 'Asha Raj', '9700000039', 'customer040@bankdemo.com', '2025-02-09 00:00:00'),
(1041, 'Arun Devi', '9700000040', 'customer041@bankdemo.com', '2025-02-10 00:00:00'),
(1042, 'Meena Sharma', '9700000041', 'customer042@bankdemo.com', '2025-02-11 00:00:00'),
(1043, 'Ravi Iyer', '9700000042', 'customer043@bankdemo.com', '2025-02-12 00:00:00'),
(1044, 'Priya Nair', '9700000043', 'customer044@bankdemo.com', '2025-02-13 00:00:00'),
(1045, 'Karthik Reddy', '9700000044', 'customer045@bankdemo.com', '2025-02-14 00:00:00'),
(1046, 'Divya Patel', '9700000045', 'customer046@bankdemo.com', '2025-02-15 00:00:00'),
(1047, 'Suresh Das', '9700000046', 'customer047@bankdemo.com', '2025-02-16 00:00:00'),
(1048, 'Anitha Menon', '9700000047', 'customer048@bankdemo.com', '2025-02-17 00:00:00'),
(1049, 'Vijay Kumar', '9700000048', 'customer049@bankdemo.com', '2025-02-18 00:00:00'),
(1050, 'Nisha Raj', '9700000049', 'customer050@bankdemo.com', '2025-02-19 00:00:00'),
(1051, 'Rahul Sharma', '9700000050', 'customer051@bankdemo.com', '2025-02-20 00:00:00'),
(1052, 'Swetha Iyer', '9700000051', 'customer052@bankdemo.com', '2025-02-21 00:00:00'),
(1053, 'Manoj Nair', '9700000052', 'customer053@bankdemo.com', '2025-02-22 00:00:00'),
(1054, 'Keerthi Reddy', '9700000053', 'customer054@bankdemo.com', '2025-02-23 00:00:00'),
(1055, 'Sanjay Patel', '9700000054', 'customer055@bankdemo.com', '2025-02-24 00:00:00'),
(1056, 'Pooja Das', '9700000055', 'customer056@bankdemo.com', '2025-02-25 00:00:00'),
(1057, 'Dinesh Menon', '9700000056', 'customer057@bankdemo.com', '2025-02-26 00:00:00'),
(1058, 'Lavanya Kumar', '9700000057', 'customer058@bankdemo.com', '2025-02-27 00:00:00'),
(1059, 'Harish Raj', '9700000058', 'customer059@bankdemo.com', '2025-02-28 00:00:00'),
(1060, 'Asha Sharma', '9700000059', 'customer060@bankdemo.com', '2025-03-01 00:00:00'),
(1061, 'Arun Iyer', '9700000060', 'customer061@bankdemo.com', '2025-03-02 00:00:00'),
(1062, 'Meena Nair', '9700000061', 'customer062@bankdemo.com', '2025-03-03 00:00:00'),
(1063, 'Ravi Reddy', '9700000062', 'customer063@bankdemo.com', '2025-03-04 00:00:00'),
(1064, 'Priya Patel', '9700000063', 'customer064@bankdemo.com', '2025-03-05 00:00:00'),
(1065, 'Karthik Das', '9700000064', 'customer065@bankdemo.com', '2025-03-06 00:00:00'),
(1066, 'Divya Menon', '9700000065', 'customer066@bankdemo.com', '2025-03-07 00:00:00'),
(1067, 'Suresh Kumar', '9700000066', 'customer067@bankdemo.com', '2025-03-08 00:00:00'),
(1068, 'Anitha Raj', '9700000067', 'customer068@bankdemo.com', '2025-03-09 00:00:00'),
(1069, 'Vijay Sharma', '9700000068', 'customer069@bankdemo.com', '2025-03-10 00:00:00'),
(1070, 'Nisha Iyer', '9700000069', 'customer070@bankdemo.com', '2025-03-11 00:00:00'),
(1071, 'Rahul Nair', '9700000070', 'customer071@bankdemo.com', '2025-03-12 00:00:00'),
(1072, 'Swetha Reddy', '9700000071', 'customer072@bankdemo.com', '2025-03-13 00:00:00'),
(1073, 'Manoj Patel', '9700000072', 'customer073@bankdemo.com', '2025-03-14 00:00:00'),
(1074, 'Keerthi Das', '9700000073', 'customer074@bankdemo.com', '2025-03-15 00:00:00'),
(1075, 'Sanjay Menon', '9700000074', 'customer075@bankdemo.com', '2025-03-16 00:00:00'),
(1076, 'Pooja Kumar', '9700000075', 'customer076@bankdemo.com', '2025-03-17 00:00:00'),
(1077, 'Dinesh Raj', '9700000076', 'customer077@bankdemo.com', '2025-03-18 00:00:00'),
(1078, 'Lavanya Sharma', '9700000077', 'customer078@bankdemo.com', '2025-03-19 00:00:00'),
(1079, 'Harish Iyer', '9700000078', 'customer079@bankdemo.com', '2025-03-20 00:00:00'),
(1080, 'Asha Nair', '9700000079', 'customer080@bankdemo.com', '2025-03-21 00:00:00'),
(1081, 'Arun Reddy', '9700000080', 'customer081@bankdemo.com', '2025-03-22 00:00:00'),
(1082, 'Meena Patel', '9700000081', 'customer082@bankdemo.com', '2025-03-23 00:00:00'),
(1083, 'Ravi Das', '9700000082', 'customer083@bankdemo.com', '2025-03-24 00:00:00'),
(1084, 'Priya Menon', '9700000083', 'customer084@bankdemo.com', '2025-03-25 00:00:00'),
(1085, 'Karthik Kumar', '9700000084', 'customer085@bankdemo.com', '2025-03-26 00:00:00'),
(1086, 'Divya Raj', '9700000085', 'customer086@bankdemo.com', '2025-03-27 00:00:00'),
(1087, 'Suresh Sharma', '9700000086', 'customer087@bankdemo.com', '2025-03-28 00:00:00'),
(1088, 'Anitha Iyer', '9700000087', 'customer088@bankdemo.com', '2025-03-29 00:00:00'),
(1089, 'Vijay Nair', '9700000088', 'customer089@bankdemo.com', '2025-03-30 00:00:00'),
(1090, 'Nisha Reddy', '9700000089', 'customer090@bankdemo.com', '2025-03-31 00:00:00'),
(1091, 'Rahul Patel', '9700000090', 'customer091@bankdemo.com', '2025-04-01 00:00:00'),
(1092, 'Swetha Das', '9700000091', 'customer092@bankdemo.com', '2025-04-02 00:00:00'),
(1093, 'Manoj Menon', '9700000092', 'customer093@bankdemo.com', '2025-04-03 00:00:00'),
(1094, 'Keerthi Kumar', '9700000093', 'customer094@bankdemo.com', '2025-04-04 00:00:00'),
(1095, 'Sanjay Raj', '9700000094', 'customer095@bankdemo.com', '2025-04-05 00:00:00'),
(1096, 'Pooja Sharma', '9700000095', 'customer096@bankdemo.com', '2025-04-06 00:00:00'),
(1097, 'Dinesh Iyer', '9700000096', 'customer097@bankdemo.com', '2025-04-07 00:00:00'),
(1098, 'Lavanya Nair', '9700000097', 'customer098@bankdemo.com', '2025-04-08 00:00:00'),
(1099, 'Harish Reddy', '9700000098', 'customer099@bankdemo.com', '2025-04-09 00:00:00'),
(1100, 'Asha Patel', '9700000099', 'customer100@bankdemo.com', '2025-04-10 00:00:00');

SELECT *
FROM Customers;

INSERT INTO accounts
(account_id, customer_id, account_type, balance, status, created_at)
VALUES
(500001, 1001, 'Savings', 10000.00, 'Active', '2025-02-01 00:00:00'),
(500002, 1002, 'Current', 11379.00, 'Active', '2025-02-02 00:00:00'),
(500003, 1003, 'Savings', 12758.00, 'Active', '2025-02-03 00:00:00'),
(500004, 1004, 'Current', 14137.00, 'Active', '2025-02-04 00:00:00'),
(500005, 1005, 'Savings', 15516.00, 'Frozen', '2025-02-05 00:00:00'),
(500006, 1006, 'Current', 16895.00, 'Active', '2025-02-06 00:00:00'),
(500007, 1007, 'Savings', 18274.00, 'Active', '2025-02-07 00:00:00'),
(500008, 1008, 'Current', 19653.00, 'Active', '2025-02-08 00:00:00'),
(500009, 1009, 'Savings', 21032.00, 'Active', '2025-02-09 00:00:00'),
(500010, 1010, 'Current', 22411.00, 'Active', '2025-02-10 00:00:00'),
(500011, 1011, 'Savings', 23790.00, 'Frozen', '2025-02-11 00:00:00'),
(500012, 1012, 'Current', 25169.00, 'Active', '2025-02-12 00:00:00'),
(500013, 1013, 'Savings', 26548.00, 'Active', '2025-02-13 00:00:00'),
(500014, 1014, 'Current', 27927.00, 'Active', '2025-02-14 00:00:00'),
(500015, 1015, 'Savings', 29306.00, 'Active', '2025-02-15 00:00:00'),
(500016, 1016, 'Current', 30685.00, 'Frozen', '2025-02-16 00:00:00'),
(500017, 1017, 'Savings', 32064.00, 'Active', '2025-02-17 00:00:00'),
(500018, 1018, 'Current', 33443.00, 'Active', '2025-02-18 00:00:00'),
(500019, 1019, 'Savings', 34822.00, 'Active', '2025-02-19 00:00:00'),
(500020, 1020, 'Current', 36201.00, 'Active', '2025-02-20 00:00:00'),
(500021, 1021, 'Savings', 37580.00, 'Frozen', '2025-02-21 00:00:00'),
(500022, 1022, 'Current', 38959.00, 'Active', '2025-02-22 00:00:00'),
(500023, 1023, 'Savings', 40338.00, 'Active', '2025-02-23 00:00:00'),
(500024, 1024, 'Current', 41717.00, 'Active', '2025-02-24 00:00:00'),
(500025, 1025, 'Savings', 43096.00, 'Active', '2025-02-25 00:00:00'),
(500026, 1026, 'Current', 44475.00, 'Frozen', '2025-02-26 00:00:00'),
(500027, 1027, 'Savings', 45854.00, 'Active', '2025-02-27 00:00:00'),
(500028, 1028, 'Current', 47233.00, 'Active', '2025-02-28 00:00:00'),
(500029, 1029, 'Savings', 48612.00, 'Active', '2025-03-01 00:00:00'),
(500030, 1030, 'Current', 49991.00, 'Active', '2025-03-02 00:00:00'),
(500031, 1031, 'Savings', 11370.00, 'Frozen', '2025-03-03 00:00:00'),
(500032, 1032, 'Current', 12749.00, 'Active', '2025-03-04 00:00:00'),
(500033, 1033, 'Savings', 14128.00, 'Active', '2025-03-05 00:00:00'),
(500034, 1034, 'Current', 15507.00, 'Active', '2025-03-06 00:00:00'),
(500035, 1035, 'Savings', 16886.00, 'Active', '2025-03-07 00:00:00'),
(500036, 1036, 'Current', 18265.00, 'Frozen', '2025-03-08 00:00:00'),
(500037, 1037, 'Savings', 19644.00, 'Active', '2025-03-09 00:00:00'),
(500038, 1038, 'Current', 21023.00, 'Active', '2025-03-10 00:00:00'),
(500039, 1039, 'Savings', 22402.00, 'Active', '2025-03-11 00:00:00'),
(500040, 1040, 'Current', 23781.00, 'Active', '2025-03-12 00:00:00'),
(500041, 1041, 'Savings', 25160.00, 'Frozen', '2025-03-13 00:00:00'),
(500042, 1042, 'Current', 26539.00, 'Active', '2025-03-14 00:00:00'),
(500043, 1043, 'Savings', 27918.00, 'Active', '2025-03-15 00:00:00'),
(500044, 1044, 'Current', 29297.00, 'Active', '2025-03-16 00:00:00'),
(500045, 1045, 'Savings', 30676.00, 'Active', '2025-03-17 00:00:00'),
(500046, 1046, 'Current', 32055.00, 'Frozen', '2025-03-18 00:00:00'),
(500047, 1047, 'Savings', 33434.00, 'Active', '2025-03-19 00:00:00'),
(500048, 1048, 'Current', 34813.00, 'Active', '2025-03-20 00:00:00'),
(500049, 1049, 'Savings', 36192.00, 'Active', '2025-03-21 00:00:00'),
(500050, 1050, 'Current', 37571.00, 'Active', '2025-03-22 00:00:00'),
(500051, 1051, 'Savings', 38950.00, 'Frozen', '2025-03-23 00:00:00'),
(500052, 1052, 'Current', 40329.00, 'Active', '2025-03-24 00:00:00'),
(500053, 1053, 'Savings', 41708.00, 'Active', '2025-03-25 00:00:00'),
(500054, 1054, 'Current', 43087.00, 'Active', '2025-03-26 00:00:00'),
(500055, 1055, 'Savings', 44466.00, 'Active', '2025-03-27 00:00:00'),
(500056, 1056, 'Current', 45845.00, 'Frozen', '2025-03-28 00:00:00'),
(500057, 1057, 'Savings', 47224.00, 'Active', '2025-03-29 00:00:00'),
(500058, 1058, 'Current', 48603.00, 'Active', '2025-03-30 00:00:00'),
(500059, 1059, 'Savings', 49982.00, 'Active', '2025-03-31 00:00:00'),
(500060, 1060, 'Current', 11361.00, 'Active', '2025-04-01 00:00:00'),
(500061, 1061, 'Savings', 12740.00, 'Frozen', '2025-04-02 00:00:00'),
(500062, 1062, 'Current', 14119.00, 'Active', '2025-04-03 00:00:00'),
(500063, 1063, 'Savings', 15498.00, 'Active', '2025-04-04 00:00:00'),
(500064, 1064, 'Current', 16877.00, 'Active', '2025-04-05 00:00:00'),
(500065, 1065, 'Savings', 18256.00, 'Active', '2025-04-06 00:00:00'),
(500066, 1066, 'Current', 19635.00, 'Frozen', '2025-04-07 00:00:00'),
(500067, 1067, 'Savings', 21014.00, 'Active', '2025-04-08 00:00:00'),
(500068, 1068, 'Current', 22393.00, 'Active', '2025-04-09 00:00:00'),
(500069, 1069, 'Savings', 23772.00, 'Active', '2025-04-10 00:00:00'),
(500070, 1070, 'Current', 25151.00, 'Active', '2025-04-11 00:00:00'),
(500071, 1071, 'Savings', 26530.00, 'Frozen', '2025-04-12 00:00:00'),
(500072, 1072, 'Current', 27909.00, 'Active', '2025-04-13 00:00:00'),
(500073, 1073, 'Savings', 29288.00, 'Active', '2025-04-14 00:00:00'),
(500074, 1074, 'Current', 30667.00, 'Active', '2025-04-15 00:00:00'),
(500075, 1075, 'Savings', 32046.00, 'Active', '2025-04-16 00:00:00'),
(500076, 1076, 'Current', 33425.00, 'Frozen', '2025-04-17 00:00:00'),
(500077, 1077, 'Savings', 34804.00, 'Active', '2025-04-18 00:00:00'),
(500078, 1078, 'Current', 36183.00, 'Active', '2025-04-19 00:00:00'),
(500079, 1079, 'Savings', 37562.00, 'Active', '2025-04-20 00:00:00'),
(500080, 1080, 'Current', 38941.00, 'Active', '2025-04-21 00:00:00'),
(500081, 1081, 'Savings', 40320.00, 'Frozen', '2025-04-22 00:00:00'),
(500082, 1082, 'Current', 41699.00, 'Active', '2025-04-23 00:00:00'),
(500083, 1083, 'Savings', 43078.00, 'Active', '2025-04-24 00:00:00'),
(500084, 1084, 'Current', 44457.00, 'Active', '2025-04-25 00:00:00'),
(500085, 1085, 'Savings', 45836.00, 'Active', '2025-04-26 00:00:00'),
(500086, 1086, 'Current', 47215.00, 'Frozen', '2025-04-27 00:00:00'),
(500087, 1087, 'Savings', 48594.00, 'Active', '2025-04-28 00:00:00'),
(500088, 1088, 'Current', 49973.00, 'Active', '2025-04-29 00:00:00'),
(500089, 1089, 'Savings', 11352.00, 'Active', '2025-04-30 00:00:00'),
(500090, 1090, 'Current', 12731.00, 'Active', '2025-05-01 00:00:00'),
(500091, 1091, 'Savings', 14110.00, 'Frozen', '2025-05-02 00:00:00'),
(500092, 1092, 'Current', 15489.00, 'Active', '2025-05-03 00:00:00'),
(500093, 1093, 'Savings', 16868.00, 'Active', '2025-05-04 00:00:00'),
(500094, 1094, 'Current', 18247.00, 'Active', '2025-05-05 00:00:00'),
(500095, 1095, 'Savings', 19626.00, 'Active', '2025-05-06 00:00:00'),
(500096, 1096, 'Current', 21005.00, 'Frozen', '2025-05-07 00:00:00'),
(500097, 1097, 'Savings', 22384.00, 'Active', '2025-05-08 00:00:00'),
(500098, 1098, 'Current', 23763.00, 'Active', '2025-05-09 00:00:00'),
(500099, 1099, 'Savings', 25142.00, 'Active', '2025-05-10 00:00:00'),
(500100, 1100, 'Current', 26521.00, 'Active', '2025-05-11 00:00:00');


# Understand the customer details 

SELECT
    c.customer_id,
    c.customer_name,
    a.account_id,
    a.account_type,
    a.balance,
    a.status
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id;

# Count the total number of customers

SELECT COUNT(*) AS total_customers
FROM customers;

# How many accounts are Active,Frozen

SELECT status, COUNT(*) AS total
FROM accounts
GROUP BY status;

# Maximum balance of the accounts

SELECT MAX(Balance) AS Highest_Balance
FROM accounts;

# Minimum Balance of the accounts 

SELECT MIN(Balance) AS Lowest_Balance
FROM accounts;

# How many Saving accounts

SELECT COUNT(*) AS No_of_Saving_Account
FROM accounts
WHERE account_type = "Savings";

# How many Current Accounts

SELECT COUNT(*) AS No_of_Current_Account
FROM accounts
WHERE account_type = "Current";

/*
A bank should not allow a customer to deposit or withdraw an amount that is zero or negative.

Task 1: Write a SQL trigger that prevents such a transaction from being inserted into the transactions table.
*/

DELIMITER //

CREATE TRIGGER check_transaction_amount
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN

    IF NEW.amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Transaction amount should be greater than 0';
    END IF;

END //

DELIMITER ;

SELECT * 
FROM transactions;

SELECT *
FROM accounts;

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date, remarks)
VALUES
(900002, 500001, 'Deposit', -5000.00, NOW(), 'Test negative deposit');

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date, remarks)
VALUES
(900001, 500001, 'Deposit', 5000.00, NOW(), 'Test deposit');


/* Task 2: Write a SQL trigger that automatically adds the deposited amount to the corresponding account's 
balance when a new Deposit transaction is inserted into the transactions table. */

DELIMITER //

CREATE TRIGGER Update_Deposit_Transaction
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN

		IF NEW.transaction_type = "Deposit" THEN 
			UPDATE accounts
			SET balance = NEW.amount + balance
			WHERE account_id = NEW.account_id;
		END IF; 

END //

DELIMITER ;

SELECT * 
FROM transactions;

SELECT *
FROM accounts;

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date, remarks)
VALUES
(900002, 500001, 'Deposit', -5000.00, NOW(), 'Negative deposit');

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date, remarks)
VALUES
(900004, 500004, 'Deposit', 5000.00, NOW(), 'Valid deposit');


/*  Task 3: Write a SQL trigger that prevents a withdrawal transaction from being inserted when the withdrawal 
amount is greater than the account's current balance. */

DELIMITER //

CREATE TRIGGER Prevent_Withdrawal_Transaction
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
		DECLARE Current_Balance DECIMAL(12,2);
        
        SELECT Balance
        INTO Current_Balance
        FROM accounts
        WHERE account_id = NEW.account_id;
        
		IF NEW.transaction_type = "Withdrawal" AND 
			Current_Balance < NEW.amount THEN 
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insufficient account balance for this withdrawal';
		END IF;

END //

DELIMITER ;

SELECT account_id, balance				# To check the balance
FROM accounts
WHERE account_id IN (500001, 500002);

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date, remarks)
VALUES
(900010, 500001, 'Withdrawal', 15000.00, NOW(), 'Insufficient balance test');

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date, remarks)
VALUES
(900011, 500001, 'Withdrawal', 5000.00, NOW(), 'Valid withdrawal test');


/* Task 4: Write a SQL trigger that automatically subtracts the withdrawal amount from the corresponding account's 
balance when a new Withdrawal transaction is inserted into the transactions table. */

DELIMITER //

CREATE TRIGGER Update_Withdrawal_Transaction
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN

		IF NEW.transaction_type = "Withdrawal" THEN
			UPDATE  accounts
            SET balance = balance - NEW.amount
            WHERE account_id = NEW.account_id;
		END IF;
	
END //
		
DELIMITER ;				

SELECT * 
FROM transactions;

SELECT *
FROM accounts;

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date, remarks)
VALUES
(900020, 500001, 'Withdrawal', 3000.00, NOW(), 'Valid withdrawal test');

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date, remarks)
VALUES
(900021, 500001, 'Withdrawal', 20000.00, NOW(), 'Invalid withdrawal test');

/*
Task 5: Write a SQL trigger that automatically records every successful Deposit or Withdrawal transaction 
in the transaction_history table.  */

DELIMITER //

CREATE TRIGGER Record_Transaction_History
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN

    IF NEW.transaction_type = 'Deposit' THEN

        INSERT INTO transaction_history
        (
            transaction_id,
            account_id,
            transaction_type,
            amount,
            old_balance,
            new_balance,
            action_time
        )
        SELECT
            NEW.transaction_id,
            NEW.account_id,
            NEW.transaction_type,
            NEW.amount,
            balance - NEW.amount,
            balance,
            NOW()
        FROM accounts
        WHERE account_id = NEW.account_id;

    ELSEIF NEW.transaction_type = 'Withdrawal' THEN

        INSERT INTO transaction_history
        (
            transaction_id,
            account_id,
            transaction_type,
            amount,
            old_balance,
            new_balance,
            action_time
        )
        SELECT
            NEW.transaction_id,
            NEW.account_id,
            NEW.transaction_type,
            NEW.amount,
            balance + NEW.amount,
            balance,
            NOW()
        FROM accounts
        WHERE account_id = NEW.account_id;

    END IF;

END //

DELIMITER ;

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date, remarks)
VALUES
(900030, 500001, 'Deposit', 5000.00, NOW(), 'History deposit test');

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date, remarks)
VALUES
(900031, 500001, 'Withdrawal', 3000.00, NOW(), 'History withdrawal test');

SELECT *
FROM transaction_history;

/* 
Task 6: Write a SQL trigger that prevents a new transaction from being inserted into the transactions 
table when the corresponding account's status is not Active.  */

DELIMITER //

CREATE TRIGGER Prevent_Inactive_Account_Transaction
BEFORE INSERT ON transactions
FOR EACH ROW 
BEGIN 

		DECLARE account_status VARCHAR(20);
        
        SELECT status
        INTO account_status
        FROM accounts
        WHERE account_id = NEW.account_id;

		IF account_status != 'Active' THEN 
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Transaction cannot be processed. Account is not active';
		END IF;

END //

DELIMITER ;

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date, remarks)
VALUES
(900012, 500002, 'Deposit', 5000.00, NOW(), 'Inactive account test');

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date, remarks)
VALUES
(900012, 500005, 'Deposit', 5000.00, NOW(), 'Frozen account test');


/* Task 7: A bank has set a maximum balance limit of ₹1,00,000 for every account. Write a SQL trigger that 
prevents a Deposit transaction from being inserted if the deposit would cause the account 
balance to exceed ₹1,00,000.  */

DELIMITER //

CREATE TRIGGER Prevent_Maximum_Balance
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN

		DECLARE Current_Balance DECIMAL(12,2); 
        
        SELECT balance
        INTO Current_Balance
        FROM accounts
        WHERE account_id = NEW.account_id;
        
        IF NEW.transaction_type = 'Deposit' 
			AND (Current_Balance + NEW.amount) > 100000 THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Deposit cannot be processed. Account balance cannot exceed 100000';
		END IF;
        
END //

DELIMITER ;

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date, remarks)
VALUES
(900014, 500030, 'Deposit', 60000.00, NOW(), 'Maximum balance test');

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date, remarks)
VALUES
(900014, 500004, 'Deposit', 10000.00, NOW(), 'Maximum balance test');


/*
Task 8: A bank should not allow a customer to withdraw more than ₹50,000 in a single transaction. 
Write a BEFORE INSERT trigger that rejects any Withdrawal transaction where the 
amount is greater than ₹50,000. */

DELIMITER //

CREATE TRIGGER Prevent_Large_Withdrawal
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN

    IF NEW.transaction_type = 'Withdrawal'
       AND NEW.amount > 50000 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Withdrawal cannot be processed. Maximum withdrawal limit is 50000';

    END IF;

END //

DELIMITER ;

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date, remarks)
VALUES
(900015, 500001, 'Withdrawal', 60000.00, NOW(), 'Large withdrawal test');


/* Task 9: When a bank account is deleted from the accounts table, the bank must keep a record of the 
deleted account for auditing purposes. Write a SQL trigger that automatically stores the 
deleted account's details in the deleted_accounts table. */

DELIMITER //

CREATE TRIGGER Store_account_Details
AFTER DELETE ON accounts
FOR EACH ROW
BEGIN
       
       INSERT INTO deleted_accounts
    (
        account_id,
        customer_id,
        account_type,
        final_balance,
        account_status,
        deleted_at
    )
    VALUES
    (
        OLD.account_id,
        OLD.customer_id,
        OLD.account_type,
        OLD.balance,
        OLD.status,
        NOW()
    );

END //

DELIMITER ;

INSERT INTO accounts
(account_id, customer_id, account_type, balance, status, created_at)
VALUES
(500010, 1005, 'Savings', 25000.00, 'Active', NOW());


/* Task 10: Prevent deletion of an account with active transactions.
Before deleting an account, check whether it has any related records in the transactions table. 
If transactions exist, prevent the deletion. */

DELIMITER //

CREATE TRIGGER Prevent_Account_Deletion_With_Transactions
BEFORE DELETE ON accounts
FOR EACH ROW
BEGIN
    DECLARE transaction_count INT;

    SELECT COUNT(*)
    INTO transaction_count
    FROM transactions
    WHERE account_id = OLD.account_id;

    IF transaction_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Account cannot be deleted because transactions exist for this account';
    END IF;

END //

DELIMITER ;

DELETE FROM accounts
WHERE account_id = 500001;	

