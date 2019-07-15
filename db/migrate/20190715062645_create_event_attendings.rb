class CreateEventAttendings < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attendings do |t|



      t.timestamps
	t.references :attendent, index: true
	t.references :attended_event, index: true
    end
  end
end
