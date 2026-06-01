# 🔧 Установка всех компонентов

## ✅ Что уже готово на GitHub:

1. ✅ Структура проекта
2. ✅ Схема базы данных (SQL)
3. ✅ Примеры данных
4. ✅ Полная документация
5. ✅ Конфигурационные файлы

---

## 🎯 Следующие шаги для разработки:

### 1️⃣ Клонируйте репозиторий

```bash
git clone https://github.com/holi23/BookStoreWarehouse.git
cd BookStoreWarehouse
```

### 2️⃣ Создайте проекты .NET

#### API (ASP.NET Core)
```bash
cd src
dotnet new webapi -n BookStoreWarehouse.API -f net8.0
cd BookStoreWarehouse.API
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.AspNetCore.Authentication.JwtBearer
dotnet add package Swashbuckle.AspNetCore
```

#### Desktop App (WPF)
```bash
cd ../
dotnet new wpf -n BookStoreWarehouse.DesktopApp -f net8.0-windows
cd BookStoreWarehouse.DesktopApp
dotnet add package RestSharp
dotnet add package CommunityToolkit.Mvvm
```

#### Website (Blazor)
```bash
cd ../
dotnet new blazorwasm -n BookStoreWarehouse.Website -f net8.0
cd BookStoreWarehouse.Website
dotnet add package HttpClientInterceptor
```

### 3️⃣ Создайте базу данных

```bash
# Откройте SQL Server Management Studio
# Запустите database/schema.sql
# Затем database/seed-data.sql
```

### 4️⃣ Запустите проекты

```bash
# Терминал 1 - API
cd src/BookStoreWarehouse.API
dotnet run

# Терминал 2 - Website
cd src/BookStoreWarehouse.Website
dotnet run

# Терминал 3 - Desktop App
cd src/BookStoreWarehouse.DesktopApp
dotnet run
```

---

## 📝 Основные файлы для редактирования:

### API
- `src/BookStoreWarehouse.API/Program.cs` - Конфигурация приложения
- `src/BookStoreWarehouse.API/appsettings.json` - Строка подключения к БД
- `src/BookStoreWarehouse.API/Controllers/` - Создайте контроллеры

### Website
- `src/BookStoreWarehouse.Website/Program.cs` - Конфигурация
- `src/BookStoreWarehouse.Website/Pages/` - Создайте страницы

### Desktop App
- `src/BookStoreWarehouse.DesktopApp/MainWindow.xaml` - Главное окно
- `src/BookStoreWarehouse.DesktopApp/MainWindow.xaml.cs` - Логика

---

## 🗄️ Миграции Entity Framework (для API)

```bash
cd src/BookStoreWarehouse.API

# Создать миграцию
dotnet ef migrations add InitialCreate

# Применить к БД
dotnet ef database update
```

---

## 📚 Полезные команды

```bash
# Восстановить все NuGet пакеты
dotnet restore

# Очистить и пересобрать
dotnet clean
dotnet build

# Запустить тесты (когда создадите)
dotnet test

# Опубликовать проект
dotnet publish -c Release
```

---

## 🔗 Ссылки на документацию

- [API Documentation](docs/API_DOCUMENTATION.md)
- [Database Schema](docs/DATABASE_SCHEMA.md)
- [User Manual](docs/USER_MANUAL.md)
- [Setup Guide](docs/SETUP_GUIDE.md)
- [Architecture](docs/ARCHITECTURE.md)
- [Testing](docs/TESTING.md)

---

## 💡 Советы

✅ Используйте Visual Studio 2022 для лучшего опыта  
✅ Регулярно коммитьте в Git  
✅ Пишите unit-тесты для сервисов  
✅ Используйте Swagger для API документации  
✅ Тестируйте API с Postman перед интеграцией с UI  

---

**Готовы начать? Удачи в разработке! 🚀**