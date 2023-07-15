<style>
	.donut2-legend>span {
		display: inline-block;
		margin-right: 30px;
		margin-bottom: 10px;
		font-size: 13px;
	}

	.donut2-legend>span:last-child {
		margin-right: 0;
	}

	.donut2-legend>span>i {
		display: inline-block;
		width: 15px;
		height: 15px;
		margin-right: 7px;
		margin-top: -3px;
		vertical-align: middle;
		border-radius: 1px;
	}

	.donut-legend>span {
		display: inline-block;
		margin-right: 30px;
		margin-bottom: 10px;
		font-size: 13px;
	}

	.donut-legend>span:last-child {
		margin-right: 0;
	}

	.donut-legend>span>i {
		display: inline-block;
		width: 15px;
		height: 15px;
		margin-right: 7px;
		margin-top: -3px;
		vertical-align: middle;
		border-radius: 1px;
	}

	.col {
		padding-top: 5px;
	}

	#donut2 {
		max-height: 280px;
		margin-top: 20px;
		margin-bottom: 20px;
	}

</style>
<section class='content'>
	<?php if ($this->ion_auth->is_admin()) : ?>
	<div class="row">
		<?php foreach ($info_box as $info) : ?>
		<div class="col-lg-3 col-xs-6">
			<div class="small-box bg-<?= $info->box ?>">
				<div class="inner">
					<h3><?= $info->total; ?></h3>
					<p><?= $info->title; ?></p>
				</div>
				<div class="icon">
					<i class="fa fa-<?= $info->icon ?>"></i>
				</div>
				<a href="<?= base_url() . strtolower($info->title); ?>" class="small-box-footer">
					More info <i class="fa fa-arrow-circle-right"></i>
				</a>
			</div>
		</div>
		<?php endforeach; ?>
	</div>
	<div class="row">
		<div class="col-md-6">
			<div class="box box-success">
				<div class="box-header with-border">
					<h3 class="box-title">Total Karyawan Berdasarkan Penempatan</h3>
					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool" data-widget="collapse"><i
								class="fa fa-minus"></i>
						</button>
					</div>
				</div>
				<div class="box-body chart-responsive">
					<div class="chart" id="donut-chart" style="height: 250px; position: relative;"></div>
					<br>
					<div id="legend" class="donut2-legend"></div>
				</div>
			</div>
		</div>


		<div class="col-md-6">
			<div class="box box-danger">
				<div class="box-header with-border">
					<h3 class="box-title">Total Karyawan Berdasarkan Jabatan</h3>
					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool" data-widget="collapse"><i
								class="fa fa-minus"></i>
						</button>
					</div>
				</div>
				<div class="box-body chart-responsive">
					<div class="chart" id="donut-chart2" style="height: 240px; position: relative;"></div>
					<br><br><br>
					<div id="legend2" class="donut-legend"></div><br>
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</div>
	<div>
		<script>
			// Menggunakan Morris.Bar
			$(document).ready(function () {
				var color_array1 = ['#03658C', '#63ad4a', '#F2594A', '#F28C4B', '#7E6F6A', '#36AFB2', '#9c6db2',
					'#d24a67', '#89a958', '#00739a', '#BDBDBD',
					'#16404c', '#16404c', '#17c6c3'
				];
				var donut2 = Morris.Donut({
					element: 'donut-chart',
					resize: true,

					colors: color_array1,
					data: [ <?php foreach($get_plot as $row) :?> {
							label: '<?php echo $row->nama_gedung ?>',
							value: <?php echo $row -> total_karyawan; ?> ,
						}, <?php endforeach; ?>
					],
					hideHover: 'auto'
				});

				donut2.options.data.forEach(function (label, i) {
					var legendItem = $('<div class="col"></div>').text(label['label'] + " ( " + label['value'] +
						" )").prepend('<i>&nbsp;</i>');
					legendItem.find('i')
						.css('backgroundColor', donut2.options.colors[i])
						.css('width', '20px')
						.css('display', 'inline-block')
						.css('margin-left', '0px')
						.css('padding-bottom', '5px');
					$('#legend').append(legendItem)
				});

				var color_array2 = ['#03658C', '#7CA69E', '#F2594A', '#F28C4B', '#7E6F6A', '#36AFB2', '#9c6db2',
					'#d24a67', '#89a958', '#00739a', '#BDBDBD'
				];
				var donut = new Morris.Donut({
					element: 'donut-chart2',
					resize: true,
					colors: color_array2,
					data: [ <?php foreach($get_plot2 as $row) :?> {
							label: '<?php echo $row->nama_jabatan ?>',
							value: <?php echo $row-> total_karyawan; ?> ,
						}, <?php endforeach; ?>
					],
					hideHover: 'auto'
				});

				donut.options.data.forEach(function (label, i) {
					var legendItem = $('<span></span>').text(label['label'] + " ( " + label['value'] + " )")
						.prepend('<i>&nbsp;</i>');
					legendItem.find('i')
						.css('backgroundColor', donut.options.colors[i])
						.css('width', '20px')
						.css('display', 'inline-block')
						.css('margin-left', '0px');
					$('#legend2').append(legendItem)
				});
			});

		</script>
	</div>
</section>

<?php else : ?>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-widget widget-user">
				<div class="widget-user-header bg-white-active">
					<center>
						<img class="img-circle" style="width:150px;"
							src="<?php echo base_url() ?>assets/images/logo.png">
					</center>
				</div>
				<div class="box-header">
					<p style="text-align: center;">
						<span style="font-family: georgia, palatino; font-size: 15pt;">History Absensi Karyawan</span>
					</p>
				</div>
				<button type="button" class="btn btn-info btn-lg btn-create-data btn3d pull-right" style="margin-right: 10px;" data-toggle="modal" data-target="#modal-default">
					<i class="fa fa-plus"></i>
					&nbsp;&nbsp; Absen Manual
				</button>
				<div class="pull-center" style="margin-left: 10px;">
					<a href="<?php echo base_url('scan')?>" class="btn btn-lg btn-primary"><i class="fa fa-camera"></i>
						&nbsp;&nbsp; SCAN</a>
				</div>
				<div class="box-body">
					<table id="presensi" class="table table-bordered table-hover display" style="width:100%;">
						<thead>
							<tr>
								<th class="all">No</th>
								<th class="all">Tanggal</th>
								<th class="desktop">Jam Masuk</th>
								<th class="desktop">Jam Keluar</th>
								<th class="desktop">Kehadiran</th>
								<th class="desktop">Keterangan</th>
								<th class="desktop">status </th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
                    <div class="modal fade" id="modal-default">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Form absen manual</h4>
                            </div>
                            <div class="modal-body">
                                <form id="formAbsenManual" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="tanggal">Tanggal</label>
                                        <input type="date" class="form-control" id="tgl_absen" name="tgl_absen" placeholder="Enter date">
                                    </div>
                                    <div class="form-group">
                                        <label for="kehadiran">Kehadiran</label>
                                        <select name="kehadiran" id="kehadiran" class="form-control">
                                            <option value="" selected="selected">-- Pilih --</option>
                                            <?php
                                                foreach ($kehadiran as $key) { ?>
                                                    <option value="<?= $key->id_khd?>"><?= $key->nama_khd?></option>
                                                <?php    
                                                }
                                            ?>
                                        </select>
                                    </div>
									<p id="slot_cuti">Sisa slot cuti anda : <?php echo $slot_cuti?></p>
                                    <div class="form-group">
                                        <label for="keterangan">Keterangan</label>         
                                        <textarea class="form-control" name="keterangan" id="keterangan" rows="2"></textarea>
                                    </div>
                                    <div class="form-group" id="upload_file">
                                        <label for="file">Upload file</label>
                                        <input type="file" class="form-control" id="file" name="file">
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" id="btnSave">Save changes</button>
                            </div>
                        </div>
                    </div>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
    let base_url = '<?= base_url() ?>';
    let id_karyawan = '<?= $karyawan ?>';
	let slot_cuti = '<?= $slot_cuti ?>';
    console.log(id_karyawan);
	var id;
    let gedung = 'GRAHA AASI';                                            
    $(document).ready(function() {
        $('#upload_file').css('visibility', 'hidden');
		$('#slot_cuti').css('visibility', 'hidden');
        var isUploadFile = false;
        $('#kehadiran').change(function() {
            id = $(this).val();
			console.log(id);
            if (id == 5) {
                $('#upload_file').css('visibility', 'hidden');
				$('#slot_cuti').css('visibility', 'hidden');
            }  else {
				$('#upload_file').css('visibility', 'visible');
				$('#slot_cuti').css('visibility', 'visible');
                $('#file').on('change', function() {
                    let allowFile = ['jpg', 'jpeg','png','pdf']
                    let extension = this.files[0].type.split('/')[1]
                    if (allowFile.indexOf(extension) == -1 || this.files[0].size >= 4000000 )  {
                        Swal.fire({
                            type: 'info',
                            title: 'Oops...',
                            text: 'Format file tidak sesuai atau file terlalu besar!',
                            footer: '<a href="<?php echo base_url('dashboard') ?>">Why do I have this issue?</a>'
                        })
                        $('#btnSave').prop('disabled', true)
                    }
                })
            }
        });
        $('#btnSave').on('click', function(e) {
            e.preventDefault();
			console.log("id berapa " + id);
			if (id == 2 || id == 3 || id == 6) {
				if (id == 6 && slot_cuti < 0) {
					Swal.fire({
						type: 'info',
						title: 'Oops...',
						text: 'Cuti anda sudah habis!',
						footer: '<a href="<?php echo base_url('dashboard') ?>">Why do I have this issue?</a>'
               		})
                	$('#btnSave').prop('disabled', true)	
				} else if ($('#file')[0].files.length === 0) {
					Swal.fire({
						type: 'info',
						title: 'Oops...',
						text: 'File wajib diisi!',
						footer: '<a href="<?php echo base_url('dashboard') ?>">Why do I have this issue?</a>'
               		})
                	$('#btnSave').prop('disabled', true)	
				}
			} else if (!$('#tgl_absen').val() && !$('#kehadiran').val()) {
                Swal.fire({
                    type: 'info',
                    title: 'Oops...',
                    text: 'Tanggal dan kehadiaran tidak boleh kosong',
                    footer: '<a href="<?php echo base_url('dashboard') ?>">Why do I have this issue?</a>'
                })
                $('#btnSave').prop('disabled', true)
            } else if (!$('#tgl_absen').val()) {
                Swal.fire({
                    type: 'info',
                    title: 'Oops...',
                    text: 'Tanggal tidak boleh kosong',
                    footer: '<a href="<?php echo base_url('dashboard') ?>">Why do I have this issue?</a>'
                })
                $('#btnSave').prop('disabled', true)
            } else if (!$('#kehadiran').val()) {
                Swal.fire({
                    type: 'info',
                    title: 'Oops...',
                    text: 'Kehadiran tidak boleh kosong',
                    footer: '<a href="<?php echo base_url('dashboard') ?>">Why do I have this issue?</a>'
                })
                $('#btnSave').prop('disabled', true)
            } else {
                var formData = new FormData();
                let test = $('#file')[0].files[0];
                let tglAbsen = $('#tgl_absen').val();
                let kehadiran = $('#kehadiran option:selected').val();
                let keterangan = $('textarea#keterangan').val();
				if (kehadiaran == 6) {
					formData.append('ambil_cuti', 1)
				}
                formData.append('image', test); 
                formData.append('tgl_absen', tglAbsen)
                formData.append('kehadiran', kehadiran)
                formData.append('keterangan', keterangan)
                formData.append('id_karyawan', id_karyawan)
                $.ajax({
                    type: "POST",
                    url: base_url + "dashboard/absen_manual",
                    contentType: false,
                    async: true,
                    data: formData,
                    dataType: 'JSON',
                    processData: false,
                    success: function (data) {
                        console.log(data);
                        Swal.fire({
                            'title': "Berhasil absen manual",
                            'type': "success",
                            confirmButtonText: 'OK'
                        }).then((result) => {
                            if (result.value) {
                               location.reload(); 
                            }
                        })
                        // console.log(data)
                    }
                })
            }
        })
    });                                            
</script>
<script src="<?php echo base_url() ?>assets/app/datatables/presensi3.js" charset="utf-8"></script>
<?php endif; ?>