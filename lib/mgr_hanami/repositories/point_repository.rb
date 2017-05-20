class PointRepository < Hanami::Repository
  def in_area(north_east_lat, north_east_lng, south_west_lat, south_west_lng, object_types)
    factory = RGeo::Geographic.spherical_factory srid: 4326
    sw = factory.point(south_west_lng, south_west_lat)
    ne = factory.point(north_east_lng, north_east_lat)
    window = RGeo::Cartesian::BoundingBox.create_from_points(sw, ne).to_geometry

    points.where(object_type: object_types).where("coordinates && ?", window.as_text).to_a
  end
end
