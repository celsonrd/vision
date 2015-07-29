<?
class M_usuario extends CI_Model {

    function __construct(){

        parent::__construct();
    }


    public function verificarUsuario($dadosLogin){

        // Query de autenticação
    	$this->db->where('login',$dadosLogin['login']);
    	$this->db->where('senha',md5($dadosLogin['senha']));
    	$usuario = $this->db->get('usuario')->row(0);

        return $usuario;
    }

    public function getUser($login){

        $this->db->where('login',$login);
        $User = $this->db->get('usuario');

        return $usuario->row(0);
    }
}