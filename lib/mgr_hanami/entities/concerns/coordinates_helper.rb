module CoordinatesHelper
  FACTORY = RGeo::Geographic.spherical_factory(:srid => 4326)

  def coordinates_object
    RGeo::WKRep::WKBParser.new(FACTORY, support_ewkb: true,
        default_srid: 4326).parse(coordinates)
  end

  def coordinates_text
    coordinates_object.as_text
  end
end