// $(document).on('turbolinks:load', function() {

nama_proyek()

function nama_proyek() {
    $('.selectProject').change(function () {
        resetprojectCodeData();
        if ($(this).val() != '') {
            const e = JSON.parse($(this).val());
            $('.nama-proyek').val(e[0].projectName);
            $('#kode_proyek_id').val(e[0].projectCode);
        }
    });
}

function resetprojectCodeData() {
    $('.nama-proyek').val('');
    $('#kode_proyek_id').val('');
}