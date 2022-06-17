class Account < ApplicationRecord
  require 'nokogiri'
  require 'mechanize'
  require 'open-uri'
  belongs_to :user

  def last_post
    puts "Scraping starting...."
    agent = Mechanize.new
    # agent.user_agent_alias = 'Mac Safari 4'
  
    puts "Empezando SCRAPING INSTA...."
    puts '------------------------------------'
    puts "Scrapping de potal de proveedores..."
    agent.get('https://www.instagram.com/bolteam_/') do |page|
      pp page
      doc = Nokogiri::HTML(page.content)
      puts doc
      # Login to a website
      # mypage = page.form_with(action: 'https://aguilaazteca.mx/index.php/resellers/sessions/login') do |form|
      #   form['username'] = 'gejaarre'
      #   form['password'] = 'GaA2021'
      # end.submit

    end





    # agent.get('https://aguilaazteca.mx/index.php/resellers/sessions/login') do |page|
    #   # Login to a website
      
    #   mypage = page.form_with(action: 'https://aguilaazteca.mx/index.php/resellers/sessions/login') do |form|
    #     form['username'] = 'gejaarre'
    #     form['password'] = 'GaA2021'
    #   end.submit

    #   # If you want to parse the result
    #   doc = Nokogiri::HTML(mypage.content)
    #   h1_text = doc.css('h1').text
    #   puts h1_text

    #   puts "Login successful..."
    # end

    # puts "Scraping LLANTAS...."
    # index = 0
    # index_end = 2000
    # while index < index_end do
    #   scrapping_url = "https://aguilaazteca.mx/index.php/resellers/products/index?search=&category_id=&trademark_id=&width=&height=&metal_wheel=&type=LLANTA&in_stock=true&per_page=#{index}"
    #   products_page = agent.get(scrapping_url)
    #   doc = Nokogiri::HTML(products_page.content)

    #   test = nil
    #   doc.css('.productos .producto').each_with_index do |tr, index|
    #     # This will allow us to create result as this your illustrated one
    #     # ie. ['Raw name 1', 2,094, 0,017, 0,098, 0,113, 0,452]
    #     # array << row.css('th, td').map(&:text)
    #     next if index == 0 

    #     product_sku = tr.css('.sku').text.try(:split, ': ').try(:last)
    #     next if product_sku.blank?
    #     puts "Reding product info => #{product_sku}"
    #     stock_number = tr.css('.inventario span').text.try(:to_i)
    #     product_name = tr.css('.titulo').text
    #     description = tr.css('.extracto').text
    #     product_price = tr.css('.precio-cobertura p').text.to_money.to_i
    #     product_image_url = tr.css('.foto img').first.attr('src')

    #     product = Product.where(external_sku: product_sku, external_provider: 'aguilaazteca', external_name: product_name).first_or_create!(
    #       name: product_name,
    #       description: description,
    #       price: product_price,
    #       tax_category_id: 1,
    #       currency: 'MXN'
    #     )

    #     # Crear el punto de referencia de scrapping
    #     product_tracker = ProductTracker.where(
    #       external_sku: product_sku, 
    #       external_provider: 'aguilaazteca_proveedor', 
    #       external_name: product_name,
    #     ).today.first
    #     if product_tracker.blank?
    #       ProductTracker.create(
    #         product_id: product.id,
    #         external_sku: product_sku, 
    #         external_provider: 'aguilaazteca_proveedor', 
    #         external_name: product_name,
    #         external_url: scrapping_url,
    #         cost_price: product_price,
    #         stock_number: stock_number,
    #       )
    #     end

    #     if !product_image_url.blank? && product.product_image.blank?
    #       puts "Downloading image => #{product_image_url}"
    #       image = nil
    #       begin
    #         image = Down.download(product_image_url)
    #       rescue => e
    #         puts "Error downloading image => #{product_image_url}"
    #       end
    #       product.product_image.attach(io: image, filename: "#{product_sku}.jpg") unless image.blank?
    #       product.active!
    #     end
        
    #     # Validar producto regex 
    #     regex_str = /(\d+)\/(\d+)R(\d+)/
    #     if product_name.match?(regex_str)
    #       product.set_property('Medida', product_name[regex_str])
    #       product.set_property('Ancho', product_name[regex_str,1])
    #       product.set_property('Alto', product_name[regex_str,2])
    #       product.set_property('Rin', product_name[regex_str,3])
    #     end

    #     if product_name.match?(brands_regex)
    #       product.set_brand(product_name[brands_regex])
    #     end

    #     product_name = product.name
    #     if product_name.match?(rangos_regex)
    #       t = product_name[rangos_regex]
    #       indice_carga = t.to_i
    #       codigo_velocidad = t.gsub(/\d+/,"").strip
    #       product.set_property('Índices carga', indice_carga)
    #       product.set_property('Velocidad', codigo_velocidad)  
    #       product.set_property('Índices carga / velocidad', t.strip)      
    #     end

    #     if product_name.match?(/R-F/) 
    #       product.set_property('Run Flat', 'Si')
    #     end
        
    #   end
    #   puts "Scraping LLANTAS... #{index}/#{index_end}"
    #   index += 30
    # end
    
    # puts '------------------------------------'
    # puts "Scraping de la pagina web directa..."

    # index = 0
    # Product.where(external_provider: 'aguilaazteca').find_each do |p|
    #   scrapping_url = "https://aguilaazteca.com/producto/#{p.slug}"
    #   product_page = agent.get(scrapping_url)
    #   doc = Nokogiri::HTML(product_page.content)

    #   product_info = doc.css('.detalle-producto').first
    #   next if product_info.blank?

    #   product_name = product_info.css('.titulo').text
    #   product_sku = product_info.attr('id').split('-').last
    #   description = product_info.css('.extracto').text
    #   product_price = product_info.css('span.precio').text.to_money.to_i || 0
    #   product_discount_percentage = product_info.css('.texto-promo').text.try(:to_i).try(:abs) || 0

    #   puts "Reding product info => #{product_sku} / Index => #{index}"

    #   ProductTracker.create(
    #     product_id: p.id,
    #     external_provider: 'aguilaazteca', 
    #     external_name: product_name,
    #     external_sku: product_sku,
    #     external_url: scrapping_url,
    #     price: product_price,
    #     discount_percentage: product_discount_percentage
    #   )
    #   index += 1
    # end





    # doc = Nokogiri::HTML(URI.open('https://www.instagram.com'))
    # puts doc
    # agent.get("https://www.instagram.com") do |page|
    #   # Login to a website
    #   pp page
    #   doc = Nokogiri::HTML(page.content)
    #   puts doc
    #   doc.css('#loginForm').each_with_index do |tr, index|
    #     puts index
    #     puts tr
    #   end
    #   # mypage = page.form_with(action: 'https://aguilaazteca.mx/index.php/resellers/sessions/login') do |form|
    #   #   form['username'] = 'diegopartida97'
    #   #   form['password'] = 'Ag^CA*YYHwCyqPB!Nd8'
    #   # end.submit

    #   # # If you want to parse the result
    #   # doc = Nokogiri::HTML(mypage.content)
    #   # h1_text = doc.css('h1').text
    #   # puts h1_text

    #   # puts "Login successful..."
    # end

    # puts "Scraping Account...."
    # scrapping_url = "https://www.instagram.com/#{self.handler}/"
    # products_page = agent.get(scrapping_url)
    # doc = Nokogiri::HTML(products_page.content)
    # puts doc
    # doc.css('._aa-i ._ac7v').each_with_index do |tr, index|
    #   puts index
    #   puts tr
    # end
    return "hi"

  end
end
