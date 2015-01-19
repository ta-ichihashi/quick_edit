#coding: utf-8

module ApplicationHelper
   def quick_edit_link_to(bulk_update_url, issue_ids, caption, target_field, field_type, default_value, disabled)
      help_message= l(:text_edit_confirm)

      case field_type.to_s
      when "string", "text"
         pattern = ''
      when "int"
         pattern = '\d+'
      when "date"
         pattern = '\d{4}-\d{2}-\d{2}'
         help_message += " (yyyy-mm-dd)"
      end

      pattern = h(pattern.gsub(/\\/,'\\\\\\\\'))

      bulk_update_url_escaped = URI.encode_www_form_component(bulk_update_url)

      issue_ids_js_string = "[" + @issue_ids.join(",") + "]"

      sprintf('<li>%s%s</li>',
         context_menu_link(
            h(caption),
            "javascript:quick_edit_show_input_dialog('#{bulk_update_url_escaped}', #{issue_ids_js_string}, '#{caption}', '#{target_field}', '#{field_type}', '#{pattern}', '#{help_message}', '#{default_value}')",
            :class => 'icon-edit',
            :disabled => disabled
         ),
         context_menu_link(
            h(:dummy),
            '#',
            :id => 'context_edit_update_link_%s' % target_field.to_s().tr('[]','__'),
            :style=>'display:none',
            :method => :post,
         )
      ).html_safe()
   end   
end

