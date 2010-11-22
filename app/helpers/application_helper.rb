module ApplicationHelper
  def generate_html(form_builder, method, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
    options[:partial] ||= method.to_s.singularize
    options[:form_builder_local] ||= :f
    form_builder.fields_for(method, options[:object], :child_index => 'new_'+method.to_s.singularize) do |f|
      render(:partial => options[:partial], :locals => { options[:form_builder_local] => f })
    end
  end

  def generate_template(form_builder, method, options = {})
    escape_javascript generate_html(form_builder, method, options)
  end

  def option_groups_from_collection_for_select_with_empty(collection, group_method, group_label_method, option_key_method, option_value_method, selected_key)
    '<option></option>'+option_groups_from_collection_for_select(collection, group_method, group_label_method, option_key_method, option_value_method, selected_key)
  end
end
