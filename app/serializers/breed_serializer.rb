class BreedSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :max_growth, :spritesheet
  def spritesheet
    if object.spritesheet.attached?
      {
        url: rails_blob_url(object.spritesheet)
      }
    end
  end
end
