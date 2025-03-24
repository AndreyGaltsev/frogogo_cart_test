import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["slider", "display"]

    connect() {
        // Получаем максимальную скидку и общую сумму из атрибутов данных
        this.maxDiscount = parseFloat(this.element.dataset.discountRangeSliderMaxDiscount) || 0
        this.totalPrice = parseFloat(this.element.dataset.discountRangeSliderTotalPrice) || 0

        // Если максимальная скидка равна 0, отключаем слайдер
        if (this.maxDiscount <= 0) {
            this.sliderTarget.disabled = true
        }

        // Находим элемент с суммой заказа
        this.orderTotalElement = document.querySelector('#order-total-amount')

        this.updateDisplay()
    }

    handleSlider() {
        this.updateDisplay()
    }

    updateDisplay() {
        // Получаем текущее значение скидки
        const discountAmount = parseFloat(this.sliderTarget.value)

        // Форматируем сумму скидки для отображения
        this.displayTarget.innerHTML = this.formatPrice(discountAmount) + ' <span>&#8381;</span>'

        // Обновляем сумму заказа, если элемент найден
        if (this.orderTotalElement) {
            const finalPrice = this.totalPrice - discountAmount
            this.orderTotalElement.innerHTML = this.formatPrice(finalPrice) + ' <span>&#8381;</span>'
        }
    }

    // Функция для форматирования цены
    formatPrice(price) {
        return new Intl.NumberFormat('ru-RU').format(price)
    }
}