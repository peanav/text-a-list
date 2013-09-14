require 'json'

class App < Sinatra::Base
  get '/' do
    slim :index
  end

  get '/lists' do
    content_type :json
    Queries.lists.to_json
  end

  get '/:list/items' do |list|
    content_type :json
    Queries.items(list).to_json
  end

  post '/sms' do
    text = params['Body']
    list = text.slice(0..text.index(' ')-1)

    if (text.downcase.start_with? 'list ')
      list = text.slice(text.index(' ')..text.length).strip
      items = Queries.items list
      body = items.count>0 ? items.join(', ') : "The #{list.capitalize} list is empty"
      SMS.send(
        :to => params['From'],
        :body => body
      )
      'List Sent'
    elsif (text.downcase.start_with? 'clear ')
      list = text.slice(text.index(' ')..text.length).strip
      Queries.clear_list list
      'List Cleared'
    else
      items = text.slice(text.index(' ')+1..text.length).split(',')
      items.each { |item| Queries.add_list_item list, item }
    end
  end

  get '/styles/*.css' do |sheet_name|
    content_type :css
    begin
      scss :"scss/#{sheet_name}", :load_paths => ['views/sass']
    rescue Errno::ENOENT
      status 404
    end
  end
end
