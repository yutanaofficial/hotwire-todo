class AddSubjectToTodos < ActiveRecord::Migration[7.2]
  def change
    add_column :todos, :subject, :string
  end
end
