class CurrenciesController < ApplicationController

  def first_currency
  @raw_data = open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")
  
  @array_of_symbols = @symbols_hash.keys
  render(:template=> "currency_templates/step_one.html.erb")
end 

def second_currency
  @raw_data = open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")
  
  @from_symbol=params.fetch("from_currency")
  
  @array_of_symbols = @symbols_hash.keys
  render(:template=> "currency_templates/step_two.html.erb")
end 

def convert_currency
  #{"from_symbol"=> "ALL", "to_exchange"=> "AED"
  @from_symbol =params.fetch("from_currency")
  @to_symbol = params.fetch("to_convert")
  
  # TODO: replace USD and EUR with from_symbol and to_symbol
  api_url ="https://api.exchangerate.host/convert?from=#{@from_symbol}&to=#{@to_symbol}"
  @raw_data = open(api_url).read
  @parsed_data = JSON.parse(@raw_data)
  
  @rate = @parsed_data.fetch("result")
  render(:template=>"currency_templates/step_three.html.erb")
end 
end 
