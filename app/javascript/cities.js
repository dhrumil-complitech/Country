// users.js

jQuery(document).ready(function() {
    $('#cities-datatable').dataTable({
      "processing": true,
      "serverSide": true,
      "ajax": {
        "url": $('#cities-datatable').data('source')
      },
      "pagingType": "full_numbers",
      "columns": [
        {"data": "country_id"},
        {"data": "state_id"},
        {"data": "name"},
        {"data": "zip"},
        {"data": "population"},
        {"data": "action"}
        
      ]
      // pagingType is optional, if you want full pagination controls.
      // Check dataTables documentation to learn more about
      // available options.
    });
  });