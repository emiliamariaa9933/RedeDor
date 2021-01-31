require "capybara"
require "capybara/cucumber"
require "capybara/rspec"
require "rspec"
require "selenium-webdriver"
require "webdrivers"
require "pry"
require "faker"
require "rspec/expectations"

require_relative "helper.rb"

include RSpec::Matchers

World(Capybara::DSL) #DSLs globais para o Capybara
$logger = Logger.new(STDOUT)

CUCUMBER_PUBLISH_ENABLED = true

HEADLESS = ENV["HEADLESS"]

ENVIRONMENT_TYPE = ENV["ENVIRONMENT_TYPE"]
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/data/#{ENVIRONMENT_TYPE}.yml")

Capybara.register_driver :chrome do |app| #registro do driver utilizado para o Capybara
  if HEADLESS.eql?("com_interface")
    $logger.info("Executando o chrome com interface grafica")
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      clear_local_storage: true,
      clear_session_storage: true,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        "chromeOptions" => { "args" => ["--disable-infobars",
                                       "window-size=1280,1024"] },
      ),
    )
  elsif HEADLESS.eql?("sem_interface")
    $logger.info("Executando o chrome sem interface grafica")
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      clear_local_storage: true,
      clear_session_storage: true,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        "chromeOptions" => { "args" => %w['--headless', '--disable-gpu',
                                         disable-popup-blocking, '--disable-infobars',
                                         'window-size=1280,1024'] },
      ),
    )
  end
end

Capybara.configure do |config| #config da instância par ao Capybara
  $logger.info("Instaciando o driver e acessando a host-url")

  config.default_driver = :chrome
  config.default_max_wait_time = 30
  config.app_host = CONFIG["url_producao"]
end

Capybara.page.driver.browser.manage.window.maximize
