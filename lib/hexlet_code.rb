# frozen_string_literal: true

require_relative 'hexlet_code/version'

# HexletCode module provides methods for generating HTML tags and forms.
module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  class Error < StandardError; end

  def self.form_for(_entity, **attributes)
    extended_attributes = { action: attributes.delete(:url) || '#', method: 'post' }.merge(attributes)
    Tag.build('form', **extended_attributes)
  end
end
