class CreateEmploye < ActiveRecord::Migration
  def up
    create_table 'employes' do |t|
      t.string 'username', :null => false
      t.string 'crypted_password', :null => false
      t.string 'password_salt', :null =>false
      t.string 'persistence_token', :null => false
    end
  end

  def down
    drop_table 'employes'
  end
end
