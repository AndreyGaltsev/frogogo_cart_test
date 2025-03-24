# frozen_string_literal: true

class Shared::Buttons::TextButtonComponent < ApplicationComponent
  def initialize(title:, path: nil, method: nil, render: true, **options)
    @title = title
    @path = path
    @method = method
    @render = render
    @options = options
  end

  private
  def render?
    @render
  end
end
