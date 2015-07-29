<?
class M_tipo_alteracao extends CI_Model {

    function __construct(){

        parent::__construct();
    }

    public function getTipoAlteracao(){

    	$this->db->order_by('descricao','asc');
    	
    	$query = $this->db->get('tipo_alteracao');

    	return $query;

    }
}