class Pedido < ActiveRecord::Base
  
  belongs_to :producto
  has_many :codigo
  has_many :entrada
  has_one :factura
  
   serialize :notification_params, Hash
   def paypal_url(return_path)
    values = {
        business: "vendedor-3@ticketing.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: id,
        amount: precio,
        item_name: "Producto #{id}",
        item_number: id,
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
  
  
  
  #pedido.includes(:productos, :facturas)
  
  #def to_s
  #  "#{@usuario},#{@mail},#{@precio}"
  #end
  def to_s
    "Pedido##{self.id}"
  end
end
