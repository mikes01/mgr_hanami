class Line < Hanami::Entity
  def coordinatesa_as_array
    JSON.parse coordinates.gsub('(', '[').gsub(')', ']')
  end
end
