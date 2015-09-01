class CreateMessageProcessors < ActiveRecord::Migration
  def change
    create_table :message_processors do |t|

      t.timestamps null: false
    end
  end
end
