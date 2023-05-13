<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Karyawan extends CI_Controller
{

    function __construct()
    {

        parent::__construct();
        if (!$this->ion_auth->logged_in()) {
            redirect('auth');
        }

        $this->load->library('user_agent');
        $this->load->model(array('Karyawan_model', 'Jabatan_model'));
        $this->load->library('form_validation', 'ion_auth');
        $this->load->helper('url');
        $this->user = $this->ion_auth->user()->row();
    }

    public function messageAlert($type, $title)
    {
        $messageAlert = "
        const Toast = Swal.mixin({
          toast: true,
          position: 'top-end',
          showConfirmButton: false,
          timer: 5000
      });
      Toast.fire({
          type: '" . $type . "',
          title: '" . $title . "'
      });
      ";
        return $messageAlert;
    }

    public function index()
    {
        $chek = $this->ion_auth->is_admin();

        if (!$chek) {
            $hasil = 0;
        } else {
            $hasil = 1;
        }
        $user = $this->user;
        $karyawan = $this->Karyawan_model->get_all_query();
        $data = array(
            'karyawan_data' => $karyawan,
            'user' => $user, 'users'     => $this->ion_auth->user()->row(),
            'result' => $hasil,
        );
        $this->template->load('template/template', 'karyawan/karyawan_list', $data);
        $this->load->view('template/datatables');
    }

    public function output_json($data, $encode = true)
    {
        if ($encode) $data = json_encode($data);
        $this->output->set_content_type('application/json')->set_output($data);
    }


    public function data()
    {

        $this->output_json($this->Karyawan_model->getData(), false);
    }

    public function rd($id)
    {
        $user = $this->user;
        $row = $this->Karyawan_model->get_by_id_query($this->uri->segment(3));
        if ($row) {
            $uri = $this->uri->segment(3);
            $data = array(
                'id_karyawan' => $row->id_karyawan,
                'no_ktp' => $row->no_ktp,
                'nik' => $row->nik,
                'nama_karyawan' => $row->nama_karyawan,
                'tmp_lahir' => $row->tmp_lahir,
                'tgl_lahir' => $row->tgl_lahir,
                'jenis_kelamin' => $row->jenis_kelamin,
                'goldar' => $row->goldar,
                'agama' => $row->agama,
                'alamat_ktp' => $row->alamat_ktp,
                'domisili' => $row->domisili,
                'no_telp' => $row->no_telp,
                'telp_kantor' => $row->telp_kantor,
                'telp_kerabat' => $row->telp_kerabat,
                'hub_kerabat' => $row->hub_kerabat,
                'nama_jabatan' => $row->nama_jabatan,                
                'nama_gedung' => $row->nama_gedung,                
                'user_pict' => $row->user_pict,
                'user' => $user, 'users'     => $this->ion_auth->user()->row(),
            );
            $this->template->load('template/template', 'karyawan/karyawan_read', $data, $uri);
        } else {
            $this->session->set_flashdata('messageAlert', $this->messageAlert('error', 'Data tidak ditemukan!'));
            redirect(site_url('karyawan'));
        }
    }

    public function create()
    {
        $chek = $this->ion_auth->is_admin();
        if (!$chek) {
            show_error('Hanya Administrator yang diberi hak untuk mengakses halaman ini, <a href="' . base_url('dashboard') . '">Kembali ke menu awal</a>', 403, 'Akses Dilarang!');
            $hasil = 0;
        } else {
            $hasil = 1;
        }
        $user = $this->user;
        $data = array(
            'box' => 'info',
            'button' => 'Create',
            'action' => site_url('karyawan/create_action'),
            'id_karyawan' => set_value('id_karyawan'),
            'no_ktp' => set_value('no_ktp'),
            'nik' => set_value('nik'),
            'nama_karyawan' => set_value('nama_karyawan'),
            'tmp_lahir' => set_value('tmp_lahir'),
            'tgl_lahir' => set_value('tgl_lahir'),
            'jenis_kelamin' => set_value('jenis_kelamin'),
            'goldar' => set_value('goldar'),
            'agama' => set_value('agama'),
            'alamat_ktp' => set_value('alamat_ktp'),
            'domisili' => set_value('domisili'),
            'no_telp' => set_value('no_telp'),
            'telp_kantor' => set_value('telp_kantor'),
            'telp_kerabat' => set_value('telp_kerabat'),
            'hub_kerabat' => set_value('hub_kerabat'),
            'is_active' => set_value('is_active'),
            'jabatan' => set_value('jabatan'),            
            'gedung_id' => set_value('gedung_id'),
            'user_pict' => set_value('user_pict'),
            'id' => set_value('id'),
            'user' => $user, 'users'     => $this->ion_auth->user()->row(),
            'result' => $hasil,
        );
        $this->template->load('template/template', 'karyawan/karyawan_form', $data);
    }
    public function create_action()
    {
        $this->_rules();
        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $kode = $this->Jabatan_model->get_by_id($this->input->post('jabatan'));
            $kodejbt = $kode->nama_jabatan;
            $kodeagt = substr($kodejbt, 0, 1);
            $tgl = date('ym');
            $var = $this->Karyawan_model->get_max();
            $getvar = $var[0]->kode;
            $nilai = $this->formatNbr($var[0]->kode);
            $nourut = $kodeagt . $tgl . $nilai;
            // get foto           
            
            $config['upload_path'] = './uploads/user_pict';
            $config['allowed_types'] = 'jpg|png|jpeg|gif|heic';
            $config['max_size'] = '4096';  //4MB max
            $config['max_width'] = '4480'; // pixel
            $config['max_height'] = '4480'; // pixel
            $config['file_name'] = $_FILES['user_pict']['name'];
            
            $this->upload->initialize($config);

            if(!empty($_FILES['user_pict']['name'])){
                if($this->upload->do_upload('user_pict')){
                    $user_pict = $this->upload->data();
                    $data = array(
                        'nama_karyawan' => ucwords($this->input->post('nama_karyawan', TRUE)),
                        'id_karyawan' => $nourut,
                        'no_ktp' => $this->input->post('no_ktp', TRUE),
                        'nik' => $this->input->post('nik', TRUE),
                        'tmp_lahir' => $this->input->post('tmp_lahir', TRUE),
                        'tgl_lahir' => $this->input->post('tgl_lahir', TRUE),
                        'jenis_kelamin' => $this->input->post('jenis_kelamin', TRUE),
                        'goldar' => $this->input->post('goldar', TRUE),
                        'agama' => $this->input->post('agama', TRUE),
                        'alamat_ktp' => $this->input->post('alamat_ktp', TRUE),
                        'domisili' => $this->input->post('domisili', TRUE),
                        'no_telp' => $this->input->post('no_telp', TRUE),
                        'telp_kantor' => $this->input->post('telp_kantor', TRUE),
                        'telp_kerabat' => $this->input->post('telp_kerabat', TRUE),
                        'hub_kerabat' => $this->input->post('hub_kerabat', TRUE),
                        'is_active' => 1,
                        'jabatan' => $this->input->post('jabatan', TRUE),                        
                        'gedung_id' => $this->input->post('gedung_id', TRUE),
                        'user_pict' => $user_pict['file_name'],
                    );
                    $this->Karyawan_model->insert($data);
                    $this->session->set_flashdata('messageAlert', $this->messageAlert('success', 'Berhasil menambahkan karyawan'));
                    redirect(site_url('karyawan'));
                }else{
                    $this->session->set_flashdata('messageAlert', $this->messageAlert('error', 'Kesalahan Upload File'));
                    redirect(site_url('karyawan'));
                }
            }
        }
    }

    function formatNbr($nbr)
    {
        if ($nbr == 0)
            return "001";
        else if ($nbr < 10)
            return "00" . $nbr;
        elseif ($nbr >= 10 && $nbr < 100)
            return "0" . $nbr;
        else
            return strval($nbr);
    }


    public function update($id)
    {
        if (!$this->ion_auth->is_admin()) {
            show_error('Hanya Administrator yang diberi hak untuk mengakses halaman ini, <a href="' . base_url('dashboard') . '">Kembali ke menu awal</a>', 403, 'Akses Dilarang!');
        }
        $user = $this->user;
        $row = $this->Karyawan_model->get_by_id($id);
        if ($row) {
            $data = array(
                'box' => 'danger',
                'button' => 'Update',
                'action' => site_url('karyawan/update_action'),
                'id_karyawan' => set_value('id_karyawan', $row->id_karyawan),
                'no_ktp' => set_value('no_ktp', $row->no_ktp),
                'nik' => set_value('nik', $row->nik),
                'nama_karyawan' => set_value('nama_karyawan', $row->nama_karyawan),
                'tmp_lahir' => set_value('tmp_lahir', $row->tmp_lahir),
                'tgl_lahir' => set_value('tgl_lahir', $row->tgl_lahir),
                'jenis_kelamin' => set_value('jenis_kelamin', $row->jenis_kelamin),
                'goldar' => set_value('goldar', $row->goldar),
                'agama' => set_value('agama', $row->agama),
                'alamat_ktp' => set_value('alamat_ktp', $row->alamat_ktp),
                'domisili' => set_value('domisili', $row->domisili),
                'no_telp' => set_value('no_telp', $row->no_telp),
                'telp_kantor' => set_value('telp_kantor', $row->telp_kantor),
                'telp_kerabat' => set_value('telp_kerabat', $row->telp_kerabat),
                'hub_kerabat' => set_value('hub_kerabat', $row->hub_kerabat),
                'jabatan' => set_value('jabatan', $row->jabatan),                
                'gedung_id' => set_value('gedung_id', $row->gedung_id),
                // 'is_active' => set_value('is_active', $row->is_active),
                'user_pict' => set_value('user_pict', $row->user_pict),
                
                'user' => $user,
                'users'     => $this->ion_auth->user()->row(),
                'id' => set_value('id', $row->id),
            );
            $this->template->load('template/template', 'karyawan/karyawan_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('karyawan'));
        }
    }

    public function update_action()
    {
        if (!$this->ion_auth->is_admin()) {
            show_error('Hanya Administrator yang diberi hak untuk mengakses halaman ini, <a href="' . base_url('dashboard') . '">Kembali ke menu awal</a>', 403, 'Akses Dilarang!');
        }
        $this->_rules();
        $row = $this->Karyawan_model->get_by_id($this->input->post('id'));
        $kode = $this->Jabatan_model->get_by_id($this->input->post('jabatan'));
        $kodejbt = $kode->nama_jabatan;
        $kodeagt = substr($kodejbt, 0, 1);
        $tgl = date('ym');
        $var = $this->Karyawan_model->get_max();
        $getvar = $var[0]->kode;
        $nilai = $this->formatNbr($var[0]->kode);
        $nourut = $kodeagt . $tgl . $nilai;        
        
        $upload_pict = $_FILES['user_pict']['name'];
        if ($upload_pict) {
            $config['allowed_types'] = 'jpeg|jpg|png';
            $config['upload_path'] = './uploads/user_pict/';
            $config['max_size'] = '4096';  //4MB max
            $this->upload->initialize($config);

            if ($this->upload->do_upload('user_pict')) {
                $old_pict = $row->user_pict;
                if ($old_pict != 'default.png') {
                    unlink(FCPATH . 'uploads/user_pict/' . $old_pict);
                }
                $new_pict = $this->upload->data('file_name');
            } else {
                echo $this->upload->display_errors();
                // $this->session->set_flashdata('messageAlert', $this->messageAlert('error', 'Kesalahan Upload File'));
                // redirect(site_url('karyawan'));
            }
        } else {
            $new_pict = $row->user_pict;
        }            
        $data = array(
            'id_karyawan' => $nourut,
            'no_ktp' => $this->input->post('no_ktp', TRUE),
            'nik' => $this->input->post('nik', TRUE),
            'nama_karyawan' => $this->input->post('nama_karyawan', TRUE),
            'tmp_lahir' => $this->input->post('tmp_lahir', TRUE),
            'tgl_lahir' => $this->input->post('tgl_lahir', TRUE),
            'jenis_kelamin' => $this->input->post('jenis_kelamin', TRUE),
            'goldar' => $this->input->post('goldar', TRUE),
            'agama' => $this->input->post('agama', TRUE),
            'alamat_ktp' => $this->input->post('alamat_ktp', TRUE),
            'domisili' => $this->input->post('domisili', TRUE),
            'no_telp' => $this->input->post('no_telp', TRUE),
            'telp_kantor' => $this->input->post('telp_kantor', TRUE),
            'telp_kerabat' => $this->input->post('no_telp', TRUE),
            'hub_kerabat' => $this->input->post('hub_kerabat', TRUE),
            'jabatan' => $this->input->post('jabatan', TRUE),            
            'gedung_id' => $this->input->post('gedung_id', TRUE),
            // 'is_active' => $this->input->post('is_active', TRUE),
            'user_pict' => $new_pict,
        );
        $this->Karyawan_model->update($this->input->post('id', TRUE), $data);
        $this->session->set_flashdata('messageAlert', $this->messageAlert('success', 'Berhasil merubah data karyawan'));
        redirect(site_url('karyawan'));        
    }



    public function delete($id)
    {
        if (!$this->ion_auth->is_admin()) {
            show_error('Hanya Administrator yang diberi hak untuk mengakses halaman ini, <a href="' . base_url('dashboard') . '">Kembali ke menu awal</a>', 403, 'Akses Dilarang!');
        }
        $row = $this->Karyawan_model->get_by_id($this->uri->segment(3));
        if ($row) {
            // delete_files('./uploads/user_pict/');
            $karyawan = $this->Karyawan_model->get_by_id($id);
            unlink(FCPATH."/uploads/user_pict/".$karyawan->user_pict);
            $this->Karyawan_model->delete($id);
            $this->session->set_flashdata('messageAlert', $this->messageAlert('success', 'Berhasil menghapus data karyawan'));
            redirect(site_url('karyawan'));
        } else {
            $this->session->set_flashdata('messageAlert', $this->messageAlert('danger', 'data tidak ditemukan'));
            redirect(site_url('karyawan'));
        }
    }


    public function _rules()
    {
        $this->form_validation->set_rules('nama_karyawan', 'nama karyawan', 'trim|required');
        $this->form_validation->set_rules('jabatan', 'jabatan', 'trim|required');
        $this->form_validation->set_rules('tmp_lahir', 'tmp_lahir', 'trim|required');
        $this->form_validation->set_rules('tgl_lahir', 'tgl_lahir', 'trim|required');
        $this->form_validation->set_rules('jenis_kelamin', 'jenis_kelamin', 'trim|required');
        $this->form_validation->set_rules('goldar', 'goldar', 'trim|required');
        $this->form_validation->set_rules('agama', 'agama', 'trim|required');
        $this->form_validation->set_rules('alamat_ktp', 'alamat_ktp', 'trim|required');
        $this->form_validation->set_rules('domisili', 'domisili', 'trim|required');
        $this->form_validation->set_rules('hub_kerabat', 'hub_kerabat', 'trim|required');                
        $this->form_validation->set_rules('id_karyawan', 'id_karyawan', 'trim');
        $this->form_validation->set_rules('no_ktp', 'no_ktp', 'required|is_unique[karyawan.no_ktp]|trim|min_length[15]|max_length[16]|numeric');
        $this->form_validation->set_rules('nik', 'nik', 'trim|min_length[16]|max_length[16]|numeric');
        $this->form_validation->set_rules('no_telp', 'no_telp', 'required|min_length[11]|max_length[13]|numeric');
        $this->form_validation->set_rules('telp_kerabat', 'telp_kerabat', 'required|min_length[11]|max_length[13]|numeric');
        
        $this->form_validation->set_rules('telp_kantor', 'telp_kantor', 'min_length[11]|max_length[13]|numeric');
        $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
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
}
