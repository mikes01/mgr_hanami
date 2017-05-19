class Point < Hanami::Entity
  def coordinates_as_array
    coordinates[1..-2].split(',').reverse
  end
end
