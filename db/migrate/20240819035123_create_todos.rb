class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
        t.string :name
        t.string :email
        t.string :subject
        t.date :due_date
        t.integer :status, default: 0
        t.timestamps
    end
  end
end
