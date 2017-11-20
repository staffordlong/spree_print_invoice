include Forwardable

module Spree
  class Printables::BaseView
    extend Forwardable

    attr_reader :printable

    delegate :display_item_total, :display_total, to: :printable

    def initialize(printable)
      @printable = printable
    end

    def firstname
      raise NotImplementedError, 'Please implement firstname'
    end

    def lastname
      raise NotImplementedError, 'Please implement lastname'
    end

    def email
      raise NotImplementedError, 'Please implement email'
    end

    def total
      raise NotImplementedError, 'Please implement total'
    end

    def number
      raise NotImplementedError, 'Please implement number'
    end
  end
end
