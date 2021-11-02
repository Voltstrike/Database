Use Tstore

INSERT INTO [Staff] VALUES 
('ST001','Andi','Jakarta','081234567890','Male','andi@gmail.com','4000000'),
('ST002','Andika','Jakarta','082374569284','Male','andika@gmail.com','5000000'),
('ST003','Andita','Jakarta','087365450978','Female','andita@gmail.com','6000000'),
('ST004','Anin','Jakarta','08877980345','Female','anin@gmail.com','7000000'),
('ST005','Ayu','Jakarta','0809867439873','Female','ayu@gmail.com','4000000'),
('ST006','Ayuka','Jakarta','0889875602846','Female','ayuka@gmail.com','6000000'),
('ST007','Anita','Jakarta','088739850238','Female','anita@gmail.com','6000000'),
('ST008','Mawar','Jakarta','089376458734','Female','mawar@gmail.com','9000000'),
('ST009','Sekar','Jakarta','089874358745','Female','sekar@gmail.com','4000000'),
('ST010','Mulia','Jakarta','089834784509','Female','mulia@gmail.com','7000000')



INSERT INTO [Vendor] VALUES
('VE001','Andra','Jakarta','083465348932','andra@gmail.com'),
('VE002','Alex','Jakarta','083948573524','andra@gmail.com'),
('VE003','Axel','Jakarta','088973456987','andra@gmail.com'),
('VE004','Lodra','Jakarta','089878772742','andra@gmail.com'),
('VE005','Widjaya','Jakarta','088745673467','andra@gmail.com'),
('VE006','Anna','Jakarta','088974650356','anna@gmail.com'),
('VE007','Ninna','Jakarta','089946857360','ninna@gmail.com'),
('VE008','Vivi','Jakarta','089018847543','vivi@gmail.com'),
('VE009','Bella','Jakarta','089384758934','bella@gmail.com'),
('VE010','Anisa','Jakarta','080197847532','anisa@gmail.com')




INSERT INTO [Customer] VALUES

('CU001','Anton','Medan','088793851298','Male','anton@gmail.com'),
('CU002','Budi','Medan','089864793490','Male','budi@gmail.com'),
('CU003','Imam','Bandung','08778308812','Male','imam@gmail.com'),
('CU004','Indah','Sulawesi','0834871295','Female','indah@gmail.com'),
('CU005','Permata','Jawa','087856871320','Female','permata@gmail.com'),
('CU006','Putra','Jakarta','083249857375','Male','putra@gmail.com'),
('CU007','Anji','Jakarta','089032847563','Male','anij@gmail.com'),
('CU008','Ari','Jakarta','081290347853','Male','ari@gmail.com'),
('CU009','Zeldon','Jakarta','089182748974','Male','zeldon@gmail.com'),
('CU010','Popi','Jakarta','080981324543','Male','popi@gmail.com')


INSERT INTO [Category] VALUES

('CA001','Kemeja'),
('CA002','Celana Panjang'),
('CA003','Celana Pendek'),
('CA004','Kaos'),
('CA005','Kaos kaki'),
('CA006','Sepatu'),
('CA007','Jaket'),
('CA008','Sandal'),
('CA009','Topi'),
('CA010','Ikat Pinggang')

INSERT INTO [SalesTransaction] VALUES
('SA001','ST001','CU001','2020-10-11 10:00:00','CL002','4'),
('SA002','ST002','CU001','2020-10-10 11:00:00','CL001','3'),
('SA003','ST003','CU001','2020-10-09 12:00:00','CL003','2'),
('SA004','ST005','CU003','2020-10-13 13:00:00','CL005','1'),
('SA005','ST006','CU002','2020-10-14 14:00:00','CL004','1'),
('SA006','ST002','CU004','2020-10-15 15:00:00','CL007','1'),
('SA007','ST003','CU005','2020-10-16 16:00:00','CL009','2'),
('SA008','ST001','CU006','2020-10-17 17:00:00','CL006','4'),
('SA009','ST004','CU007','2020-10-18 18:00:00','CL010','5'),
('SA010','ST006','CU008','2020-10-19 19:00:00','CL008','6'),
('SA011','ST007','CU009','2020-10-20 08:00:00','CL014','7'),
('SA012','ST008','CU010','2020-10-11 09:00:00','CL011','2'),
('SA013','ST009','CU010','2020-10-08 10:00:00','CL012','3'),
('SA014','ST010','CU002','2020-10-06 10:00:00','CL015','4'),
('SA015','ST010','CU001','2020-10-23 12:00:00','CL013','5')

INSERT INTO [PurchaseTransaction] VALUES
('PU001','ST001','VE001','2020-10-11 10:00:00','CL001','4'),
('PU002','ST002','VE001','2020-10-10 11:00:00','CL003','3'),
('PU003','ST003','VE001','2020-10-09 12:00:00','CL002','2'),
('PU004','ST005','VE003','2020-10-13 13:00:00','CL005','1'),
('PU005','ST006','VE002','2020-10-14 14:00:00','CL004','1'),
('PU006','ST002','VE004','2020-10-15 15:00:00','CL008','1'),
('PU007','ST003','VE005','2020-10-16 16:00:00','CL007','2'),
('PU008','ST001','VE006','2020-10-17 17:00:00','CL006','4'),
('PU009','ST004','VE007','2020-10-18 18:00:00','CL010','5'),
('PU010','ST006','VE008','2020-10-19 19:00:00','CL015','6'),
('PU011','ST007','VE009','2020-10-20 08:00:00','CL011','7'),
('PU012','ST008','VE010','2020-10-11 09:00:00','CL012','2'),
('PU013','ST009','VE010','2020-10-08 10:00:00','CL014','3'),
('PU014','ST010','VE002','2020-10-06 10:00:00','CL009','4'),
('PU015','ST010','VE001','2020-10-23 12:00:00','CL013','5')

INSERT INTO [Cloth] VALUES 
('CL001','Gucci','9000000','CA001','100'),
('CL002','Balenciaga','11000000','CA002','100'),
('CL003','H&M','1000000','CA003','100'),
('CL004','AirJordan','9000000','CA004','100'),
('CL005','Pull&Bear','4000000','CA005','100'),
('CL006','Uniqlo','7000000','CA006','100'),
('CL007','Nike','10000000','CA007','100'),
('CL008','Adidas','9000000','CA009','100'),
('CL009','UnderArmour','8000000','CA008','100'),
('CL010','LouisVuitton','7000000','CA002','100'),
('CL011','Dior','6000000','CA003','100'),
('CL012','BathingApe','5000000','CA005','100'),
('CL013','Supreme','4000000','CA007','100'),
('CL014','OffWhite','3000000','CA006','100'),
('CL015','CDG','2000000','CA001','100')

INSERT INTO [PurchaseTransaction_vendor] VALUES
('PU001','CL001',4),
('PU001','CL002',5),
('PU001','CL003',3),
('PU001','CL004',2),
('PU001','CL005',5),
('PU001','CL006',6),
('PU001','CL007',7),
('PU002','CL001',9),
('PU002','CL003',1),
('PU002','CL004',3),
('PU002','CL007',2),
('PU002','CL009',5),
('PU003','CL001',6),
('PU004','CL003',8),
('PU005','CL002',9),
('PU006','CL004',2),
('PU007','CL005',3),
('PU008','CL006',5),
('PU009','CL007',6),
('PU010','CL008',2),
('PU011','CL009',3),
('PU012','CL010',1),
('PU013','CL010',6),
('PU014','CL002',7),
('PU015','CL001',9)


INSERT INTO [SalesTransaction_Customer] VALUES

('SA001','CL001',3),
('SA001','CL002',5),
('SA001','CL003',6),
('SA001','CL004',7),
('SA001','CL005',1),
('SA001','CL006',6),
('SA001','CL007',7),
('SA001','CL008',9),
('SA001','CL009',2),
('SA001','CL010',4),
('SA003','CL006',5),
('SA002','CL001',2),
('SA003','CL001',1),
('SA004','CL003',2),
('SA005','CL002',5),
('SA006','CL004',2),
('SA007','CL005',3),
('SA008','CL006',5),
('SA009','CL007',1),
('SA010','CL008',9),
('SA011','CL009',7),
('SA012','CL010',3),
('SA013','CL010',1),
('SA014','CL002',2),
('SA015','CL001',3)

