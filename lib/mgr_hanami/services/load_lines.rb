
class LoadLines < BaseService
  def initialize(paths)
    self.paths = paths
  end

  attr_accessor :paths

  def call
    repository = LineRepository.new
    paths.each do |path|
      file = LoadShapeFile.call(path)

      factory = RgeoFactoryBuilder.geography_factory
      file.each do |record|
        coordinates = RGeo::Feature.cast(record.geometry, factory: factory, project: true)
        repository.create(
          coordinates: ROM::SQL::Types::PG::Path.new(coordinates._elements.first.points, :open),
          name: record.attributes['name'],
          road_type: record.attributes['fclass']
        )
      end
    end
  end
end