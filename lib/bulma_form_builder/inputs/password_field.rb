module BulmaFormBuilder
  module Inputs
    module PasswordField
      extend ActiveSupport::Concern

      include Base

      included do
        bulma_field(:password_field)
      end
    end
  end
end
