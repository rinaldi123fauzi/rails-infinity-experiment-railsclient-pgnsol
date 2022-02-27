$(document).ready(function () {
    // Setup - add a text input to each footer cell
    $('#table thead tr')
        .clone(true)
        .addClass('filters')
        .appendTo('#table thead');

    var table = $("#table").DataTable({
        orderCellsTop: true,
        dom: "lrtp",
        scrollX: true,
        fixedHeader: true,
        // pagingType": "simple_numbers",
        // pageLength: 10, 
        initComplete: function () {
            var api = this.api();

            // For each column
            api
              .columns()
              .eq(0)
              .each(function (colIdx) {
                // Set the header cell to contain the input element
                var cell = $(".filters th").eq(
                  $(api.column(colIdx).header()).index()
                );
                var title = $(cell).text();
                $(cell).html('<input type="text" placeholder="' + title + '" />');

                // On every keypress in this input
                $(
                  "input",
                  $(".filters th").eq($(api.column(colIdx).header()).index())
                )
                  .off("keyup change")
                  .on("keyup change", function (e) {
                    e.stopPropagation();

                    // Get the search value
                    $(this).attr("title", $(this).val());
                    var regexr = "({search})"; //$(this).parents('th').find('select').val();
                    var cursorPosition = this.selectionStart;
                  // Search the column for that value
                  api
                    .column(colIdx)
                    .search(
                      this.value != ""
                        ? regexr.replace("{search}", "(((" + this.value + ")))")
                        : "",
                      this.value != "",
                      this.value == ""
                    )
                    .draw();

                  $(this)
                    .focus()[0]
                    .setSelectionRange(cursorPosition, cursorPosition);
                });
            });
        },
});
table.columns.adjust().draw();
});
// Untuk Master Data (Scrolling Prev/Next)
$("#masterData").DataTable({
    scrollX: true,
  });
//Loading
  $(document).on("turbolinks:click", function () {
    $("#spinner").show();
  });

  $(document).on("turbolinks:load", function () {
    $("#spinner").hide();
  });
