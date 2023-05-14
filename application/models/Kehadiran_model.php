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
        return $this->db->get($this->table)->result();
    }
}
?>