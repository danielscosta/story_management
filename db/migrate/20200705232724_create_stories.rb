class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :headline
      t.text :body
      t.string :status
      t.references :organization, null: false, foreign_key: true
      t.references :writer, index: true, foreign_key: { to_table: :users }
      t.references :reviewer, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
