class CustomersView
  def ask_user_for(info)
    puts "What's the customer's #{info}?"
    gets.chomp
  end

  def display(customers)
    puts "No customers available" if customers.empty?

    customers.each_with_index do |customer, i|
      puts "#{i + 1} - #{customer.name} - #{customer.address}"
    end
  end

  def edit(att, data)
    # Define um bloco de código (lambda) que será executado antes de a linha ser lida pela função Readline.readline. Esse bloco é atribuído à Readline.pre_input_hook, que é um hook pré-entrada.
    Readline.pre_input_hook = lambda {
      # Insere o texto data na linha de entrada do Readline. data.to_s garante que os dados sejam convertidos para string antes de serem inseridos.
      Readline.insert_text(data.to_s)
      # Atualiza a linha de entrada para mostrar o texto recém-inserido. Isso faz com que o texto data apareça na linha de entrada, como se o usuário o tivesse digitado.
      Readline.redisplay
      # Remove o hook pré-entrada, definindo-o como nil para garantir que esse comportamento não seja repetido na próxima vez que Readline.readline for chamado.
      Readline.pre_input_hook = nil
    }

    # Imprime o atributo att seguido de dois pontos e um espaço. Isso serve como um prompt para o usuário, indicando qual campo está sendo editado.
    print "#{att}: "
    # Chama Readline.readline para ler a entrada do usuário. O primeiro argumento é uma string vazia '', que define o prompt (já que o prompt foi tratado pelo comando print anteriormente). O segundo argumento false indica que a entrada do usuário não deve ser adicionada ao histórico do Readline.
    Readline.readline('', false)
  end
end
