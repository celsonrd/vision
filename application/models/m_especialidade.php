<?
class M_especialidade extends CI_Model {

    function __construct(){

        parent::__construct();
    }

    public function getEspecialidade(){

    	$this->db->order_by('descricao');
    	
    	$query = $this->db->get('especialidade');

    	return $query;

    }
}