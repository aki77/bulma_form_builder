require 'rails/railtie'

module BulmaFormBuilder
  class Railtie < Rails::Railtie
    initializer :bulma_form_builder do
      ActiveSupport.on_load(:action_view) do
        require 'bulma_form_builder/form_helper'
        include BulmaFormBuilder::FormHelper
      end
    end
  end
end
