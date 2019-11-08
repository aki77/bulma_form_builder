module BulmaFormBuilder
  module Inputs
    module NumberField
      extend ActiveSupport::Concern

      include Base

      included do
        bulma_field(:number_field)
      end
    end
  end
end
