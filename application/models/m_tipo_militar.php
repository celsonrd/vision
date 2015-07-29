<?
class M_tipo_militar extends CI_Model {

    function __construct(){

        parent::__construct();
    }

    public function getTipoMilitar(){

    	$query = $this->db->get('tipo_militar');

    	return $query;

    }
}