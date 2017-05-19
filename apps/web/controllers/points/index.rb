module Web::Controllers::Points
  class Index
    include Web::Action
    accept :json

    params do
      required(:data).schema do
        required(:south_west_lat).filled
        required(:south_west_lng).filled
        required(:north_east_lat).filled
        required(:north_east_lng).filled
        required(:object_types).filled
      end
    end

    def call(params)
      factory = RGeo::Geographic.spherical_factory srid: 4326
      sw = factory.point(params[:data][:south_west_lng], params[:data][:south_west_lat])
      ne = factory.point(params[:data][:north_east_lng], params[:data][:north_east_lat])
      window = RGeo::Cartesian::BoundingBox.create_from_points(sw, ne).to_geometry
      
      #Place.where(object_type: params[:data][:object_types])
      #  .where("coordinates && ?", window).to_json(methods: [:color])


      points = PointRepository.new.in_area(params[:data][:south_west_lat],
        params[:data][:south_west_lng], params[:data][:north_east_lat],
        params[:data][:north_east_lng], params[:data][:object_types])


      hashes = points.map do |point|
        Web::Representers::Point.new(point).to_hash
      end

      self.body   = hashes.to_json
    end
  end
end
