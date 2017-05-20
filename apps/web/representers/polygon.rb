require 'roar/decorator'
require 'roar/json'

module Web::Representers
  class Polygon < Roar::Decorator
    include Roar::JSON

    property :id
    property :name
    property :terc
    property :unit_type
    property :coordinates_text
    property :color
  end
end