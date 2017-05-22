module Web::Views::Map
  class Index
    include Web::View

    def points_options
      options = ""
      Point::OBJECT_TYPES.each do |name, color|
        options << "<option style='background-color: #{color}' value='#{name}'>#{name}</option>"
      end
      raw options
    end

    def lines_options
      options = ""
      Line::ROAD_TYPES.each do |name, color|
        options << "<option style='background-color: #{color}' value='#{name}'>#{name}</option>"
      end
      raw options
    end

    def polygons_options
      options = ""
      Polygon::UNIT_TYPES.each_with_index do |record, index|
        options << "<option style='background-color: #{record[1]}' value='#{index}'>#{record[0]}</option>"
      end
      raw options
    end
  end
end
