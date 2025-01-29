class CreateJoinTableEventsPerformers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :events, :performers do |t|
      t.index :event_id
      t.index :performer_id
    end
  end
end
