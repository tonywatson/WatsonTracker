class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string     :email_address, :crypted_password, :password_salt, :persistence_token, :perishable_token, :null => false
      t.integer    :login_count, :failed_login_count, :null => false, :default => 0
      t.string     :current_login_ip, :last_login_ip
      t.datetime   :current_login_at, :last_login_at, :activated_at, :opted_out_at
      t.timestamps
    end
  end
end
