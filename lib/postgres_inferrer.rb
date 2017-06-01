require 'rom/sql/extensions/postgres/inferrer'
require 'rom/sql/extensions/postgres/types'

ROM::SQL::Schema::PostgresInferrer.class_eval do
  alias map_db_type_original map_db_type

  def map_db_type(db_type)
    map_db_type_original(db_type) || (db_type.start_with?('geometry') ? ROM::Types::String : nil)
  end
end