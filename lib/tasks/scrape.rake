namespace :scrape do
  desc "Scrape the first page of cellphones on amazon"
  task amazon_cellphones: :environment do
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    page = agent.get('https://www.amazon.com')
    search_form = page.forms.first
    search_form['field-keywords'] = 'cellphones'
    search_form.submit
    results = search_form.submit
    phone_count = 0
    results.search('.s-item-container').each do |cell_container|
      begin
        name = cell_container.at('.s-access-title').text
        price = cell_container.at('.s-price').text.gsub('$', '').to_f
        #maker = cell_container.search('.a-size-small')[1].text
        picture_url = cell_container.at('.s-access-image').attributes.first.last.value
        stars = cell_container.at('.a-icon-star').text.split(' ').first.to_f
        #operating_system = cell_container.search('.a-list-item').first.text.split(':').last
        #display_size = cell_container.search('.a-list-item')[1].text.split(':')
        Cellphone.create(name: name, price: price, picture_url: picture_url, stars: stars)
        phone_count += 1 if phone.persisted?
      rescue => e
        puts "Error scraping cellphone #{e}"
      end
    end
    puts "#{phone_count} phones scraped from amazon!"
  end

end
