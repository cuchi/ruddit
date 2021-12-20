# frozen_string_literal: true

module Types
  class SortByType < Types::BaseEnum
    value 'NEW', value: :new
    value 'BEST', value: :best
    value 'CONTROVERSIAL', value: :controversial
  end
end
