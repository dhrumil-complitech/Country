class CountryDatatable < AjaxDatatablesRails::ActiveRecord
self.nulls_last = true,
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      name: { source: "Country.name", cond: :like, searchable: true, orderable: true },
      code: { source: "Country.code", cond: :like, searchable: true, orderable: true },
      is_active:   { source: "Country.is_active",  cond: :like, nulls_last: true },
      action: {source:"",searchable: false, orderable: false}

      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        name: record.name,
        code: record.code,
        is_active: record.is_active,
        action: action(record),
       

        # example:
        # id: record.id,
        # name: record.name
      }
    end
  end

  def get_raw_records

    Country.all
    # insert query here
    # User.all
  end


  def action(record)
    html = <<-HTML
      <div class="d-inline-flex">
        <div class="dropdown">
          <a href="#" class="text-body" data-bs-toggle="dropdown">
            <i class="ph-list"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-end">
            <a href="#{country_path(record)}" class="dropdown-item">Show</a>
            <a href="#{edit_country_path(record)}" class="dropdown-item">Edit</a>
            <a href="#{country_path(record)}" class="dropdown-item" onclick="return confirm('Are you sure?');" data-turbo-confirm="Are you sure?" data-turbo-method="delete" data-method="delete">Destroy</a>
          </div>
        </div>
      </div>
    HTML
    html.html_safe
  end
  
  private
  
  def country_path(record)
  
    "/countries/#{record.id}"
  end
  
  def edit_country_path(record)
    "/countries/#{record.id}/edit"
  end
end
