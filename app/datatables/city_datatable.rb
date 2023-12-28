class CityDatatable < AjaxDatatablesRails::ActiveRecord
  self.nulls_last = true
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      country_id: { source: "City.country.name", cond: :eq },
      state_id: { source: "City.state.name", cond: :eq },
      name: { source: "City.name", cond: :like, searchable: true, orderable: true },
      zip: { source: "City.zip", cond: :like, nulls_last: true },
      population: { source: "City.population" },
      action: { source: "", searchable: false, orderable: false },
      # id: { source: "User.id", cond: :eq },

      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        country_id: record.country.name,
        state_id: record.state.name,
        name: record.name,
        zip: record.zip,
        population: record.population,
        action: action(record),
        # example:
        # id: record.id,
        # name: record.name
      }
    end
  end

  def get_raw_records
    # insert query here
    # User.all
    City.all
  end

  def action(record)
    html = <<-HTML
      <div class="d-inline-flex">
        <div class="dropdown">
          <a href="#" class="text-body" data-bs-toggle="dropdown">
            <i class="ph-list"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-end">
            <a href="#{city_path(record)}" class="dropdown-item">Show</a>
            <a href="#{edit_city_path(record)}" class="dropdown-item">Edit</a>
            <a href="#{city_path(record)}" class="dropdown-item" onclick="return confirm('Are you sure?');" data-turbo-confirm="Are you sure?" data-turbo-method="delete" data-method="delete">Destroy</a>
          </div>
        </div>
      </div>
    HTML
    html.html_safe
  end
  
  private
  
  def city_path(record)
  
    "/cities/#{record.id}"
  end
  
  def edit_city_path(record)
    "/cities/#{record.id}/edit"
  end

end
