require 'bulma_form_builder/form_builder'
require 'support/test_models'
require 'support/shared_examples'

RSpec.describe BulmaFormBuilder::FormBuilder, type: :helper do
  subject(:form) { described_class.new(:test_model, test_model, helper, {}) }

  let(:test_model) { TestModel.new }

  describe '#select' do
    subject(:field) { form.select :name, [['Name 1', 'n1'], ['Name 2', 'n2']] }

    it_behaves_like 'a labelled field'

    it 'is valid HTML' do
      expect(Nokogiri.parse(field).errors).to be_empty
    end

    it { expect(field).to have_tag('div', count: 3) }

    it 'has the select box in a control div' do
      expect(field).to have_tag('div', with: { class: 'field' }) do
        with_tag 'div', with: { class: 'control' } do
          with_tag 'div', with: { class: 'select' } do
            with_tag 'select'
          end
        end
      end
    end

    context 'with a multiple select' do
      subject(:field) { form.select :name, [['Name 1', 'n1'], ['Name 2', 'n2']], {}, { multiple: true } }

      it 'has the select box in a control div' do
        expect(field).to have_tag('div', with: { class: 'field' }) do
          with_tag 'label', with: { class: 'label' }
          with_tag 'div', with: { class: 'control' } do
            with_tag 'div', with: { class: 'select is-multiple' } do
              with_tag 'select'
            end
          end
        end
      end  
    end
  end
end
