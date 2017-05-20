require 'roar/decorator'
require 'roar/json'

module Web::Representers
  class Line < Roar::Decorator
    include Roar::JSON

    property :id
    property :name
    property :road_type
    property :coordinates_text
    property :color
  end
end