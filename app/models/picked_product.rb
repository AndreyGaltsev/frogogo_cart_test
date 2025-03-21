class PickedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true, touch: true
end
