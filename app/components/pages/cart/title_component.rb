# frozen_string_literal: true

class Pages::Cart::TitleComponent < ApplicationComponent
  renders_one :title, Base::Typography::TitleComponent
  renders_one :clear_button, Base::Buttons::ButtonToComponent

end
