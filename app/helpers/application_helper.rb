module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Pilot App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def add_fields(f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields btn btn-default btn-sm", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_add_table_fields(name, f, association)
    if association == :headings
      to_render = "table_heading_fields"
    else
      to_render = "table_key_fields"
    end
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(to_render, f: builder)
    end
    link_to(name, '#', class: "add_fields btn btn-default btn-sm", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def add_table_value_fields(f)
    new_object = f.object.send(:paragraphs).klass.new
    id = new_object.object_id
    fields = f.fields_for(:paragraphs, new_object, child_index: id) do |builder|
      render("table_value_fields", f: builder)
    end
  end
end