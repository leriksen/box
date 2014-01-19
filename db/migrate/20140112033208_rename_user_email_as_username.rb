class RenameUserEmailAsUsername < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :email, :username
    end
  end
end
