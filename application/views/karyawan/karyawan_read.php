<!-- Main content -->
<section class='content'>
    <div class='row'>
        <div class='col-xs-12'>
            <div class="box box-success">
                <div class='box-header with-border'>
                    <h3 class='box-title'>Karyawan Read</h3>
                </div>
                <div class="box-body">
                    <table class="table table-bordered">
                        <tr>
                            <td>Kode Karyawan</td>
                            <td><?php echo $id_karyawan; ?></td>
                        </tr>
                        <tr>
                            <td>No KTP</td>
                            <td><?php echo $no_ktp; ?></td>
                        </tr>
                        <tr>
                            <td>No KK</td>
                            <td><?php echo $nik; ?></td>
                        </tr>
                        <tr>
                            <td>Nama Karyawan</td>
                            <td><?php echo strtoupper($nama_karyawan); ?></td>
                        </tr>
                        <tr>
                            <td>Tempat dan Tanggal Lahir</td>
                            <td><?php echo strtoupper($tmp_lahir); ?>, <?php echo date('d M Y', strtotime($tgl_lahir)); ?></td>
                        </tr>
                        <tr>
                            <td>Jenis Kelamin</td>
                            <td><?php echo $jenis_kelamin; ?></td>
                        </tr>
                        <tr>
                            <td>Golongan Darah</td>
                            <td><?php echo $goldar; ?></td>
                        </tr>
                        <tr>
                            <td>Agama</td>
                            <td><?php echo $agama; ?></td>
                        </tr>
                        <tr>
                            <td>Alamat KTP</td>
                            <td><?php echo strtoupper($alamat_ktp); ?></td>
                        </tr>
                        <tr>
                            <td>Alamat Domisili</td>
                            <td><?php echo strtoupper($domisili); ?></td>
                        </tr>
                        <tr>
                            <td>No Telepon</td>
                            <td><?php echo $no_telp; ?></td>
                        </tr>
                        <tr>
                            <td>No Kantor</td>
                            <td><?php echo $telp_kantor; ?></td>
                        </tr>
                        <tr>
                            <td>No Kerabat (Hubungan)</td>
                            <td><?php echo $telp_kerabat; ?> (<?= strtoupper($hub_kerabat); ?>)</td>
                        </tr>
                        <tr>
                            <td>Jabatan</td>
                            <td><?php echo $nama_jabatan; ?></td>
                        </tr>                        
                        <tr>
                            <td>Lokasi</td>
                            <td><?php echo $nama_gedung; ?></td>
                        </tr>
                        <tr>
                            <td>Foto</td>
                            <td><img src="<?= base_url('uploads/user_pict/' . $user_pict); ?>" width="150"></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:center;"><a href="<?php echo site_url('karyawan') ?>" class="btn-xs btn btn-primary">Kembali</a></td>
                        </tr>
                    </table>
                </div><!-- /.box-body -->
            </div>
        </div><!-- /.box -->
    </div><!-- /.col -->
</section><!-- /.content -->