class <%= class_name %> < <%= parent_class_name.classify %>
<% attributes.select {|attr| attr.reference? }.each do |attribute| -%>
  belongs_to :<%= attribute.name %>
<% end -%>
<% attributes.select {|attr| [:has_one, :has_many].include?(attr.type) }.each do |attribute| -%>
  <%= attribute.type %> :<%= attribute.name %>
<% end -%>
<% if options[:modified_by] -%>
  belongs_to :modified_by, :class_name => "User"
  validates :modified_by_id, :presence => true
<% end -%>
<% if options[:singleton] -%>
  def self.instance
    self.first || self.new
  end
<% end -%>
<% unless options[:singleton] -%>

  def self.options
    {
<% except = []
    except = [:created_at, :updated_at] if options[:timestamps]
    except << :modified_by_id if options[:modified_by] -%>
      :except => <%= except.inspect %>
    }
  end
<% end -%>

  def self.single_options
    {
<% if options[:modified_by] -%>
      :except => [:modified_by_id],
<% end -%>
<% if options[:modified_by] || attributes.select {|attr| attr.reference? }.size > 0 -%>
      :include => {
<% if options[:modified_by] -%>
        :modified_by => {
          :only => [:id, :login, :name]
        }<% end -%><% attributes.select {|attr| attr.reference? }.each do |attribute| -%>,
        :<%= attribute.name %> => {
          :except => [:created_at, :updated_at, :modified_by_id]
        }<% end %>
      }
<% end -%>
    }
  end
end
