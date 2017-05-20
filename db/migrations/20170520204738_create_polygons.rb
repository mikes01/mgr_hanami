Hanami::Model.migration do
  change do
    create_table :polygons do
      primary_key :id
      column :name, String, null: :false
      column :unit_type, Integer, null: :false
      column :terc, String, null: :false
      column :coordinates, 'geometry(MULTIPOLYGON,0)', null: :false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
