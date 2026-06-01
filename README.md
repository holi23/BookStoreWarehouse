# 📚 BookStoreWarehouse - Система учета товаров на складе книжного магазина

## 📖 Описание проекта

Дипломный проект - интегрированная система для управления товарами на складе книжного магазина с веб-интеграцией для клиентов.

### Основные компоненты:

1. **ASP.NET Core API** - Backend, обработка бизнес-логики
2. **WPF Desktop App** - Приложение для работников склада
3. **Blazor Website** - Веб-сайт для покупателей
4. **SQL Server** - База данных

---

## 🛠️ Технологический стек

| Компонент | Технология | Версия |
|-----------|-----------|--------|
| Backend | ASP.NET Core | 8.0 |
| Desktop | WPF (.NET) | 8.0 |
| Website | Blazor WebAssembly | 8.0 |
| ORM | Entity Framework Core | 8.0 |
| Database | SQL Server | 2019+ |
| Language | C# | 12.0 |

---

## 📁 Структура проекта

```
BookStoreWarehouse/
├── src/
│   ├── BookStoreWarehouse.API/              # ASP.NET Core API
│   │   ├── Controllers/
│   │   ├── Models/
│   │   ├── Services/
│   │   ├── Data/
│   │   ├── Migrations/
│   │   ├── appsettings.json
│   │   └── Program.cs
│   │
│   ├── BookStoreWarehouse.DesktopApp/       # WPF приложение для склада
│   │   ├── Views/
│   │   ├── ViewModels/
│   │   ├── Services/
│   │   ├── Models/
│   │   └── MainWindow.xaml
│   │
│   ├── BookStoreWarehouse.Website/          # Blazor веб-сайт
│   │   ├── Pages/
│   │   ├── Components/
│   │   ├── Services/
│   │   ├── Models/
│   │   └── Program.cs
│   │
│   └── BookStoreWarehouse.Shared/           # Общие модели
│       ├── DTOs/
│       ├── Entities/
│       └── Constants/
│
├── database/
│   ├── schema.sql                           # Схема БД
│   └── seed-data.sql                        # Примеры данных
│
├── docs/
│   ├── API_DOCUMENTATION.md
│   ├── DATABASE_SCHEMA.md
│   ├── SETUP_GUIDE.md
│   └── USER_MANUAL.md
│
└── .gitignore
```

---

## 🚀 Быстрый старт

### Предварительные требования:
- Visual Studio 2022+ или VS Code
- .NET 8.0 SDK
- SQL Server 2019+ (или SQL Server Express)
- Git

### Установка:

1. **Клонируем репозиторий:**
```bash
git clone https://github.com/holi23/BookStoreWarehouse.git
cd BookStoreWarehouse
```

2. **Восстанавливаем NuGet пакеты:**
```bash
dotnet restore
```

3. **Создаем БД и миграции:**
```bash
cd src/BookStoreWarehouse.API
dotnet ef database update
```

4. **Запускаем API:**
```bash
dotnet run
# API будет доступна на https://localhost:5001
```

5. **В отдельном терминале запускаем веб-сайт:**
```bash
cd src/BookStoreWarehouse.Website
dotnet run
# Сайт: https://localhost:5002
```

6. **Запускаем Desktop приложение:**
```bash
cd src/BookStoreWarehouse.DesktopApp
dotnet run
```

---

## 📊 Основная функциональность

### API (Backend):
- ✅ CRUD операции с товарами
- ✅ Управление категориями и авторами
- ✅ Отслеживание остатков на складе
- ✅ История приходов/расходов
- ✅ Управление заказами
- ✅ Аутентификация и авторизация

### Desktop App (Склад):
- ✅ Добавление/удаление товара
- ✅ Отслеживание остатков в реальном времени
- ✅ Приём товара от поставщиков
- ✅ Отпуск товара на продажу
- ✅ Поиск и фильтрация
- ✅ Печать этикеток/отчетов

### Website (Веб-сайт):
- ✅ Каталог книг с фильтрацией
- ✅ Поиск по названию, автору, категории
- ✅ Корзина покупок
- ✅ Оформление заказа
- ✅ История заказов (личный кабинет)
- ✅ Синхронизация остатков со складом

---

## 🗄️ База данных

### Основные таблицы:
- **Books** - Книги (название, автор, издатель, цена)
- **Categories** - Категории книг
- **Authors** - Авторы
- **Publishers** - Издатели
- **Warehouse** - Остатки на складе
- **Transactions** - Приход/расход товара
- **Orders** - Заказы клиентов
- **OrderItems** - Позиции в заказах
- **Users** - Пользователи системы

---

## 📚 Документация

- [API Documentation](docs/API_DOCUMENTATION.md) - Описание всех API endpoints
- [Database Schema](docs/DATABASE_SCHEMA.md) - Схема БД с связями
- [Setup Guide](docs/SETUP_GUIDE.md) - Подробная установка
- [User Manual](docs/USER_MANUAL.md) - Руководство пользователя

---

## 👤 Автор

**holi23** - Дипломный проект

---

## 📝 Лицензия

MIT License - свободное использование в образовательных целях

---

## 📞 Поддержка

По вопросам о проекте - создавайте Issues на GitHub
