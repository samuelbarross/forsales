class HomeController < ApplicationController
  def index
    @month_sales = Sale.select("distinct (concat(extract(year from sale_date),'-',extract(month from sale_date))) year_month")

    if params['year_month'].nil?
      ## Default
      best_client_month(Time.zone.now.year.to_s + '-' + Time.zone.now.month.to_s)
    else
       @month_sales = Sale.select("distinct (concat(extract(year from sale_date),'-',extract(month from sale_date))) year_month")
      best_client_month(params['year_month'])
    end
  end

  def best_client_month(year_month)
    stSQL = ''
    stSQL << 'select * '
    stSQL << ' from ( '
    stSQL << "   select distinct (concat(extract(year from sale_date),'-',extract(month from sale_date))) ano_mes, * from sales "
    stSQL << " ) sales where ano_mes = '#{year_month}' order by total_price desc limit(3);"

    @clients = ActiveRecord::Base.connection.execute(stSQL)
  end
end
