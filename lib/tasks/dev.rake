namespace :dev do
  DEFAULT_PASSWORD = 123456
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Criando o administrador padrão...") { %x(rails dev:add_default_admin) }
      show_spinner("Adicionando administradores extras...") { %x(rails dev:add_extra_admins) }
      show_spinner("Adicionando Munícipe...") { %x(rails dev:add_citizen) }
      
      
      
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

 
 
  # nova task
  desc "Adiciona outros administradores extras"
  task add_extra_admins: :environment do
    10.times do |i|
      Admin.create!(
      email: Faker::Internet.email,
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adiciona o Munícipe"
  task add_citizen: :environment do
    Citizen.create!(
      first_name: 'Marcelo',
      last_name: 'Salmeron',
      cpf: '27388297839',
      cns: '0000000000000',
      email: 'salmeron.marcelo@gmail.com',
      birthday: 11/04/1975,
      phone: '11996231987',
      status: true
    )
  end

  

  

  private
  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
