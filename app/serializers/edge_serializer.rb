class EdgeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_one :category
  has_many :requirements
end
