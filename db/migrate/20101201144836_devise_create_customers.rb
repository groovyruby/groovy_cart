class DeviseCreateCustomers < ActiveRecord::Migration
  def self.up
    create_table(:customers) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :customers, :email,                :unique => true
    add_index :customers, :reset_password_token, :unique => true
    # add_index :customers, :confirmation_token,   :unique => true
    # add_index :customers, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :customers
  end
end
