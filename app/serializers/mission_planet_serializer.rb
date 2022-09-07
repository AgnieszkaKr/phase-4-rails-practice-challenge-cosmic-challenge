class MissionPlanetSerializer < ActiveModel::Serializer
  attributes :id, :name, :distance_from_earth, :nearest_star, :image

  belongs_to :planet
end
