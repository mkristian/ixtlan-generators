
c = Configuration.new
<% if options[:modified_by] -%>
  c.modified_by_id = 0
<% end -%>
<% if defined? Ixtlan::Errors -%>
c.errors_keep_dumps = 30
<% end -%>
<% if defined? Ixtlan::Sessions -%>
c.idle_session_timeout = 15
<% end -%>
<% if defined? Ixtlan::Audit -%>
c.audits_keep_logs = 90
<% end -%>
c.save
