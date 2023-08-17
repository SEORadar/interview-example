class AddUserLogins < ActiveRecord::Migration[7.0]
  def up
    create_table :user_logins do |t|
      t.references :user
      t.datetime :login_at, null: false
    end

    execute <<-SQL
      INSERT INTO user_logins (user_id, login_at)
      SELECT id, last_login_at FROM users;
    SQL

    remove_column :users, :last_login_at, :datetime
  end

  def down
    add_column :users, :last_login_at, :datetime

    execute <<-SQL
      UPDATE users
      SET last_login_at = (
        SELECT login_at FROM user_logins            
        WHERE user_logins.user_id = users.id
        ORDER BY login_at DESC
        LIMIT 1
      );
    SQL

    drop_table :user_logins
  end
end   
