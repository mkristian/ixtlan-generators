class <%= controller_class_name %>Controller < ApplicationController
 
  before_filter :cleanup_params

  private

  def cleanup_params
    # compensate the shortcoming of the incoming json/xml
    model = params[:<%= singular_table_name %>] || []
<% if options[:timestamps] -%>
    model.delete :created_at
    <% if options[:optimistic] -%>params[:updated_at] ||= <% end -%>model.delete :updated_at
<% if options[:optimistic] -%>
  end

  def stale?
    if @<%= singular_table_name %>.nil?
      @<%= singular_table_name %> = <%= class_name %>.instance
      respond_to do |format|
        format.html { render :action => "edit" }
        format.xml  { render :xml => nil, :status => :conflict }
        format.json  { render :json => nil, :status => :conflict }
      end
      true
    end
<% end -%>
<% end -%>
  end

  public

  # GET <%= route_url %>
  # GET <%= route_url %>.xml
  # GET <%= route_url %>.json
  def show
    @<%= singular_table_name %> = <%= class_name %>.instance

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @<%= singular_table_name %>.to_xml(<%= class_name %>.single_options) }
      format.json  { render :json => @<%= singular_table_name %>.to_json(<%= class_name %>.single_options) }
    end
  end

  # GET <%= route_url %>/edit
  def edit
    @<%= singular_table_name %> = <%= class_name %>.instance
  end

  # PUT <%= route_url %>
  # PUT <%= route_url %>.xml
  # PUT <%= route_url %>.json
  def update
<% if options[:optimistic] && options[:timestamps] -%>
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:updated_at], #{class_name}.instance.id").sub(/\.(get|find)/, '.optimistic_\1') %>

    return if stale?
<% else -%>
    @<%= singular_table_name %> = <%= class_name %>.instance
<% end -%>
<% if options[:modified_by] -%>

    params[:<%= singular_table_name %>] ||= {}
    params[:<%= singular_table_name %>][:modified_by] = current_user
<% end -%>

    respond_to do |format|
<%  orm_class # to set inner state - upstream bug -%>
      if @<%= orm_instance.update_attributes("params[:#{singular_table_name}]") %>
        format.html { redirect_to(<%= singular_table_name %>_path, :notice => '<%= human_name %> was successfully updated.') }
        format.xml  { render :xml => @<%= singular_table_name %>.to_xml(<%= class_name %>.single_options) }
        format.json  { render :json => @<%= singular_table_name %>.to_json(<%= class_name %>.single_options) }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @<%= orm_instance.errors %>, :status => :unprocessable_entity }
        format.json  { render :json => @<%= orm_instance.errors %>, :status => :unprocessable_entity }
      end
    end
  end
end
