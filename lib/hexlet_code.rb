# frozen_string_literal: true

require_relative 'hexlet_code/version'

# HexletCode module provides methods for generating HTML tags and forms.
module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form'
  autoload :Input, 'hexlet_code/input'
  class Error < StandardError; end

  def self.form_for(entity, **form_attributes)
    body = "\n"
    entity.to_h.each do |key, val|
      body += Input.build(name: key, value: val)
      body += "\n"
    end

    Form.build(**form_attributes) { body }
  end
end