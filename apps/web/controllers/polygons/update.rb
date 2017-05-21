module Web::Controllers::Polygons
  class Update
    include Web::Action

    params do
      required(:polygon).schema do
        required(:name).filled(:str?)
        required(:coordinates).filled(:str?)
        required(:unit_type).filled(:str?)
        required(:terc).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        repository = PolygonRepository.new
        polygon = repository.update(params[:id] ,polygon_params)
        self.status = 200
        self.body = Web::Representers::Polygon.new(polygon).to_hash.to_json
      else
        self.status = 422
        self.body = params.errors.to_json
      end
    end

    private

    def polygon_params
      hash = params[:polygon]
      polygon =  RGeo::Geos.factory(srid: 0).parse_wkt(params[:polygon][:coordinates])
      hash[:coordinates] = RGeo::WKRep::WKBGenerator.new(hex_format: true,
        type_format: :ewkb, emit_ewkb_srid: true).generate(polygon)
      hash
    end
  end
end
