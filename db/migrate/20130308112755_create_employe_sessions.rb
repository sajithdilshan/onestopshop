class CreateEmployeSessions < ActiveRecord::Migration
  def change
    create_table :employe_sessions do |t|

      t.timestamps
    end
  end
end
