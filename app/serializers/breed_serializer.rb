class BreedSerializer < ActiveModel::Serializer
  include AmsLazyRelationships::Core
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :max_growth, :spritesheet
  # lazy_has_many :plants
  # lazy_has_one_attached :spritesheet

  ## Attaches actual sprite URL to breed JSON.
  def spritesheet
    url_for(object.spritesheet) if object.spritesheet.attached?
  end
end
