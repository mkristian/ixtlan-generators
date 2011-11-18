# dynamic configuration through a Configuration singleton model

# configuration model
# -------------------
# <%= application_name %>::Application.config.configuration_model = :my_configuration # default :configuration
<% if defined? Ixtlan::Errors -%>

# notification email on errors and dump directory for the system dump
# the error dumps will be cleanup after the days to keeps dump expired
# --------------------------------------------------------------------
<%= application_name %>::Application.config.configuration_manager.register("error_dumper") do |config|
  <%= application_name %>::Application.config.error_dumper.base_url = config.errors_base_url
  <%= application_name %>::Application.config.error_dumper.from_email = config.errors_from_email
  <%= application_name %>::Application.config.error_dumper.to_emails = config.errors_to_emails
  <%= application_name %>::Application.config.error_dumper.keep_dumps = config.errors_keep_dumps || 30 # days
end
<% end -%>
<% if defined? Ixtlan::Sessions -%>

# idle session timeout configuration (in minutes)
# -----------------------------------------------
<%= application_name %>::Application.config.configuration_manager.register("session_idle_timeout") do |config|
  <%= application_name %>::Application.config.idle_session_timeout = config.idle_session_timeout || 15
end
<% end -%>
<% if defined? Ixtlan::Audit -%>

# audit log manager
# -----------------

# <%= application_name %>::Application.config.audit_manager.model = :my_audit # default: :audit
# <%= application_name %>::Application.config.audit_manager.username_method = :username # default: :login

<%= application_name %>::Application.config.configuration_manager.register("audit_manager") do |config|
  <%= application_name %>::Application.config.audit_manager.keep_logs = config.audits_keep_logs || 90 # days
end
<% end -%>
