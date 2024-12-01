module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  class Form
    def self.build(**attributes, &block)
      default_attributes = { action: attributes.delete(:url) || '#', method: 'post' }
      Tag.build('form', **default_attributes.merge(attributes), &block)
    end
  end
end
