class PolygonRepository < Hanami::Repository
  include GisSupport

  def in_area(north_east_lat, north_east_lng, south_west_lat, south_west_lng, object_types)
    unit_types = object_types.map { |t| Polygon::UNIT_TYPES.keys.index(t) }
    objects_in_area(polygons, north_east_lat, north_east_lng, south_west_lat,
    south_west_lng, unit_types, :unit_type)
  end
end
