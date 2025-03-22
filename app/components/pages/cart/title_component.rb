# frozen_string_literal: true

class Pages::Cart::TitleComponent < ApplicationComponent
  renders_one :title, Base::Typography::TitleComponent
  renders_one :text_button, Base::Buttons::TextButtonComponent

end
