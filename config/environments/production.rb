EmailWhitelistingDemo::Application.configure do

  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local       = false

  config.action_controller.perform_caching = true

  config.serve_static_assets = false

  config.assets.js_compressor = :uglifier

  config.assets.compile = false

  config.assets.digest = true

  config.assets.version = '1.0'

  config.log_level = :info

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new



  smtp_options = {
    address: 'smtp.sendgrid.net',
    port: '587',
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'],
    authentication: :plain
  }

  if ENV["MAILER_ENV"] == 'production'
    
    ActionMailer::Base.smtp_settings = smtp_options.merge({
      :domain         => 'heroku.com',
      :enable_starttls_auto => true,
    })

  elsif ENV["MAILER_ENV"] == 'staging'
   
    config.action_mailer.delivery_method = :mail_gate

    config.action_mailer.mail_gate_settings = {
      :whitelist        => /@yahoo.com$|@tinkerbox.com.sg$/mi,
      :delivery_method  => :smtp,
      :subject_prefix   => 'STAGING: ',
      :delivery_settings => smtp_options
    }
  end

end

