Hanami::Model.migration do
  change do
    add_index :points, :coordinates, type: :gist
    add_index :points, :object_type
    add_index :lines, :coordinates, type: :gist
    add_index :lines, :road_type
    add_index :polygons, :coordinates, type: :gist
    add_index :polygons, :unit_type
  end
end
