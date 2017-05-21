module Web::Controllers::Lines
  class Create
    include Web::Action

    params do
      required(:line).schema do
        required(:name).filled(:str?)
        required(:coordinates).filled(:str?)
        required(:road_type).filled(:str?, included_in?: Line::ROAD_TYPES.keys)
      end
    end

    def call(params)
      
      if params.valid?
        repository = LineRepository.new
        line = repository.create(line_params)
        self.status = 201
        self.body = Web::Representers::Line.new(line).to_hash.to_json
      else
        self.status = 422
        self.body = params.errors.to_json
      end
    end

    private

    def line_params
      hash = params[:line]
      line =  RGeo::Geos.factory(srid: 4326).parse_wkt(params[:line][:coordinates])
      hash[:coordinates] = RGeo::WKRep::WKBGenerator.new(hex_format: true,
        type_format: :ewkb, emit_ewkb_srid: true).generate(line)
      hash
    end
  end
end
