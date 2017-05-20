module Web::Controllers::Lines
  class Index
    include Web::Action

     params do
      required(:data).schema do
        required(:south_west_lat).filled
        required(:south_west_lng).filled
        required(:north_east_lat).filled
        required(:north_east_lng).filled
        required(:road_types).filled
      end
    end

    def call(params)
      lines = LineRepository.new.in_area(params[:data][:south_west_lat],
        params[:data][:south_west_lng], params[:data][:north_east_lat],
        params[:data][:north_east_lng], params[:data][:road_types])


      hashes = lines.map do |line|
        Web::Representers::Line.new(line).to_hash
      end

      self.body   = hashes.to_json
    end
  end
end
