class InventionsMaterial < ApplicationRecord
  belongs_to :invention
  belongs_to :material
end
