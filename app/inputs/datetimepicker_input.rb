class DatetimepickerInput < SimpleForm::Inputs::StringInput
  
  def input(wrapper_options)
    value = object.send(attribute_name) if object.respond_to? attribute_name
    input_html_options[:type] = 'text'

    if value.present?
      input_html_options[:value] ||= value.strftime('%d-%m-%Y')
    end
    
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!({ class: 'form-control' })

    template.content_tag :div, class: 'input-group date', id: 'datepicker',
      'data-date-format' => 'DD-MM-YYYY' do
      input = super
      input += template.content_tag :span, class: 'input-group-addon' do
        template.content_tag :span, '', class: 'glyphicon glyphicon-calendar'
      end
      input
    end
  end
end
