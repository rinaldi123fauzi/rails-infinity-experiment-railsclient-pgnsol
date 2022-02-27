$(document).on('turbolinks:load', function() {
    autocomplete_project();
    function autocomplete_project() {
        $("#autocomplete_project").autocomplete({
            classes: {
                "ui-autocomplete": "highlight"
            },
            source: '/search_kode_proyek_for_project',
            minLength: 2,
            select: function (event, ui) {
                let l = ui.item.label;
                $(this).val(l)
                vendor_map_value(ui.item)
                return false;
            }
        });
    }

    function vendor_map_value(p) {
        reset_project_value();
        $(".p_kode_proyek").val(p.p_kode_proyek);
        $(".p_nama_proyek").val(p.p_nama_proyek);
        $(".p_kode_akun").val(p.p_kode_akun);
        $(".p_nama_akun").val(p.p_nama_akun);
    }

    function reset_project_value() {
        $('.p_kode_proyek').val('');
        $('.p_nama_proyek').val('');
        $('.p_kode_akun').val('');
        $('.p_nama_akun').val('');
    }
});