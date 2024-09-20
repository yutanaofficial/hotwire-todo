class TodoMailer < ApplicationMailer
  default from: 'example.com'

  def change_status(todo)
        @todo = todo
    puts "================ Wisanu ==============="
    mail(to: @todo.email, subject: 'Todo Status Changed')
  end

end