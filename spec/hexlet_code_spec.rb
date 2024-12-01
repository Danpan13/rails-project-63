# frozen_string_literal: true

require 'hexlet_code'

# rubocop:disable Metrics/BlockLength
RSpec.describe HexletCode do
  let(:user) { Struct.new(:name, :job, :gender, keyword_init: true).new(name: 'rob', gender: 'm', job: 'hexlet') }
  let(:default_empty_form) { File.read('spec/fixtures/default_empty_form.html', encoding: 'UTF-8').strip }
  let(:form_with_custom_url) { File.read('spec/fixtures/form_with_custom_url.html', encoding: 'UTF-8').strip }
  let(:form_with_css_classes) { File.read('spec/fixtures/form_with_css_classes.html', encoding: 'UTF-8').strip }
  let(:form_with_textarea) { File.read('spec/fixtures/form_with_textarea.html', encoding: 'UTF-8').strip }
  let(:form_with_input) { File.read('spec/fixtures/form_with_input.html', encoding: 'UTF-8').strip }
  let(:form_with_custom_attributes) do
    File.read('spec/fixtures/form_with_custom_attributes.html', encoding: 'UTF-8').strip
  end
  let(:form_with_labels_and_submit) do
    File.read('spec/fixtures/form_with_labels_and_submit.html', encoding: 'UTF-8').strip
  end
  let(:form_with_labels_and_default_submit) do
    File.read('spec/fixtures/form_with_labels_and_default_submit.html', encoding: 'UTF-8').strip
  end

  describe 'Empty and Custom Forms' do
    it 'generates an empty form' do
      expect(HexletCode.form_for(user)).to eq(default_empty_form)
    end

    it 'generates a form with a custom URL' do
      expect(HexletCode.form_for(user, url: '/profile')).to eq(form_with_custom_url)
    end
  end

  describe 'Form with Additional Features' do
    it 'generates a form with additional CSS classes' do
      expect(HexletCode.form_for(user, class: 'hexlet-form')).to eq(form_with_css_classes)
    end

    it 'generates a form with an input' do
      expect(HexletCode.form_for(user) { |f| f.input :name }).to eq(form_with_input)
    end

    it 'generates a form with a textarea' do
      expect(HexletCode.form_for(user) { |f| f.input :job, as: :text }).to eq(form_with_textarea)
    end

    it 'generates a form with custom attributes' do
      expect(HexletCode.form_for(user, url: '#') do |f|
        f.input :job, as: :text, rows: 50, cols: 50
      end).to eq(form_with_custom_attributes)
    end
  end

  describe 'Form with Labels and Submit' do
    it 'generates a form with labels and a submit button' do
      actual_output = HexletCode.form_for(user, url: '#') do |f|
        f.input :name
        f.input :job
        f.submit 'Wow'
      end
      expect(actual_output).to eq(form_with_labels_and_submit)
    end

    it 'generates a form with labels and a submit button with default value' do
      actual_output = HexletCode.form_for(user, url: '#') do |f|
        f.input :name
        f.input :job
        f.submit
      end

      expect(actual_output).to eq(form_with_labels_and_default_submit)
    end
  end
end
# rubocop:enable Metrics/BlockLength
