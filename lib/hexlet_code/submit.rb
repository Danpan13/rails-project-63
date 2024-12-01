# frozen_string_literal: true

module HexletCode
  # Submit class provides methods to build submit elements for forms.
  class Submit
    def self.build(value = "Submit")
      default_attributes = { type: 'submit', value: value }
      Tag.build('input', **default_attributes)
    end
  end
end
