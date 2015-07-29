<?
class M_graduacao extends CI_Model {

    function __construct(){

        parent::__construct();
    }

    public function getGraduacao(){

    	$query = $this->db->get('graduacao');

    	return $query;

    }
}