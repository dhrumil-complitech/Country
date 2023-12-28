class StateDatatable < AjaxDatatablesRails::ActiveRecord
  self.nulls_last = true
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      country_id: { source: "State.country.name", cond: :eq },
      name: { source: "State.name", cond: :like, searchable: true, orderable: true },
      abbreviation: { source: "State.abbreviation",  cond: :like, searchable: true },
      capital: { source: "State.capital",  cond: :like, searchable: true },
      is_active: { source: "State.is_active" },
      action: { source: "", searchable: false, orderable: false },
    }
  end

  def data
    records.map do |record|
      {
        # example:
        # id: record.id,
        # name: record.name
        country_id: record.country.name,
        name: record.name,
        abbreviation: record.abbreviation,
        capital: record.capital,
        is_active: record.is_active,
        action: action(record),
      }
    end
  end

  def get_raw_records
    # insert query here
    # User.all
    State.includes(:country)
  end

  def action(record)
    html = <<-HTML
      <div class="d-inline-flex">
        <div class="dropdown">
          <a href="#" class="text-body" data-bs-toggle="dropdown">
            <i class="ph-list"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-end">
            <a href="#{state_path(record)}" class="dropdown-item">Show</a>
            <a href="#{edit_state_path(record)}" class="dropdown-item">Edit</a>
            <a href="#{state_path(record)}" class="dropdown-item" onclick="return confirm('Are you sure?');" data-turbo-confirm="Are you sure?" data-turbo-method="delete" data-method="delete">Destroy</a>
          </div>
        </div>
      </div>
    HTML
    html.html_safe
  end
  
  private
  
  def state_path(record)
  
    "/states/#{record.id}"
  end
  
  def edit_state_path(record)
    "/states/#{record.id}/edit"
  end

end
