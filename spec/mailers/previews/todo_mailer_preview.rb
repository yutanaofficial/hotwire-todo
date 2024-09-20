# Preview all emails at http://localhost:3000/rails/mailers/todo_mailer_mailer
class TodoMailerPreview < ActionMailer::Preview
  def status_changed
    todo = Todo.first # หรือใช้ Todo ที่คุณต้องการทดสอบ
    TodoMailer.status_changed(todo)
  end
end
