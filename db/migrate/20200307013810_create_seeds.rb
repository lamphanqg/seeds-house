class CreateSeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :seeds do |t|
      t.string :name
      t.belongs_to :species

      t.timestamps
    end
  end
end
