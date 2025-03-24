# Frogogo Cart Test

## Stack
- Ruby 3.4.2
- Rails 8
- Hotwire, Turbo, Stimulus
- View Components
- Tailwind CSS (v4)
- Vite Ruby
- PostgreSQL 17
- Use Shore as template for quick start project

## Models and relations
- **Product**  
  *Связи*: имеет many `picked_products`, many attached `images`, many `stocks`  
  *Атрибуты*: name

- **Stock**  
  *Связи*: принадлежит Product
  *Атрибуты*: price, quantity

- **PickedProduct**  
  *Связи*: принадлежит Product, принадлежит Cart (опционально, touch: true)  
  *Атрибуты*: quantity

- **Cart**  
  *Связи*: имеет many `picked_products`, через них – many `products`, имеет one полиморфную Discount  

- **Discount**  
  *Связи*: принадлежит полиморфному объекту (discountable)
  *Атрибуты*: price_limit

Данные для приложения заполняются с помощью сидов: rails db:seed
Так же после очистки корзины доступна кнопка для перезагрузки данных.

## Cart controller
Контроллер `CartsController` содержит следующие действия:
- **show** – отображение страницы корзины с использованием View Components
- **update_quantity** – обновление количества товаров в корзине по ajax запросу (Turbo Streams)
- **remove_product** – удаление товара из корзины с последующим обновлением offer-компонента
- **clear** – очистка всех товаров в корзине и обновление страницы

## Frontend
- **View Components**  
  Используются следующие категории для композиции интерфейса приложения:
    - `Navigation` – для хэдера и других элементов навигации
    - `Pages` – для компонентов страниц
    - `Products` – для переиспользуемых компонентов продуктов
    - `Shared` – для базовых компонентов

- **Stimulus контроллеры**
    - `update_quantity_controller.js` – обновление количества товара (инкремент, декремент, отправка формы)
    - `range_slider_controller.js` – управление слайдером скидки и пересчёт итоговой стоимости заказа

- **Helpers**
  В файле `application_helper.rb` реализованы:
    - Метод для склонения слова "товар" в зависимости от количества
    - Метод форматирования цены

## Tests
Тесты покрывают ключевые сценарии работы корзины:
- Изменение количества товара (проверяется пересчёт общей стоимости и запись в БД)
- Применение скидки (пересчёт итоговой стоимости с учетом скидки)
- Удаление товара (удаление записи в БД и обновление страницы)
- Очистка корзины (удаление всех записей в БД и обновление страницы)