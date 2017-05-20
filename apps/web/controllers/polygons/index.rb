module Web::Controllers::Polygons
  class Index
    include Web::Action

    params do
      required(:data).schema do
        required(:south_west_lat).filled
        required(:south_west_lng).filled
        required(:north_east_lat).filled
        required(:north_east_lng).filled
        required(:unit_types).filled
      end
    end

    def call(params)
      polygons = PolygonRepository.new.in_area(params[:data][:south_west_lat],
        params[:data][:south_west_lng], params[:data][:north_east_lat],
        params[:data][:north_east_lng], params[:data][:unit_types])


      hashes = polygons.map do |polygon|
        Web::Representers::Polygon.new(polygon).to_hash
      end

      self.body   = hashes.to_json
    end
  end
end
