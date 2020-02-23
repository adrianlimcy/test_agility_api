class HomeController < ApplicationController
  def index
    order_url = 'https://application.agilitylogistics.com.sg/ricoh/uat_api/createorder.asp'
    api_key = Rails.application.credentials.agility[:api_key]


    payload = 'json={ "orderdetail": [{"orderline": 1, "sku": "169699", "qty": 8}],
            "accountkey": '+Rails.application.credentials.agility[:api_key]+',
            "shiptocountry": "SINGAPORE",
            "service": "STANDARD",
            "ordernumber": "RICOH-11",
            "ordertype": "WEB",
            "orderdate": "20200301",
            "totalprice": 188,
            "TotalOrderLines": 1,
            "agility.odata.metadata": "CreateOrder"}'

    options = {
      headers: {
        "Content-Type" => "application/x-www-form-urlencoded"
      },
      body:  payload,
      debug_output: STDOUT
    }

    @result = HTTParty.post(order_url, options)
  end
end
