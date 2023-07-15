<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Karyawan_model extends CI_Model
{

    public $table = 'karyawan';
    public $id = 'id';
    public $namaKaryawan = 'nama_karyawan';
    public $order = 'DESC';

    function __construct()
    {
        parent::__construct();
    }

    // get all
    function get_all()
    {
        $this->db->order_by($this->id, $this->order);
        return $this->db->get($this->table)->result();
    }


    function get_max()
    {
        return $this->db->select('max(id) as kode')
            ->from('karyawan')->get()->result();
    }

    function get_all_query()
    {
        $sql = "SELECT a.id_karyawan,a.no_ktp,a.nik, a.nama_karyawan, a.slot_cuti, a.tmp_lahir,a.tgl_lahir,a.jenis_kelamin,a.goldar,a.agama,a.alamat_ktp,a.domisili,a.no_telp,a.telp_kantor,a.telp_kerabat,a.hub_kerabat,a.is_active,a.user_pict,b.nama_jabatan,a.gedung_id
                from karyawan as a,jabatan as b
                where b.id_jabatan=a.jabatan";
        return $this->db->query($sql)->result();
    }


    function get_by_id_query($id)
    {
        $sql = "SELECT a.id_karyawan,a.no_ktp,a.nik,a.nama_karyawan, a.slot_cuti, a.tmp_lahir,a.tgl_lahir,a.jenis_kelamin,a.goldar,a.agama,a.alamat_ktp,a.domisili,a.no_telp,a.telp_kantor,a.telp_kerabat,a.hub_kerabat,a.is_active,a.user_pict,b.nama_jabatan,c.nama_gedung
        from karyawan as a,jabatan as b,gedung as c
        where b.id_jabatan=a.jabatan
        and a.gedung_id=c.gedung_id        
        and id=$id";
        return $this->db->query($sql)->row($id);
    }

    

    function getData()
    {
        $this->datatables->select('a.id,a.id_karyawan,a.nama_karyawan, a.slot_cuti, ,a.no_ktp,a.nik,a.tmp_lahir,a.tgl_lahir,a.jenis_kelamin,a.goldar,a.agama,a.alamat_ktp,a.domisili,a.no_telp,a.telp_kantor,a.telp_kerabat,a.hub_kerabat,a.is_active,a.user_pict,b.nama_jabatan,c.nama_gedung')
            ->from('karyawan as a,jabatan as b,gedung as c')
            ->where('b.id_jabatan=a.jabatan')
            ->where('a.gedung_id=c.gedung_id');
        return $this->datatables->generate();
    }
    // get data by id
    function get_by_id($id)
    {
        $this->db->where($this->id, $id);
        return $this->db->get($this->table)->row();
    }
    
    function get_by_name_karyawan($namaKaryawan, $isActive)
    {       
        $query_str =
            $this->db->where('is_active', $isActive)
            ->where('nama_karyawan', $namaKaryawan)
            ->get('karyawan');
        if ($query_str->num_rows() > 0) {
            return $query_str->row();
        } else {
            return false;
        }
    }
    // insert data
    function insert($data)
    {
        $this->db->insert($this->table, $data);
    }

    // update data
    function update($id, $data)
    {
        $this->db->where($this->id, $id);
        $this->db->update($this->table, $data);
    }

    // delete data
    function delete($id)
    {
        $this->db->where($this->id, $id);
        // unlink("uploads/user_pict/".$user_pict);
        $this->db->delete($this->table);
    }
}