require 'rom/sql/extensions/postgres/inferrer'
require 'rom/sql/extensions/postgres/types'
require 'rgeo'

ROM::SQL::Schema::PostgresInferrer.class_eval do
  alias map_db_type_original map_db_type
  rgeo_factory = RGeo::Geographic.spherical_factory(:srid => 4326)

  PointGIS = Dry::Types::Definition.new(RGeo::Geographic::SphericalPointImpl).constructor(&->(raw) { RGeo::WKRep::WKBParser.new(rgeo_factory, support_ewkb: true, default_srid: 4326).parse(raw) })

  def map_db_type(db_type)
    map_db_type_original(db_type) || (db_type.start_with?('geometry') ? ROM::Types::String : nil)
  end
end