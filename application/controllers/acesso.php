<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Acesso extends CI_Controller {

	public function __constructor(){

		parent::__constructor();


	}

	public function validacao(){
		
		// Recebe os dados do login

		
		$dadosLogin = array('login' => $this->input->post('login_usuario'),
							'senha' => $this->input->post('senha_usuario')
							);




		// Chama a função do model para validar o usuário enviando os dados recebido pelo formulário

		$usuario = $this->m_usuario->verificarUsuario($dadosLogin);

		
		if (count($usuario) === 1) {

			// Criar a sessão com os dados do usuário

			$dadosSessao = array('nome_usuario' => $usuario->nome_usuario, 
								 'id_usuario' => $usuario->id_usuario,
								 'secao' => $usuario->secao
								 );

			$this->session->set_userdata($dadosSessao);
			


			// Redireciona para página de administração de usuario para o metodo de cadastrar 
			redirect('index.php/administrarMilitar','location');



		} else {
			redirect('index.php/login','location');
		}
	}


	public function logout(){

		$this->session->sess_destroy();

		redirect('index.php/login','location');
	}
}