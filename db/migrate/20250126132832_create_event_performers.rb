class CreateEventPerformers < ActiveRecord::Migration[8.0]
  def change
    create_table :event_performers do |t|
      t.references :event, null: false, foreign_key: true
      t.references :performer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
