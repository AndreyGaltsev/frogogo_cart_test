# frozen_string_literal: true

class Base::Buttons::ButtonToComponent < ApplicationComponent
  def initialize(title:, path: nil, method: nil, p_class: nil, render: true, **options)
    @title = title
    @path = path
    @method = method
    @render = render
    @p_class = p_class
    @options = options
  end

  private
  def render?
    @render
  end
end
