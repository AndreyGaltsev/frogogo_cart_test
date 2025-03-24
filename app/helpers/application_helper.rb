module ApplicationHelper
  def product_count_text(count)
    product_word_forms = %w[товар товара товаров]
    "#{count} #{declension(count, product_word_forms)} на сумму"
  end

  def format_price(price)
    whole, decimal = price.to_s.split(".")
    formatted_whole = whole.reverse.gsub(/(\d{3})(?=\d)/, '\1 ').reverse

    if decimal
      "#{formatted_whole},#{decimal}"
    else
      formatted_whole
    end
  end

  private
  def declension(number, forms)
    n = number % 100
    return forms[2] if n.between?(11, 14)
    n = number % 10
    case n
    when 1
      forms[0]
    when 2..4
      forms[1]
    else
      forms[2]
    end
  end
end
