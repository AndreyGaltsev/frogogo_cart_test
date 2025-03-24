# frozen_string_literal: true

class Shared::Buttons::RemoveComponent < ApplicationComponent
  def initialize(path:, value:, turbo_frame:)
    @path = path
    @value = value
    @turbo_frame = turbo_frame
  end
end
