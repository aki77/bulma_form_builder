require 'active_record'

class TestModel
  include ActiveModel::Model

  attr_reader :name
end

