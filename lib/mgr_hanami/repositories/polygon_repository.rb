class PolygonRepository < Hanami::Repository
  include GisSupport

  def in_area(north_east_lat, north_east_lng, south_west_lat, south_west_lng, unit_type)
    objects_in_area(polygons, north_east_lat, north_east_lng, south_west_lat,
    south_west_lng, unit_type, :unit_type)
  end
end
