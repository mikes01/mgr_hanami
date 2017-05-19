Hanami::Model.migration do
  change do
    create_table :points do
      primary_key :id
      column :name, String, null: :false
      column :object_type, String, null: :false
      column :object_class, String, null: :false
      column :voivodeship, String, null: :false
      column :county, String, null: :false
      column :commune, String, null: :false
      column :terc, String, null: :false
      column :coordinates, 'point', null: :false


      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
