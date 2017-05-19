class PointRepository < Hanami::Repository
  def in_area(north_east_lat, north_east_lng, south_west_lat, south_west_lng, object_types)
    points.where(object_type: object_types).where("coordinates <@ box(point(:north_east_lng, :north_east_lat), point(:south_west_lng,:south_west_lat))",
      { north_east_lat: north_east_lat.to_f, north_east_lng: north_east_lng.to_f, south_west_lat: south_west_lat.to_f, south_west_lng: south_west_lng.to_f })
      .to_a
  end


end
