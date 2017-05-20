class PointRepository < Hanami::Repository
  include GisSupport
  def in_area(north_east_lat, north_east_lng, south_west_lat, south_west_lng, object_types)
    objects_in_area(points, north_east_lat, north_east_lng, south_west_lat,
    south_west_lng, object_types, :object_type)
  end
end
