#coding: utf-8

class QuickEditHooks < Redmine::Hook::ViewListener
	render_on :view_layouts_base_html_head, :partial=> 'hooks/head'
	render_on :view_issues_context_menu_end, :partial=> 'hooks/context'
end
