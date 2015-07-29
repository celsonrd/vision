<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Militar extends CI_Controller {


	function __construct(){

        parent::__construct();

        function retiraAcentos($string){
    	
    	$map =  array (
    		        'À' => 'A', 'Á' => 'A', 'Â' => 'A', 'Ã' => 'A', 'Ä' => 'A', 'Å' => 'A',
            		'Æ' => 'A', 'Ç' => 'C', 'È' => 'E', 'É' => 'E', 'Ê' => 'E', 'Ë' => 'E',
            		'Ì' => 'I', 'Í' => 'I', 'Î' => 'I', 'Ï' => 'I', 'Ð' => 'D', 'Ñ' => 'N',
            		'Ò' => 'O', 'Ó' => 'O', 'Ô' => 'O', 'Õ' => 'O', 'Ö' => 'O', 'Ø' => 'O',
            		'Ù' => 'U', 'Ú' => 'U', 'Û' => 'U', 'Ü' => 'U', 'Ý' => 'Y', 'Ŕ' => 'R',
            		'Þ' => 's', 'ß' => 'B', 'à' => 'a', 'á' => 'a', 'â' => 'a', 'ã' => 'a',
            		'ä' => 'a', 'å' => 'a', 'æ' => 'a', 'ç' => 'c', 'è' => 'e', 'é' => 'e',
        	    	'ê' => 'e', 'ë' => 'e', 'ì' => 'i', 'í' => 'i', 'î' => 'i', 'ï' => 'i',
		            'ð' => 'o', 'ñ' => 'n', 'ò' => 'o', 'ó' => 'o', 'ô' => 'o', 'õ' => 'o',
	            	'ö' => 'o', 'ø' => 'o', 'ù' => 'u', 'ú' => 'u', 'û' => 'u', 'ý' => 'y',
		            'þ' => 'b', 'ÿ' => 'y', 'ŕ' => 'r',
        			);

        
        $string = strtr($string,$map);
        $string = strtoupper($string);
 
    return $string;

	}

    }

	public function index(){

		if (!$this->session->userdata('nome_usuario')){

			redirect('index.php/login','location');
		}
	
		$this->load->view('header');
		$this->load->view('nav');

	}


	public function ExibirFormularioDeCadastro(){

		if (!$this->session->userdata('nome_usuario')){

			redirect('index.php/login','location');
		}

		// Cabeçalho padrão com bootstrap

		$this->load->view('header');
		$this->load->view('nav');


		// Dados para preechimento do formulário de cadastro de militar
		$data['graduacao'] 			= $this->m_graduacao->getGraduacao();
		$data['arma'] 				= $this->m_arma->getArma();
		$data['tipoMilitar'] 		= $this->m_tipo_militar->getTipoMilitar();
		$data['especialidade'] 		= $this->m_especialidade->getEspecialidade();
		
		// Código antigo
		//$data['especialidade'] 		= $this->m_especialidade->getEspecialidade();
		//$data['om'] 				= $this->m_om->getOm();
    	//$data['dataSession'] 		= $this->session->userdata('usuario');

    	// Envia os dados recebido do model m_posto para a view
		// esses valores vão popular o select do posto/graduação 
		$this->load->view('formulario',$data);

	}

	function processarDadosDoMilitar(){

		// Pega o id do usuário para fazer insert no banco
		// Cria um array com os dados da sessão do usuário
		// Recebe os valores da session como array e pega esse array e insere em uma variável comum
		
		$dataUsuario = $this->session->userdata('usuario');
		$id_usuario = $dataUsuario['id_usuario'];
		
		
		// Constante com oito anos em timestamp para calcular o tempo maximo de serviço do militar
		define("tempoLimiteDeServico",252460800);
		

		// Constante de tempo normal de prorrogação de serviço UM ANO
		define("tempoDeProrrogacaoPadrao",31557600);


		// Constante de um dia em timestampo para evitar estabilidade
		define("dia", 86400);

		// Receber todos os dados do form			
		$dadosFormulario = array(
		"id_graduacao"      	=> $this->input->post("graduacao"),
		"id_arma" 				=> $this->input->post("arma"),
		"id_tipo_servico" 		=> $this->input->post("tipo_servico"),
		"id_especialidade" 		=> $this->input->post("especialidade"),

		"nome" 					=> $this->input->post("nome"),
		"nome_de_guerra"		=> $this->input->post("nome_de_guerra"),
		"data_nascimento" 		=> $this->input->post("data_nascimento"),
		"identidade" 			=> $this->input->post("identidade"),
		"orgao_expedidor" 		=> $this->input->post("orgao_expedidor"),
		"cpf"					=> $this->input->post("cpf"),
		"telefone" 				=> $this->input->post("telefone"),
		"email" 				=> $this->input->post("email")
		);
		


		// TESTE COM A CLASS DATETIME
		/*
		$datetime1 = new DateTime('2015-2-1');
		$datetime2 = new DateTime();
		$interval = $datetime1->diff($datetime2);
		echo "tempo de {$interval->y} anos, {$interval->m} meses e {$interval->d} dias";
		*/

		//TESTE COM DATA CLASS DATETIME
		//Regra de negócio para inserir tempo de serviço anterior
		//echo $dadosFormulario["data_incorporacao"] ."<br/>";
		//$dadosFormulario["data_incorporacao"] = implode("-",array_reverse(explode("/", $dadosFormulario['data_incorporacao'])));
		//echo $dadosFormulario["data_incorporacao"]."<br/>";
		//$dadosFormulario["data_incorporacao"] = new DateTime($dadosFormulario["data_incorporacao"]);
		//echo date_format($dadosFormulario["data_incorporacao"], 'd-m-Y');
		//die();
		//print_r($dadosFormulario);
		//die();

		// Verifica se a variável existe para evitar erro de interpretaçao
		if (isset($dadosFormulario['nome'])) {
			
			// Converte a primeira letra maiscula e retira a acentos do nome e sobrenome
			$dadosFormulario['nome'] = retiraAcentos($dadosFormulario['nome']);
			$dadosFormulario['nome_de_guerra'] = retiraAcentos($dadosFormulario['nome_de_guerra']);
		} 
		// die();

		// Converter o tempo de serviço anterior informado no formulário para verificação do tempo total de serviço ja existente
		// verifica se o valor foi informado para não dá erro no calculo
		//if (isset($dadosFormulario['ano_sv'])) {
		//	$dadosFormulario['ano_sv'] = ($dadosFormulario['ano_sv'] * 31557600);
		//} 
		//if (isset($dadosFormulario['mes_sv'])) {
		//	$dadosFormulario['mes_sv'] = ($dadosFormulario['mes_sv'] * 2629800);	
		//} 
		//if (isset($dadosFormulario['dia_sv'])) {
		//	$dadosFormulario['dia_sv'] = ($dadosFormulario['dia_sv'] * 86400);
		//}
		
		// Variavel com o tempo de serviço anterior
		//$dadosFormulario['tempo_sv_anterior'] = ($dadosFormulario['ano_sv'] + $dadosFormulario['mes_sv'] + $dadosFormulario['dia_sv']);

		//########**********ALERTA**********########
		//TRATAMENTO DA DATA DE INCORPORAÇÃO PELA Class DateTime
		/* Converter a data informada no formulario para o timestamp
		/ 1 - explode "/" data para retornar um array
		/ 2 - array_reverse para trocar a ordem (transformar o formato brasileiro em americano) dia,mes,ano para ano,mes,dia
		/ 2.1 - a função strtotime só funciona para datas com formato americano
		/ 3 - implode para transformar o array em uma string novamente
		/ 4 - strtotime para converter a data no formato americano em timestamp */
		//$dadosFormulario['data_incorporacao'] = strtotime(implode("-",array_reverse(explode("/", $dadosFormulario['data_incorporacao']))));
		/* Converter a data informada no formulario para o timestamp
		

		/ 1 - explode "/" data para retornar um array
		/ 2 - array_reverse para trocar a ordem (transformar o formato brasileiro em americano) dia,mes,ano para ano,mes,dia
		/ 2.1 - a função strtotime só funciona para datas com formato americano
		/ 3 - implode para transformar o array em uma string novamente
		/ 4 - strtotime para converter a data no formato americano em timestamp */
		$dadosFormulario['data_nascimento'] = strtotime(implode("-",array_reverse(explode("/", $dadosFormulario['data_nascimento']))));


		/* Data final prevista para o estágio
		/ essa data é calculada pela data da incorporação mais um ano, se o tempo de serviço anterior for menor que 8 anos
		/ se o tempo de serviço anterior for maior ou igual a oito anos havera um erro informando ao operador que o usuário não pode ser cadastrado
		/ fazer algoritmo para calculo */

		//$dadosFormulario['data_fim'] = $dadosFormulario['data_incorporacao'] + (tempoDeProrrogacaoPadrao-dia);


		//var_dump($dadosFormulario);
		//die();


		if ($this->m_militar->salvarMilitar($dadosFormulario)) {
			echo "Sucesso";
		} else{
			echo "erro";
		}	
			
	}


	public function listar(){

		if (!$this->session->userdata('nome_usuario')){

			redirect('index.php/login','location');
		}

		// Carregar view padrão para cabeçalho

		$this->load->view('header');
		$this->load->view('nav');

		
		// Recebe os militares do banco com o método do model

		$militaresGrid['militares'] = $this->m_militar->getMilitaresGrid();


		// Carrega a view com os dados dos militares

		$this->load->view('formulario_listar',$militaresGrid);


	}


		public function exibirAlteracao($id_militar){

		$this->load->view('header');
		$this->load->view('nav');
		
		// Verifica se a session está ativa
		if (!$this->session->userdata('nome_usuario')){

			redirect('index.php/login','location');
		}


		$dados['militar'] 		= $this->m_militar->exibirAlteracao($id_militar);
		$dados['tipoAlteracao'] = $this->m_tipo_alteracao->getTipoAlteracao();
		$dados['om']			= $this->m_om->getOm();

		// Converter o objeto recebido pela consulta do banco no array para manipulação
		//$dataIncorporacao = get_object_vars($dados['dataIncorporacao']);
		
		
    	// Envia os dados recebido do model m_posto para a view
		// esses valores vão popular o select do posto/graduação 
		$this->load->view('formulario_alteracao',$dados);

	}

	public function salvarAlteracao(){

		$dadosAlteracao = array(
		"id_miltiar"		=> $this->input->post("id_militar"),
		"id_tipo_alteracao"	=> $this->input->post("tipo_alteracao"),
		"id_om" 			=> $this->input->post("om"),
		"documento" 		=> $this->input->post("documento"),
		"data_inicial" 		=> $this->input->post("data_incio"),
		"observacao" 		=> $this->input->post("observacao"),
		);

		$dadosAlteracao['data_inicial'] = strtotime(implode("-",array_reverse(explode("/", $dadosAlteracao['data_inicial']))));
		var_dump($dadosAlteracao);







	}

}