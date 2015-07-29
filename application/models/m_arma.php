<?
class M_arma extends CI_Model {

    function __construct(){

        parent::__construct();
    }

    public function getArma(){

    	$query = $this->db->get('arma');

    	return $query;

    }
}