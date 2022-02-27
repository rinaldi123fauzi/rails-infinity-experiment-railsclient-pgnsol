$(document).on('turbolinks:load', function() {
    autocomplete_maintenance();

    function autocomplete_maintenance() {
        $("#autocomplete_maintenance").autocomplete({
            classes: {
                "ui-autocomplete": "highlight"
            },
            source: '/kode_proyek_for_maintenance',
            minLength: 2,
            select: function (event, ui) {
                let l = ui.item.label;
                $(this).val(l)
                maintenance_asset_value(ui.item)
                return false;
            }
        });
    }

    function maintenance_asset_value(m) {
        reset_maintenance_asset_value();
        $(".ma_kode_proyek").val(m.v_kode_proyek);
        $(".ma_nama_proyek").val(m.v_nama_proyek);
        $(".ma_kode_akun").val(m.v_kode_akun);
        $(".ma_nama_akun").val(m.v_nama_akun);
    }

    function reset_maintenance_asset_value() {
        $(".ma_kode_proyek").val('');
        $('.ma_nama_proyek').val('');
        $('.ma_kode_akun').val('');
        $('.ma_nama_akun').val('');
    }
});