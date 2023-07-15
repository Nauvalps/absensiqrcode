<?php
if (!defined('BASEPATH'))
exit('No direct script access allowed');
class Kehadiran_model extends CI_Model
{
    public $table = "kehadiran";
    
    function __construct()
    {
        parent::__construct();
    }

    function get_all()
    {
        $this->db->where_not_in('id_khd', 1);
        $this->db->where_not_in('id_khd', 4);
        $this->db->where_not_in('id_khd', 7);
        return $this->db->get($this->table)->result();
    }

}
?>