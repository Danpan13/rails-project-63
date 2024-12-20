# frozen_string_literal: true

require_relative 'hexlet_code/version'

# HexletCode module provides methods for generating HTML tags and forms.
module HexletCode
  autoload :Form, 'hexlet_code/form'
  class Error < StandardError; end

  def self.form_for(entity, **form_attributes, &block)
    Form.build(entity, **form_attributes) do |form_builder|
      block.call(form_builder) if block_given?
    end
  end
end
