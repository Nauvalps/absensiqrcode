<!-- Main content -->
<section class='content'>
    <div class='row'>
        <div class='col-xs-12'>
            <div class='box box-<?=$box;?>'>
                <div class='box-header  with-border'>
                    <h3 class='box-title'>FORMULIR ANGGOTA</h3>
                </div>
                <div class="box-body">                
                    <form role="form" enctype="multipart/form-data" id="myForm" data-toggle="validator" action="<?php echo $action; ?>" method="post">
                        <div class="form-group">
                            <label for="no_ktp" class="control-label">No KTP</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="no_ktp" id="no_ktp" data-error="Nomor KTP harus diisi" placeholder="Nomor KTP" value="<?php echo $no_ktp; ?>" required />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                </span>
                            </div>
                            <div class="help-block with-errors"></div>
                            <?php echo form_error('no_ktp') ?>
                        </div>
                        <div class="form-group">
                            <label for="nik" class="control-label">NIK</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="nik" id="nik" data-error="NIK harus diisi" placeholder="Nomor NIK" value="<?php echo $nik; ?>" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                </span>
                            </div>
                            <div class="help-block with-errors"></div>
                            <?php echo form_error('nik') ?>
                        </div>
                        <div class="form-group">
                            <label for="cuti" class="control-label">Slot Cuti</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="cuti" id="cuti"  placeholder="Slot cuti karyawan"/>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                </span>
                            </div>
                            <!-- <div class="help-block with-errors"></div>
                            <?php echo form_error('cuti') ?> -->
                        </div>
                        <div class="form-group">
                            <label for="nama_karyawan" class="control-label">Nama Karyawan</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="nama_karyawan" id="nama_karyawan" data-error="Nama Anggota harus diisi" placeholder="Nama Karyawan" value="<?php echo $nama_karyawan; ?>" required />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                </span>
                            </div>
                            <div class="help-block with-errors"></div>
                            <?php echo form_error('nama_karyawan') ?>
                        </div>
                        <div class="form-group">
                            <label for="tmp_lahir" class="control-label">Tempat Lahir</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="tmp_lahir" id="tmp_lahir" data-error="Tempat Lahir harus diisi" placeholder="Tempat Lahir dengan Huruf Kapital" value="<?php echo $tmp_lahir; ?>" required />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-map-marker"></span>
                                </span>
                            </div>
                            <div class="help-block with-errors"></div>
                            <?php echo form_error('tmp_lahir') ?>
                        </div>
                        <div class="form-group">
                            <label for="tgl_lahir" class="control-label">Tanggal Lahir</label>
                            <div class="input-group">
                                <input type="date" class="form-control" name="tgl_lahir" id="tgl_lahir" data-error="Tanggal Lahir harus diisi" placeholder="Tanggal Lahir" value="<?php echo $tgl_lahir; ?>" required />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                            <div class="help-block with-errors"></div>
                            <?php echo form_error('tgl_lahir') ?>
                        </div>
                        <div class="form-group">
                            <label for="jenis_kelamin" class="control-label">Jenis Kelamin</label>
                            <div class="input-group">
                            <?php echo cmb_dinamis('jenis_kelamin', 'jenis_kelamin', 'jenis_kelamin', 'jenis_kelamin', 'jenis_kelamin', $jenis_kelamin) ?>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                </span>
                            </div>
                            <div class="help-block with-errors"></div>
                            <?php echo form_error('jenis_kelamin') ?>
                        </div>
                        <div class="form-group">
                            <label for="goldar" class="control-label">Golongan Darah</label>
                            <div class="input-group">
                            <?php echo cmb_dinamis('goldar', 'goldar', 'goldar', 'goldar', 'goldar', $goldar) ?>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                </span>
                            </div>
                            <div class="help-block with-errors"></div>
                            <?php echo form_error('goldar') ?>
                        </div>
                        <div class="form-group">
                            <label for="agama" class="control-label">Agama</label>
                            <div class="input-group">
                            <?php echo cmb_dinamis('agama', 'agama', 'agama', 'agama', 'agama', $agama) ?>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                </span>
                            </div>
                            <div class="help-block with-errors"></div>
                            <?php echo form_error('agama') ?>
                        </div>
                        <div class="form-group">
                            <label for="alamat_ktp" class="control-label">Alamat Sesuai KTP</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="alamat_ktp" id="alamat_ktp" data-error="Alamat KTP harus diisi" placeholder="Alamat Lengkap KTP" value="<?php echo $alamat_ktp; ?>" required />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-map-marker"></span>
                                </span>
                            </div>
                            <div class="help-block with-errors"></div>
                            <?php echo form_error('alamat_ktp') ?>
                        </div>
                        <div class="form-group">
                            <label for="domisili" class="control-label">Alamat Domisili</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="domisili" id="domisili" data-error="Alamat Domisili harus diisi" placeholder="Alamat Lengkap Domisili" value="<?php echo $domisili; ?>" required />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-map-marker"></span>
                                </span>
                            </div>
                            <div class="help-block with-errors"></div>
                            <?php echo form_error('domisili') ?>
                        </div>
                        <div class="form-group">
                            <label for="no_telp" class="control-label">No Telepon</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="no_telp" id="no_telp" data-error="Nomor Telepon harus diisi" placeholder="Nomor diawali 0" value="<?php echo $no_telp; ?>" required/>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-phone"></span>
                                </span>
                            </div>
                            <div class="help-block with-errors"></div>
                            <?php echo form_error('no_telp') ?>
                        </div>
                        <div class="form-group">
                            <label for="telp_kantor" class="control-label">No Kantor</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="telp_kantor" id="telp_kantor" data-error="Nomor Telepon harus diisi" placeholder="Nomor diawali 0" value="<?php echo $telp_kantor; ?>" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-phone"></span>
                                </span>
                            </div>
                            <div class="help-block with-errors"></div>
                            <?php echo form_error('telp_kantor') ?>
                        </div>
                        <div class="form-group">
                            <label for="telp_kerabat" class="control-label">No Kerabat</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="telp_kerabat" id="telp_kerabat" data-error="Nomor Telepon harus diisi" placeholder="Nomor diawali 0" value="<?php echo $telp_kerabat; ?>" required/>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-phone"></span>
                                </span>
                            </div>
                            <div class="help-block with-errors"></div>
                            <?php echo form_error('telp_kerabat') ?>
                        </div>
                        <div class="form-group">
                            <label for="hub_kerabat" class="control-label">Jenis Hubungan Kerabat</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="hub_kerabat" id="hub_kerabat" data-error="Hubungan Kerabat harus diisi" placeholder="Hubungan Kerabat" value="<?php echo $hub_kerabat; ?>" required/>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                </span>
                            </div>
                            <div class="help-block with-errors"></div>
                            <?php echo form_error('hub_kerabat') ?>
                        </div>                        
                        <div class="form-group">
                            <label for="jabatan" class="control-label">Jabatan</label>
                            <div class="input-group">
                                <?php echo cmb_dinamis('jabatan', 'jabatan', 'jabatan', 'nama_jabatan', 'id_jabatan', $jabatan) ?>
                                <span class="input-group-addon">
                                    <span class="fas fa-briefcase"></span>
                                </span>
                            </div>
                            <?php echo form_error('jabatan') ?>
                        </div>
                        <div class="form-group">
                            <label for="gedung_id" class="control-label">Penempatan</label>
                            <div class="input-group">
                                <?php echo cmb_dinamis('gedung_id', 'gedung_id', 'gedung', 'nama_gedung', 'gedung_id', $gedung_id) ?>
                                <span class="input-group-addon">
                                    <span class="fas fa-location-arrow"></span>
                                </span>
                            </div>
                            <?php echo form_error('gedung') ?>
                        </div>                        
                        <div class="form-group">
                            <label for="user_pict" class="control-label">Upload Foto</label>                            
                            <div class="input-group">
                                <div class="col-md-4">
                                    <img src="<?= base_url('uploads/user_pict/') . $user_pict; ?>" class="img-thumbnail">
                                </div>
                                <input type="file" class="form-control" name="user_pict" id="user_pict" data-error="Foto harus diisi" placeholder="Upload Foto" value="<?php echo $user_pict; ?>"/>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-picture"></span>
                                </span>
                            </div>
                            <div class="help-block with-errors"></div>
                        </div>
                        <!-- <input type="hidden" name="old_image" id="old_image" value="<?php echo $user_pict; ?>"/>                         -->
                        <div class="form-group">
                            <input type="hidden" name="id" value="<?php echo $id; ?>" />
                        </div>
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary btn-lg btn3d"><?php echo $button ?></button>
                            <a href="<?php echo site_url('karyawan') ?>" class="btn btn-default btn-lg btn3d">Cancel</a>
                        </div>
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</section><!-- /.content -->