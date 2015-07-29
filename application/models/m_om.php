<?
class M_om extends CI_Model {

    function __construct(){

        parent::__construct();
    }

    public function getOm(){

    	$this->db->order_by('nome_om','asc');
    	
    	$query = $this->db->get('om');

    	return $query;

    }
}