// users.js

jQuery(document).ready(function() {
    $('#states-datatable').dataTable({
      "processing": true,
      "serverSide": true,
      "ajax": {
        "url": $('#states-datatable').data('source')
      },
      "pagingType": "full_numbers",
      "columns": [
        {"data": "country_id"},
        {"data": "name"},
        {"data": "abbreviation"},
        {"data": "capital"},
        {"data": "is_active"},
        {"data": "action"}
        
      ]
      // pagingType is optional, if you want full pagination controls.
      // Check dataTables documentation to learn more about
      // available options.
    });
  });