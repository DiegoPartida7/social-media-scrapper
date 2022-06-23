module AccountsHelper
  # require 'nokogiri'
  # require 'mechanize'
  # require 'open-uri'
  # require 'webdrivers/chromedriver'
  # require 'headless'

  # def get_last_post()
  #   accounts = Account.all
  #   Rails.logger.info "--------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------"
  #   Rails.logger.info "--------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------"
  #   Rails.logger.info "#{accounts.first}"
  #   Rails.logger.info "--------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------"
  #   Rails.logger.info "--------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------"

  #   default_opts = {download_directory: "./tmp/downloads", success: true, headless: true, logged_in: false}
  #   # opts = default_opts.merge(args)
  #   # opts.each do |k,v|
  #   #   instance_variable_set("@#{k}", v) unless v.nil?
  #   # end
    
  #   @download_directory = Rails.env.production? ? "#{Rails.root.to_s}/storage" : "#{Rails.root.to_s}/tmp"
  #   @headless = Rails.env.production?
  #   @success = true
  #   @proxy = Rails.env.production? ? { http: proxy_data, ssl: proxy_data } : {}

  #   unless @browser
  #     default_opts = {download_directory: "./tmp/downloads", success: true, headless: true, logged_in: false}

  #     @download_directory = Rails.env.production? ? "#{Rails.root.to_s}/storage" : "#{Rails.root.to_s}/tmp"
  #     @headless = Rails.env.production?
  #     @success = true
  #     @proxy = Rails.env.production? ? { http: proxy_data, ssl: proxy_data } : {}
  #     #@headless = Headless.new
  #     #@headless.start
  #     args = ['--ignore-certificate-errors', '--disable-popup-blocking', '--disable-translate', "--no-sandbox"]
  #     prefs = {
  #       download: {
  #         prompt_for_download: false,
  #         default_directory: @download_directory,
  #         directory_upgrade: true,
  #       },
  #       browser:{
  #         set_download_behavior: {
  #           behavior: "allow",
  #           download_path: @download_directory,
  #         },
  #       },
  #       savefile: {default_directory: @download_directory},
  #       download_path: @download_directory

  #     }

  #     @browser = Watir::Browser.new :chrome, options: {prefs: prefs, args: args}, headless: @headless
  #     @browser.driver.download_path = @download_directory
  #     @browser.window.resize_to(1200, 800)
  #     @browser.goto("https://www.instagram.com/accounts/login/?next=/#{accounts.first.handler}/")
  #     text_field = @browser.text_field(name: 'username')
  #     text_field.set 'jon___snow_22'
  #     text_field = @browser.text_field(name: 'password')
  #     text_field.set 'Bolteam123!'
  #     button = @browser.button(type: 'submit')
  #     button.click
  #     but_save = @browser.button(text: 'Save Info')
  #     but_save.click
  #     counter = 0
  #     accounts.each do |account|
  #       @browser.goto("https://www.instagram.com/#{account.handler}")
  #       posts_divs = @browser.divs(class: '_aabd').first
  #       first_post = posts_divs.link(class: 'oajrlxb2')
  #       first_post.click 
  #       date = @browser.time(class: '_aaqe')
  #       puts date.datetime
  #       date_text = date.text
  #       puts date_text
  #       account.update(last_post: date_text)
  #       exit_button = @browser.svg(class: 'fg7vo5n6')
  #       exit_button.click
  #     end
  #     profile = @browser.divs(class: '_acut').last
  #     profile.click
  #     logout = @browser.div(text: 'Log Out')
  #     logout.click
  #     last_post = @browser.div
  #   end
  # end
end
