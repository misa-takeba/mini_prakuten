# -*- coding: utf-8 -*-
require 'json'

class Product < ActiveRecord::Base
  def initialize(jsonData)
    # 変数に代入
    @name = jsonData['name']
    @postage = jsonData['postage']
    @imageUrl = jsonData['imageUrl']
    @salesMinPrice = jsonData['salesMinPrice']
    @usedExcludeMinPrice = jsonData['usedExcludeMinPrice ']
    @usedExcludeSalesMinPrice = jsonData['usedExcludeSalesMinPrice']
    @minPrice = jsonData['minPrice']
  end
end
