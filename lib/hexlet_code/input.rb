# frozen_string_literal: true

module HexletCode
  # Input class provides methods to build input elements for forms.
  class Input
    def self.build(name:, value: '', **attributes)
      default_attributes = { name: name, value: value, type: 'text' }
      Tag.build('input', **default_attributes.merge(attributes))
    end
  end
end
