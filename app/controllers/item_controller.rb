class ItemController < ApplicationController
  def index
    render 'product/index'
  end

  def search
    httpClient = HTTPClient.new

    #楽天WebAPIにリクエストを投げて、結果を取得する
    begin
      data = httpClient.get_content('https://app.rakuten.co.jp/services/api/Product/Search/20140305', {
        'applicationId' => ENV["APPID"],
        'affiliateId' => ENV["AFID"],
        'keyword' => keyword
      })
      rescue HTTPClient::BadResponseError => e
      rescue HTTPClient::TimeoutError => e
    end

    #JsonをRubyで扱いやすいようにパースする
    jsonData = JSON.parse(data)

    @products = Array.New
    jsonData['product'].each{|json_procuct|
      products.push(product.New(json_product))
    }

    render 'product/index'
  end
end
