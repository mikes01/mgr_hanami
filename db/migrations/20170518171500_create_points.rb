Hanami::Model.migration do
   up do
    execute 'CREATE EXTENSION IF NOT EXISTS "postgis"'
    create_table :points do
      primary_key :id
      column :name, String, null: :false
      column :object_type, String, null: :false
      column :object_class, String, null: :false
      column :voivodeship, String, null: :false
      column :county, String, null: :false
      column :commune, String, null: :false
      column :terc, String, null: :false
      column :coordinates, 'geometry(POINT,4326)', null: :false


      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end

  down do
    drop_table :points
    execute 'DROP EXTENSION IF EXISTS "postgis"'
  end
end
