class AddIsValidToDomain < ActiveRecord::Migration
  def change
    add_column :domains, :is_valid, :boolean
  end
end
