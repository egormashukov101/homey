class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.integer :status, null: false

      t.timestamps null: false
    end
  end
end
