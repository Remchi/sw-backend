class Edge < ActiveRecord::Base
  belongs_to :category
  has_many :requirements
end
