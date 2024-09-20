class AddEmailToTodos < ActiveRecord::Migration[7.2]
  def change
    add_column :todos, :email, :string
  end
end
