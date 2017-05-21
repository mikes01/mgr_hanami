module Web::Controllers::Points
  class Destroy
    include Web::Action

    def call(params)
      PointRepository.new.delete(params[:id])
      self.body = 'OK'
    end
  end
end
