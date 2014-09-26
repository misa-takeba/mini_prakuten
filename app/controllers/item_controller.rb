require 'json'
require 'rakuten_web_service'

class ItemController < ApplicationController
  def index
    render 'product/index'
  end

  def search
    httpClient = HTTPClient.new
    keyword = params['keyword']

    @jsonData = nil

    appid = ENV["APPID"]
    afid = ENV["AFID"]

    #楽天WebAPIにリクエストを投げて、結果を取得する
    begin
      data = httpClient.get_content('https://app.rakuten.co.jp/services/api/Product/Search/20140305', {
        'applicationId' => appid,
        'affiliateId' => afid,
        'keyword' => keyword
      })
      #JsonをRubyで扱いやすいようにパースする
      @jsonData = JSON.parse(data)
      rescue HTTPClient::BadResponseError => e
      rescue HTTPClient::TimeoutError => e
    end

    logger.debug(@jsonData)

    render 'product/index'
  end
end
