class BreedSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :description, :max_growth, :spritesheet

  def spritesheet
    url_for(object.spritesheet) if object.spritesheet.attached?
  end
end
