def validate_migration(migration, existing_schema)
  # Check if migration is a hash
  raise ArgumentError, 'Migration must be a hash' unless migration.is_a?(Hash)

  # Check if existing schema is a hash
  raise ArgumentError, 'Existing schema must be a hash' unless existing_schema.is_a?(Hash)

  # Check if migration has a 'changes' key
  raise ArgumentError, 'Migration must have a "changes" key' unless migration.key?('changes')

  # Check if existing schema has a 'columns' key
  raise ArgumentError, 'Existing schema must have a "columns" key' unless existing_schema.key?('columns')

  # Iterate over each change in the migration
  migration['changes'].each do |change|
    # Check if the change is a 'add' or 'remove' operation
    raise ArgumentError, 'Invalid change type' unless change.is_a?(Hash) && (change.key?('operation') && ['add', 'remove'].include?(change['operation'])) && (change.key?('table') && change['table'].is_a?(String)) && (change.key?('column') && change['column'].is_a?(Hash))

    # Get the column name and data type from the change
    column_name = change['column']['name']
    data_type = change['column']['data_type']

    # Check if the column exists in the existing schema
    if !existing_schema['columns'].any? { |column| column['name'] == column_name }
      return false
    end

    # Get the existing column
    existing_column = existing_schema['columns'].find { |column| column['name'] == column_name }

    # Check if the data type matches the existing column's data type
    if data_type != existing_column['data_type']
      return false
    end
  end

  # If we've made it this far, the migration is valid
  true
end

if __name__ == "__main__"
  # Example usage:
  migration = {
    changes: [
      { operation: 'add', table: 'users', column: { name: 'name', data_type: 'string' } },
      { operation: 'remove', table: 'users', column: { name: 'email', data_type: 'string' } }
    ]
  }

  existing_schema = {
    columns: [
      { name: 'name', data_type: 'string' },
      { name: 'email', data_type: 'string' }
    ]
  }

  puts validate_migration(migration, existing_schema)  # => true
end