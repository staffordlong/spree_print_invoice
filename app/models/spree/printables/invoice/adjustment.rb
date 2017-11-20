module Spree
  class Printables::Invoice::Adjustment

    attr_accessor :label, :display_amount

    def initialize(args = {})
      args.each do |key, value|
        send("#{key}=", value)
      end
    end
  end
end
