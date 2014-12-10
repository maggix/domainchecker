class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :host
      t.string :user_id
      t.date :expiration_date

      t.timestamps
    end
  end
end
