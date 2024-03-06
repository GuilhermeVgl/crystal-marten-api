Marten.configure do |config|
  # IMPORTANT: please ensure that the secret key value is kept secret!
  config.secret_key = "__insecure_6cc31bf20be9fa0f049f4c6d0298c36c1e1f79aec6d4f880ffb3711970967391__"

  # Installed applications
  # https://martenframework.com/docs/development/reference/settings#installed_apps
  config.installed_apps = [] of Marten::Apps::Config.class

  # Application middlewares
  # https://martenframework.com/docs/development/reference/settings#middleware
  config.middleware = [
    Marten::Middleware::Session,
    Marten::Middleware::Flash,
    Marten::Middleware::GZip,
    Marten::Middleware::XFrameOptions,
  ]

  # Databases
  # https://martenframework.com/docs/development/reference/settings#database-settings
  config.database do |db|
    db.backend = :sqlite
    db.name = Path["crystal-marten-api.db"].expand
  end

  # Templates context producers
  # https://martenframework.com/docs/development/reference/settings#context_producers
  config.templates.context_producers = [
    Marten::Template::ContextProducer::Request,
    Marten::Template::ContextProducer::Flash,
    Marten::Template::ContextProducer::Debug,
    Marten::Template::ContextProducer::I18n,
  ]
end
