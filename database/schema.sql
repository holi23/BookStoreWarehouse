-- BookStoreWarehouse Database Schema
-- SQL Server 2019+

-- Drop existing tables if they exist
IF OBJECT_ID('dbo.OrderItems', 'U') IS NOT NULL DROP TABLE dbo.OrderItems;
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.Transactions', 'U') IS NOT NULL DROP TABLE dbo.Transactions;
IF OBJECT_ID('dbo.Warehouse', 'U') IS NOT NULL DROP TABLE dbo.Warehouse;
IF OBJECT_ID('dbo.Books', 'U') IS NOT NULL DROP TABLE dbo.Books;
IF OBJECT_ID('dbo.Authors', 'U') IS NOT NULL DROP TABLE dbo.Authors;
IF OBJECT_ID('dbo.Publishers', 'U') IS NOT NULL DROP TABLE dbo.Publishers;
IF OBJECT_ID('dbo.Categories', 'U') IS NOT NULL DROP TABLE dbo.Categories;
IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL DROP TABLE dbo.Users;

-- Create Categories table
CREATE TABLE dbo.Categories
(
    CategoryId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(500),
    CreatedAt DATETIME2 DEFAULT GETUTCDATE()
);

-- Create Authors table
CREATE TABLE dbo.Authors
(
    AuthorId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(200) NOT NULL,
    Biography NVARCHAR(MAX),
    Country NVARCHAR(100),
    CreatedAt DATETIME2 DEFAULT GETUTCDATE()
);

-- Create Publishers table
CREATE TABLE dbo.Publishers
(
    PublisherId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(200) NOT NULL UNIQUE,
    Country NVARCHAR(100),
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    CreatedAt DATETIME2 DEFAULT GETUTCDATE()
);

-- Create Books table
CREATE TABLE dbo.Books
(
    BookId INT PRIMARY KEY IDENTITY(1,1),
    ISBN NVARCHAR(20) UNIQUE NOT NULL,
    Title NVARCHAR(300) NOT NULL,
    AuthorId INT NOT NULL,
    PublisherId INT NOT NULL,
    CategoryId INT NOT NULL,
    PublicationYear INT,
    Pages INT,
    Language NVARCHAR(50) DEFAULT 'Русский',
    Description NVARCHAR(MAX),
    Price DECIMAL(10, 2) NOT NULL,
    CoverImageUrl NVARCHAR(500),
    CreatedAt DATETIME2 DEFAULT GETUTCDATE(),
    UpdatedAt DATETIME2 DEFAULT GETUTCDATE(),
    CONSTRAINT FK_Books_Authors FOREIGN KEY (AuthorId) REFERENCES dbo.Authors(AuthorId),
    CONSTRAINT FK_Books_Publishers FOREIGN KEY (PublisherId) REFERENCES dbo.Publishers(PublisherId),
    CONSTRAINT FK_Books_Categories FOREIGN KEY (CategoryId) REFERENCES dbo.Categories(CategoryId)
);

-- Create Warehouse table (остатки на складе)
CREATE TABLE dbo.Warehouse
(
    WarehouseId INT PRIMARY KEY IDENTITY(1,1),
    BookId INT NOT NULL UNIQUE,
    QuantityInStock INT DEFAULT 0,
    MinimumStock INT DEFAULT 5,
    MaximumStock INT DEFAULT 1000,
    LastRestockDate DATETIME2,
    UpdatedAt DATETIME2 DEFAULT GETUTCDATE(),
    CONSTRAINT FK_Warehouse_Books FOREIGN KEY (BookId) REFERENCES dbo.Books(BookId) ON DELETE CASCADE
);

-- Create Users table
CREATE TABLE dbo.Users
(
    UserId INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(100) NOT NULL UNIQUE,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Role NVARCHAR(50) DEFAULT 'User', -- 'Admin', 'Warehouse', 'Customer'
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME2 DEFAULT GETUTCDATE(),
    LastLogin DATETIME2,
    UpdatedAt DATETIME2 DEFAULT GETUTCDATE()
);

-- Create Transactions table (история приходов/расходов)
CREATE TABLE dbo.Transactions
(
    TransactionId INT PRIMARY KEY IDENTITY(1,1),
    BookId INT NOT NULL,
    TransactionType NVARCHAR(50) NOT NULL, -- 'Income', 'Outcome', 'Return'
    Quantity INT NOT NULL,
    UserId INT NOT NULL,
    Notes NVARCHAR(500),
    TransactionDate DATETIME2 DEFAULT GETUTCDATE(),
    CONSTRAINT FK_Transactions_Books FOREIGN KEY (BookId) REFERENCES dbo.Books(BookId),
    CONSTRAINT FK_Transactions_Users FOREIGN KEY (UserId) REFERENCES dbo.Users(UserId)
);

-- Create Orders table (заказы клиентов)
CREATE TABLE dbo.Orders
(
    OrderId INT PRIMARY KEY IDENTITY(1,1),
    OrderNumber NVARCHAR(50) NOT NULL UNIQUE,
    UserId INT NOT NULL,
    OrderDate DATETIME2 DEFAULT GETUTCDATE(),
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status NVARCHAR(50) DEFAULT 'Pending', -- 'Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled'
    ShippingAddress NVARCHAR(500),
    ShippingCity NVARCHAR(100),
    ShippingPostalCode NVARCHAR(20),
    DeliveryDate DATETIME2,
    Notes NVARCHAR(MAX),
    CreatedAt DATETIME2 DEFAULT GETUTCDATE(),
    UpdatedAt DATETIME2 DEFAULT GETUTCDATE(),
    CONSTRAINT FK_Orders_Users FOREIGN KEY (UserId) REFERENCES dbo.Users(UserId)
);

-- Create OrderItems table (позиции в заказах)
CREATE TABLE dbo.OrderItems
(
    OrderItemId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT NOT NULL,
    BookId INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (OrderId) REFERENCES dbo.Orders(OrderId) ON DELETE CASCADE,
    CONSTRAINT FK_OrderItems_Books FOREIGN KEY (BookId) REFERENCES dbo.Books(BookId)
);

-- Create Indexes for performance
CREATE INDEX IX_Books_AuthorId ON dbo.Books(AuthorId);
CREATE INDEX IX_Books_PublisherId ON dbo.Books(PublisherId);
CREATE INDEX IX_Books_CategoryId ON dbo.Books(CategoryId);
CREATE INDEX IX_Books_ISBN ON dbo.Books(ISBN);
CREATE INDEX IX_Transactions_BookId ON dbo.Transactions(BookId);
CREATE INDEX IX_Transactions_UserId ON dbo.Transactions(UserId);
CREATE INDEX IX_Transactions_Date ON dbo.Transactions(TransactionDate);
CREATE INDEX IX_Orders_UserId ON dbo.Orders(UserId);
CREATE INDEX IX_Orders_Status ON dbo.Orders(Status);
CREATE INDEX IX_Orders_Date ON dbo.Orders(OrderDate);
CREATE INDEX IX_OrderItems_BookId ON dbo.OrderItems(BookId);

PRINT 'Database schema created successfully!';