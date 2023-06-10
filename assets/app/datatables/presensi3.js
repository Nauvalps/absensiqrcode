let table;

$(document).ready(function () {
    table = $("#presensi").addClass('nowrap').DataTable({
        responsive: true,
        processing: true,
        serverSide: true,
        colReorder: true,
        oLanguage: {
            sProcessing: "loading..."
        },
        lengthMenu: [
            [10, 25, 50, -1],
            ['10', '25', '50', 'Show all']
        ],
        "order": [[0, 'asc']],
        ajax: {
            "url": base_url + "dashboard/data/" + id_karyawan,
            "type": "POST",
        },
        columns:
            [
                { 'data': 'id_absen', defaultContent: '' },
                { "data": "tgl" },
                { "data": "jam_msk" },
                { "data": "jam_klr" },
                { "data": "nama_khd" },
                { "data": "ket" },
                { "data": "nama_status" },
            ],
        "columnDefs": [
            {
                "data": {
                    "id_absen": "id_absen",
                },
                "targets": 6,
                "orderable": false,
                "searchable": false
            },
        ],
        "createdRow": function (row, data, index) {
            console.log(data);
            if (data.id_status == 1) {
                $('td', row).eq(6).html('<span class="label label-success">' + data.nama_status + '</span>');
            }
            else if (data.id_status == 2) {
                $('td', row).eq(6).html('<span class="label label-danger">' + data.nama_status + '</span>');
            }
            else {
                $('td', row).eq(6).html('<span class="label label-default">' + data.nama_status + '</span>');
            }
            if (data.id_khd == 1) {
                $('td', row).eq(4).html('<span class="label label-success">' + data.nama_khd + '</span>');
            }
            else if (data.id_khd == 2) {
                $('td', row).eq(4).html('<span class="label label-info">' + data.nama_khd + '</span>');
            }
            else if (data.id_khd == 3) {
                $('td', row).eq(4).html('<span class="label label-warning">' + data.nama_khd + '</span>');
            }
            else if (data.id_khd == 4) {
                $('td', row).eq(4).html('<span class="label label-danger">' + data.nama_khd + '</span>');
            }
            else if (data.id_khd == 5) {
                $('td', row).eq(4).html('<span class="label label-danger">' + data.nama_khd + '</span>');
            }
            else if (data.id_khd == 6) {
                $('td', row).eq(4).html('<span class="label label-danger">' + data.nama_khd + '</span>');
            }
            else if (data.id_khd == 7) {
                $('td', row).eq(4).html('<span class="label label-danger">' + data.nama_khd + '</span>');
            }
            else {
                $('td', row).eq(4).html('<span class="label label-default">' + data.nama_khd + '</span>');
            }
        },
        rowId: function (a) {
            return a;
        },
        rowCallback: function (row, data, iDisplayIndex) {
            var info = this.fnPagingInfo();
            var page = info.iPage;
            var length = info.iLength;
        },
    });
    table.on('order.dt search.dt', function () {
        table.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1;
            table.cell(cell).invalidate('dom');
        });
    }).draw();
});
