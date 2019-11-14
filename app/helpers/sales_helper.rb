module SalesHelper

  def active_sale?
    Sale.active.any?
  end

  def active_sale_list
    Sale.active.all
  end

end