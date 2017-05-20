Hanami::Model.migration do
  change do
    create_table :lines do
      primary_key :id
      column :name, String, null: :false
      column :coordinates, 'geometry(MULTILINESTRING,4326)', null: :false
      column :road_type, String, null: :false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
