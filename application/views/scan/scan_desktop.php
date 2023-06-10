<style media="screen">
.btn-md {
    padding: 1rem 2.4rem;
    font-size: .94rem;
    display: none;
}
.swal2-popup {
    font-family: inherit;
    font-size: 1.2rem;}
</style>
<section class='content' id="demo-content">
    <div class='row'>
        <div class='col-xs-12'>
            <div class='box'>
                <div class='box-header'></div>
                <div class='box-body'>
                    <?php
                    $attributes = array('id' => 'button');
                    echo form_open('scan/cek_id',$attributes);?>
                    <div id="sourceSelectPanel" style="display:none">
                        <label for="sourceSelect">Change video source:</label>
                        <select id="sourceSelect" style="max-width:400px"></select>
                    </div>
                    <div id="panelVideo">
                        <video id="video" width="500" height="400" style="border: 1px solid gray"></video>
                    </div>
                    <textarea hidden="" name="id_karyawan" id="result" readonly></textarea>
                    <textarea hidden="" name="latitudeAndLongitude" id="latitudeAndLongitude" readonly></textarea>
                    <span>  <input type="submit"  id="button" class="btn btn-success btn-md" value="Cek Kehadiran"></span>
                    <?php echo form_close();?>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="<?php echo base_url() ?>assets/plugins/sweetalert/sweetalert2.min.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/plugins/zxing/zxing.min.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/app/core/scanAbsen.js"></script>
<!-- <script type="text/javascript">
    // const checkPermission = () => {
        
    // }

    // function success(pos) {
    //     const crd = pos.coords;
    //     console.log("Your current position is:");
    //     console.log(`Latitude : ${crd.latitude}`);
    //     console.log(`Longitude: ${crd.longitude}`);
    //     console.log(`More or less ${crd.accuracy} meters.`);
    // }

    // function error(err) {
    //     console.warn(`ERROR(${err.code}): ${err.message}`);
    // }
    
    // navigator.geolocation.getCurrentPosition(success, error);    
    
</script> -->
