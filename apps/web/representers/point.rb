require 'roar/decorator'
require 'roar/json'

module Web::Representers
  class Point < Roar::Decorator
    include Roar::JSON

    property :id
    property :name
    property :object_type
    property :object_class
    property :voivodeship
    property :county
    property :commune
    property :terc
    property :coordinates_text
    property :color
  end
end