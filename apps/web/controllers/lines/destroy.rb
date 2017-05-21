module Web::Controllers::Lines
  class Destroy
    include Web::Action

    def call(params)
      LineRepository.new.delete(params[:id])
      self.body = 'OK'
    end
  end
end
