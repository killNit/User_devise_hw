class CreateSports < ActiveRecord::Migration[6.0]
  def change
    create_table :sports do |t|
      t.string :name
      t.string :favorite_team

      t.timestamps
    end
  end
end
