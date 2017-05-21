module Web::Controllers::Polygons
  class Destroy
    include Web::Action

    def call(params)
      PolygonRepository.new.delete(params[:id])
      self.body = 'OK'
    end
  end
end
