module Spree
  class Printables::Invoice::Item

    attr_accessor :sku, :name, :options_text, :display_price, :quantity, :display_total

    def initialize(args = {})
      args.each do |key, value|
        send("#{key}=", value)
      end
    end
  end
end
