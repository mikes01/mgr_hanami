class LineRepository < Hanami::Repository
  include GisSupport
  def in_area(north_east_lat, north_east_lng, south_west_lat, south_west_lng, object_types)
    objects_in_area(lines, north_east_lat, north_east_lng, south_west_lat,
    south_west_lng, object_types, :road_type)
  end
end
