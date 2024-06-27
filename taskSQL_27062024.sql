Create Database LibraryDB

Use LibraryDB


Create Table Authors 
(
Id int Primary Key,
Name Nvarchar(100),
Surname Nvarchar(100)
)


Create Table Books 
(
Id int Primary Key,
Name Nvarchar(100),
AuthorId int,
PageCount int,
CostPrice decimal(18, 2),
SalePrice decimal(18, 2),
Foreign Key (AuthorId) References Authors(Id)
)


Create Table Tags (
Id int Primary Key,
Name Nvarchar(100)
)


Create Table BooksTags (
BookId int,
TagId int,
Primary Key (BookId, TagId),
Foreign Key (BookId) References Books(Id),
Foreign Key (TagId) References Tags(Id)
)


Insert into Authors (Id, Name, Surname)
Values
(1, 'Friedrich', 'Wilhelm Nietzsche'),
(2, 'Franz', 'Kafka'),
(3, 'Carl', 'Gustaw Jung'),
(4,'Elxan', 'Zeynalli')


Insert into Books (Id, Name, AuthorId, PageCount, CostPrice, SalePrice)
Values
 (1, 'Antixrist', 1, 108, 10.00, 25.00),
 (2, 'Bele Buyurdu Zerdust', 1, 340, 15.00, 30.00),
 (3, 'Cevrilme', 2, 104, 8.00, 12.00),
 (4, 'Psixologiya ve Felsefe', 3, 143, 12.00, 30.00),
 (5, 'Art ve Xaos', 4, 340, 15.00, 30.00)
   

Insert into Tags (Id, Name)
Values
(1, 'Featured'),
(2, 'New'),
(3, 'Best Seller'),
(4, 'Felsefe'),
(5, 'Roman')


Insert into BooksTags (BookId, TagId)
Values
(1, 1),
(2, 1),
(3, 2), 
(4, 1),
(5, 2),
(1, 4),
(2, 4),
(3, 5), 
(4, 5)



Select b.Id as BookId,
(a.Name + '' + a.Surname) as AuthorFullName, b.Name as BookName, b.SalePrice as BookPrice, b.PageCount,t.Name as TagName From Books b
Inner Join Authors a on b.AuthorId = a.Id
Inner Join BooksTags bt on b.Id = bt.BookId
Inner Join Tags t on bt.TagId = t.Id;







