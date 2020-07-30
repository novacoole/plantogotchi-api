class BreedSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :description, :max_growth, :spritesheet

  ## Attaches actual sprite URL to breed JSON.
  def spritesheet
    url_for(object.spritesheet) if object.spritesheet.attached?
  end
end
