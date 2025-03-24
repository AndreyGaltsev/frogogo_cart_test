require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  setup do
    @product = Product.create!(name: "Test Product")
    @product_id = @product.id
    Stock.create!(product: @product, price: 100, quantity: 10)
    @cart = Cart.create!
    @picked_product = @cart.picked_products.create!(product: @product, quantity: 1)
    Discount.create!(discountable: @cart, price_limit: 50)
  end

  test "обновление количества товара меняет итоговую стоимость и quantity в БД" do
    visit cart_path
    assert_text "100"
    assert_equal 1, @picked_product.reload.quantity
    find("button[data-action='click->update-quantity#increment']").click
    assert_text "200"
    assert_equal 2, @picked_product.reload.quantity
  end


  test "применение скидки уменьшает итоговую стоимость" do
    visit cart_path
    assert_text "100"
    slider = find("input[type='range']")
    execute_script("arguments[0].value = 20;", slider)
    page.execute_script("arguments[0].dispatchEvent(new Event('input', { bubbles: true }));", slider.native)
    assert_text "80"
  end

  test "удаление товара обновляет итоговую стоимость и запись о товаре удалена из БД" do
    visit cart_path
    assert_text "100"
    within("turbo-frame#cart-card-#{@product_id}") do
      find("form button[type='submit']").click
    end
    assert_text "В корзине нет товаров"
    assert_nil PickedProduct.find_by(id: @picked_product.id)

  end

  test "очистка корзины удаляет все товары" do
    visit cart_path
    assert_text "Очистить корзину"
    click_on "Очистить корзину"
    assert_text "В корзине нет товаров"
    assert_predicate @cart.reload.picked_products, :empty?
  end
end
