-- Sample data for BookStoreWarehouse

-- Insert Categories
INSERT INTO dbo.Categories (Name, Description) VALUES
('Фантастика', 'Научная фантастика, фэнтези'),
('Детективы', 'Криминальные романы и детективы'),
('Романтика', 'Любовные романы'),
('История', 'Исторические повествования'),
('Детская литература', 'Книги для детей'),
('Учебная литература', 'Учебники и справочники'),
('Биография', 'Биографии известных людей'),
('Развитие личности', 'Самопомощь и саморазвитие');

-- Insert Authors
INSERT INTO dbo.Authors (Name, Biography, Country) VALUES
('Аркадий и Борис Стругацкие', 'Советские писатели-фантасты', 'Россия'),
('Агата Кристи', 'Британская писательница, королева детектива', 'Великобритания'),
('Лев Толстой', 'Великий русский писатель', 'Россия'),
('Джоан Роулинг', 'Создатель Гарри Поттера', 'Великобритания'),
('Александр Дюма', 'Французский писатель эпохи романтизма', 'Франция'),
('Федор Достоевский', 'Выдающийся русский писатель', 'Россия'),
('Исаак Азимов', 'Американский писатель-фантаст', 'США'),
('Виктор Гюго', 'Французский писатель и поэт', 'Франция');

-- Insert Publishers
INSERT INTO dbo.Publishers (Name, Country, Email, Phone) VALUES
('Издательство Мир', 'Россия', 'info@mir.ru', '+7-495-123-45-67'),
('ЭКСМО', 'Россия', 'info@exmo.ru', '+7-495-234-56-78'),
('Penguin Books', 'Великобритания', 'info@penguin.co.uk', '+44-207-123-4567'),
('Macmillan Publishers', 'США', 'info@macmillan.com', '+1-646-307-5151'),
('Азбука', 'Россия', 'info@azbyka.ru', '+7-812-345-67-89'),
('Альпина Паблишер', 'Россия', 'info@alpinabook.ru', '+7-495-567-89-01');

-- Insert Books
INSERT INTO dbo.Books (ISBN, Title, AuthorId, PublisherId, CategoryId, PublicationYear, Pages, Language, Description, Price, CoverImageUrl) VALUES
('978-5-17-070490-4', 'Понедельник начинается в субботу', 1, 1, 1, 1965, 320, 'Русский', 'Фантастический роман о научном институте будущего', 450.00, 'https://example.com/book1.jpg'),
('978-5-17-075555-5', 'Война и мир', 3, 1, 4, 1869, 1200, 'Русский', 'Эпический роман о войне 1812 года', 890.00, 'https://example.com/book2.jpg'),
('978-0-00-711933-4', 'Десять негритят', 2, 3, 2, 1939, 272, 'Русский', 'Классический детективный роман', 520.00, 'https://example.com/book3.jpg'),
('978-5-17-077133-3', 'Гарри Поттер и философский камень', 4, 2, 5, 1997, 432, 'Русский', 'Первая книга о волшебнике Гарри Поттере', 380.00, 'https://example.com/book4.jpg'),
('978-5-17-070486-7', 'Граф Монте-Кристо', 5, 1, 3, 1844, 756, 'Русский', 'Романтический приключенческий роман', 620.00, 'https://example.com/book5.jpg'),
('978-5-17-076095-3', 'Преступление и наказание', 6, 5, 2, 1866, 672, 'Русский', 'Психологический роман о преступлении', 580.00, 'https://example.com/book6.jpg'),
('978-0-553-29438-0', 'Основание', 7, 3, 1, 1951, 255, 'Русский', 'Фундаментальная научно-фантастическая трилогия', 650.00, 'https://example.com/book7.jpg'),
('978-5-17-074992-6', 'Отверженные', 8, 1, 4, 1862, 1463, 'Русский', 'Великий исторический роман', 950.00, 'https://example.com/book8.jpg');

-- Insert Warehouse data
INSERT INTO dbo.Warehouse (BookId, QuantityInStock, MinimumStock, MaximumStock, LastRestockDate) VALUES
(1, 150, 5, 500, GETUTCDATE()),
(2, 45, 5, 300, GETUTCDATE()),
(3, 200, 10, 600, GETUTCDATE()),
(4, 320, 20, 800, GETUTCDATE()),
(5, 78, 5, 400, GETUTCDATE()),
(6, 92, 5, 400, GETUTCDATE()),
(7, 55, 5, 300, GETUTCDATE()),
(8, 38, 5, 250, GETUTCDATE());

-- Insert Users
INSERT INTO dbo.Users (Username, Email, PasswordHash, FirstName, LastName, Role, IsActive) VALUES
('admin', 'admin@bookstore.ru', '$2a$11$...', 'Администратор', 'Системы', 'Admin', 1),
('warehouse_user', 'warehouse@bookstore.ru', '$2a$11$...', 'Иван', 'Складской', 'Warehouse', 1),
('customer_user', 'customer@bookstore.ru', '$2a$11$...', 'Петр', 'Покупатель', 'Customer', 1),
('manager', 'manager@bookstore.ru', '$2a$11$...', 'Мария', 'Менеджер', 'Admin', 1);

-- Insert Sample Transactions
INSERT INTO dbo.Transactions (BookId, TransactionType, Quantity, UserId, Notes, TransactionDate) VALUES
(1, 'Income', 150, 2, 'Приход товара от издателя', DATEADD(DAY, -30, GETUTCDATE())),
(2, 'Outcome', 5, 2, 'Отпуск товара на продажу', DATEADD(DAY, -20, GETUTCDATE())),
(3, 'Income', 200, 2, 'Поставка новой партии', DATEADD(DAY, -15, GETUTCDATE())),
(4, 'Outcome', 10, 2, 'Продажа через интернет', DATEADD(DAY, -10, GETUTCDATE())),
(5, 'Income', 100, 2, 'Восполнение остатков', DATEADD(DAY, -5, GETUTCDATE()));

-- Insert Sample Orders
DECLARE @OrderDate DATETIME2 = GETUTCDATE();

INSERT INTO dbo.Orders (OrderNumber, UserId, OrderDate, TotalAmount, Status, ShippingAddress, ShippingCity, ShippingPostalCode) VALUES
('ORD-2024-001', 3, @OrderDate, 1030.00, 'Delivered', 'ул. Пушкина, 10', 'Москва', '119991'),
('ORD-2024-002', 3, DATEADD(DAY, -5, @OrderDate), 520.00, 'Processing', 'ул. Ленина, 5', 'Санкт-Петербург', '190121'),
('ORD-2024-003', 3, DATEADD(DAY, -10, @OrderDate), 2145.00, 'Shipped', 'пр. Невский, 25', 'Санкт-Петербург', '191025');

-- Insert Order Items
INSERT INTO dbo.OrderItems (OrderId, BookId, Quantity, UnitPrice, Subtotal) VALUES
(1, 1, 1, 450.00, 450.00),
(1, 3, 1, 520.00, 520.00),
(2, 3, 1, 520.00, 520.00),
(3, 2, 1, 890.00, 890.00),
(3, 5, 1, 620.00, 620.00),
(3, 7, 1, 650.00, 650.00);

PRINT 'Sample data inserted successfully!';