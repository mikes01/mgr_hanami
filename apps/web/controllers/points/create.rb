module Web::Controllers::Points
  class Create
    include Web::Action

    def call(params)
      self.body = 'OK'
    end
  end
end
