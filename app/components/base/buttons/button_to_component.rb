# frozen_string_literal: true

class Base::Buttons::ButtonToComponent < ApplicationComponent
  def initialize(title:, path: nil, method: nil, form_class: nil, render: true, **options)
    @title = title
    @path = path
    @method = method
    @render = render
    @form_class = form_class
    @options = options
  end

  private
  def render?
    @render
  end
end
