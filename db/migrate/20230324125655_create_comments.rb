class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :text, null: false
      t.belongs_to :project, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
