<?
class M_alteracao extends CI_Model {

    function __construct(){

        parent::__construct();
    }

    public function getAlteracao(){

    	$query = $this->db->get('arma_quadro_servico');

    	return $query;

    }

    public function salvarAlteracao($id_militar){

	$query = $this->db->get('arma_quadro_servico');

	return $query;

	}
}