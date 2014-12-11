class AddLastCheckedToDomain < ActiveRecord::Migration
  def change
    add_column :domains, :last_checked, :date
  end
end
