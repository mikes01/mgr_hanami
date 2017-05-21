module Web::Controllers::Points
  class Update
    include Web::Action

    params do
      required(:point).schema do
        required(:name).filled(:str?)
        required(:coordinates).filled(:str?)
        required(:object_type).filled(:str?, included_in?: Point::OBJECT_TYPES.keys)
        required(:object_class).filled(:str?, included_in?: Point::OBJECT_CLASSES)
        required(:terc).filled(:str?)
        optional(:voivodeship)
        optional(:county)
        optional(:commune)
      end
    end

    def call(params)
      if params.valid?
        repository = PointRepository.new
        point = repository.update(params[:id] ,point_params)
        self.status = 200
        self.body = Web::Representers::Point.new(point).to_hash.to_json
      else
        self.status = 422
        self.body = params.errors.to_json
      end
    end


    private

    def point_params
      hash = params[:point]
      point =  RGeo::Geos.factory(srid: 4326).parse_wkt(params[:point][:coordinates])
      hash[:coordinates] = RGeo::WKRep::WKBGenerator.new(hex_format: true,
        type_format: :ewkb, emit_ewkb_srid: true).generate(point)
      hash
    end
  end
end
