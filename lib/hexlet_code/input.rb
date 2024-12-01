# frozen_string_literal: true

module HexletCode
  # Input class provides methods to build input elements for forms.
  class Input
    def self.build(name:, value: '', **attributes)
      default_attributes = { name: name, value: value, type: 'text' }
      label = Tag.build('label', for: name) { name.capitalize }
      input = Tag.build('input', **default_attributes, **attributes)
      label + input
    end
  end
end
