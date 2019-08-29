class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.references :user, foreign_key: true
      t.references :suggestion, foreign_key: true

      t.timestamps
    end
  end
end
