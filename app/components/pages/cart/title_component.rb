# frozen_string_literal: true

class Pages::Cart::TitleComponent < ApplicationComponent
  renders_one :title, Shared::Typography::TitleComponent
  renders_one :text_button, Shared::Buttons::TextButtonComponent
end
