# frozen_string_literal: true

class Pages::Cart::TitleComponent < ApplicationComponent
  renders_one :title, Reusable::Typography::TitleComponent
  renders_one :text_button, Reusable::Buttons::TextButtonComponent

end
