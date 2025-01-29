class CreatePerformers < ActiveRecord::Migration[8.0]
  def change
    create_table :performers do |t|
      t.string :name
      t.text :bio

      t.timestamps
    end
  end
end
