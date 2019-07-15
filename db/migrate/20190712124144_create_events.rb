class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|

  
    	t.string :event_description
    	t.date :event_date	
    	t.references :creator, index: true
    	t.timestamps
    end
  end
end
