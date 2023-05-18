<?php

class Dashboard extends CI_Controller
{


	public function __construct()
	{
		parent::__construct();
		$this->load->library('user_agent');
		if (!$this->ion_auth->logged_in()) {
			redirect('auth');
		}
		$this->load->model('Dashboard_model', 'dashboard');
		$this->user = $this->ion_auth->user()->row();
		if (!$this->ion_auth->is_admin()) {
			$this->load->model('Presensi_model', 'presensi');
			$this->load->model('Karyawan_model', 'karyawan');
			$this->load->model('Kehadiran_model', 'kehadiran');
		}
	}
	public function index()
	{
		$user = $this->user;
		$data = [
			'user' 		=> $user,
			'users' 	=> $this->ion_auth->user()->row(),
		];
		if ($this->ion_auth->is_admin()) {
			$data['info_box'] = $this->admin_box();
			$plotting  = array('1', '2', '3', '4', '5', '6', '7');
			$plotting2 = array('1', '2', '3', '4');
			$data['get_plot'] = $this->dashboard->get_max($plotting)->result();
			$data['get_plot2'] = $this->dashboard->get_max2($plotting2)->result();
		} else {
			$cekKaryawan = $this->karyawan->get_by_email_karyawan($user->email);
			if (isset($cekKaryawan->id_karyawan) == true) {
				$kehadiran = $this->kehadiran->get_all();
				$result = [
					'karyawan' => $cekKaryawan->id_karyawan,
					'kehadiran' => $kehadiran
				];
				$data += $result;
			}	
		}
		$this->template->load('template/template', 'dashboard/dashboard', $data);
		$this->load->view('template/datatables');
	}

	public function output_json($data, $encode = true)
    {
        if ($encode) $data = json_encode($data);
        $this->output->set_content_type('application/json')->set_output($data);
    }

    public function data($idKaryawan)
    {
        $this->output_json($this->presensi->get_history_presensi_by_id_karyawan($idKaryawan), false);
    }

	public function admin_box()
	{
		$box = [
			[
				'box' 		=> 'light-blue',
				'total' 	=> $this->dashboard->total('karyawan'),
				'title'		=> 'Karyawan',
				'icon'		=> 'user'
			],
			[
				'box' 		=> 'olive',
				'total' 	=> $this->dashboard->total('jabatan'),
				'title'		=> 'Jabatan',
				'icon'		=> 'briefcase'
			],
			[
				'box' 		=> 'yellow-active',
				'total' 	=> $this->dashboard->total('gedung'),
				'title'		=> 'lokasi',
				'icon'		=> 'building'
			],		
		];
		$info_box = json_decode(json_encode($box), FALSE);
		return $info_box;
	}

	function graph()
	{

		$data['get_plot2'] = $this->dashboard->get_max($plotting2)->result();
		$data['get_plot'] = $this->dashboard->get_max($plotting)->result();
		$get_plot = json_decode(json_encode($plotting), FALSE);
		return $get_plot;
	}

	function _set_useragent()
	{
		if ($this->agent->is_mobile('iphone')) {
			$this->agent = 'iphone';
		} elseif ($this->agent->is_mobile()) {
			$this->agent = 'mobile';
		} else {
			$this->agent = 'desktop';
		}
	}

	function absen_manual()
	{
		$config['upload_path'] = './uploads/file_keterangan';
		$config['allowed_types'] = 'jpg|png|jpeg|pdf|heic';
		$config['max_size'] = '4096';  //4MB max
		$config['max_width'] = '4480'; // pixel
		$config['max_height'] = '4480'; // pixel
		if (!empty($_FILES['image']['name'])) {
			$config['file_name'] = $_FILES['image']['name'];
		}
		$this->upload->initialize($config);
		$dateTime = new DateTime();
		$dateTime->setTime(0, 0);
		$hours = $dateTime->format('H:i:s');
		$data = array(
			'tgl' => $this->input->post('tgl_absen',true),
			'id_khd' => $this->input->post('kehadiran',true),
			'ket' => $this->input->post('keterangan',true),
			'id_karyawan' => $this->input->post('id_karyawan',true),
			'jam_msk' => $hours,
			'jam_klr' => $hours,
			'id_status' => 3
		);
		$flagUploadImage = 1;
		if (!empty($config['file_name'])) {
			if ($this->upload->do_upload('image')) {
				$flagUploadImage = $this->upload->data();
			}		
		} else {
			$flagUploadImage = null;
		}
		$data['file_keterangan'] = $flagUploadImage['file_name'];
		$this->presensi->insert($data);
		echo json_encode($data['file_keterangan']);
	}
}
