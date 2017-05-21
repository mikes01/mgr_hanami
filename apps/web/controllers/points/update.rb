module Web::Controllers::Points
  class Update
    include Web::Action

    def call(params)
      self.body = 'OK'
    end
  end
end
