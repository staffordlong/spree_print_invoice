module Spree
  class Printables::Order::InvoiceView < Printables::Invoice::BaseView
    def_delegators :@printable,
                   :email,
                   :bill_address,
                   :ship_address,
                   :tax_address,
                   :item_total,
                   :total,
                   :payments,
                   :shipments,
                   :currency

    def items
      printable.line_items.map do |item|
        inventory_unit = item.inventory_units.reject{|u| u.state == 'returned'}.last
        if inventory_unit
          Spree::Printables::Invoice::Item.new(
            sku: inventory_unit.variant.sku,
            name: inventory_unit.variant.name,
            options_text: inventory_unit.variant.options_text,
            display_price: item.display_price,
            quantity: item.quantity,
            display_total: item.display_total
          )
        else
         Spree::Printables::Invoice::Item.new(
            sku: item.variant.sku,
            name: item.variant.name,
            options_text: item.variant.options_text,
            display_price: item.display_price,
            quantity: item.quantity,
            display_total: item.display_total
          )
        end
      end
    end

    def firstname
      printable.tax_address.firstname
    end

    def lastname
      printable.tax_address.lastname
    end

    private

    def all_adjustments
      printable.all_adjustments.eligible
    end
  end
end
