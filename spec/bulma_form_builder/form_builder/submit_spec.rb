require 'bulma_form_builder/form_builder'
require 'support/test_models'
require 'support/shared_examples'

RSpec.describe BulmaFormBuilder::FormBuilder, type: :helper do
  subject(:form) { described_class.new(:test_model, test_model, helper, {}) }

  let(:test_model) { TestModel.new }

  describe '#submit' do
    subject(:field) { form.submit }

    it_behaves_like 'an unlabelled field'

    it 'is valid HTML' do
      expect(Nokogiri.parse(field).errors).to be_empty
    end

    it { expect(field).to have_tag('div', count: 1) }

    it 'has the submit button in a control div' do
      expect(field).to have_tag('div', with: { class: 'control' }) do
        with_tag 'input', with: { type: 'submit', class: 'button is-primary' }
      end
    end

    context 'with an additional class' do
      subject(:field) { form.submit class: ['is-small'] }

      it 'includes the additonal class on the input' do
        expect(field).to have_tag('input', with: { type: 'submit', class: 'button is-primary is-small' })
      end
    end

    context 'with an additional class as a string' do
      subject(:field) { form.submit class: 'is-small' }

      it 'includes the additonal class on the input' do
        expect(field).to have_tag('input', with: { type: 'submit', class: 'button is-primary is-small' })
      end
    end
  end
end
