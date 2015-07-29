<?
class M_militar extends CI_Model {

    function __construct(){

        parent::__construct();
    }

    public function salvarMilitar($dadosFormulario){


    	// Inserir dados na table militar
    	// ainda sem tratamento para os dados de outras tables
    	$this->db->set('id_graduacao',$dadosFormulario['id_graduacao']);
        $this->db->set('id_arma',$dadosFormulario['id_arma']);
        $this->db->set('id_tipo_militar',$dadosFormulario['id_tipo_servico']);
        $this->db->set('id_especialidade',$dadosFormulario['id_especialidade']);
        
        //Criar formulário para upload da foto
        $this->db->set('foto',"default.png");
        $this->db->set('id_usuario',$this->session->userdata('id_usuario'));
        //$this->db->set('id_om',$dadosFormulario['om']);
    	//$this->db->set('id_referenciacao',$dadosFormulario['referenciacao']);
        $this->db->set('nome',$dadosFormulario['nome']);
    	$this->db->set('nome_de_guerra',$dadosFormulario['nome_de_guerra']);
    	$this->db->set('data_nascimento',$dadosFormulario['data_nascimento']);
        $this->db->set('identidade',$dadosFormulario['identidade']);
    	$this->db->set('orgao_expedidor',$dadosFormulario['orgao_expedidor']);
    	$this->db->set('cpf',$dadosFormulario['cpf']);
        $this->db->set('telefone',$dadosFormulario['telefone']);
    	$this->db->set('email',$dadosFormulario['email']);
        //$this->db->set('sv_anterior_dia',$dadosFormulario['sv_anterior_dia']);
        //$this->db->set('sv_anterior_mes',$dadosFormulario['sv_anterior_mes']);
    	//$this->db->set('sv_anterior_ano',$dadosFormulario['sv_anterior_ano']);
    	//$this->db->set('observacao',$dadosFormulario['observacao']);
    	$this->db->insert('militar');


        // Flag para verificar se o militar foi inserido
        $insertMilitar = $this->db->affected_rows();
        //die();

    	// Insert na table alteracao
    	//$this->db->set('id_militar',$this->db->insert_id());

        //Desenvolver logica para inserir a situação
        //$this->db->set('id_situacao',"1");

        //Desenvolver logica para inserir a EIS
    	//$this->db->set('id_eis',"1");
    	//$this->db->set('id_om',$dadosFormulario['om']);
        //$this->db->set('data_inicio',$dadosFormulario['data_incorporacao']);
    	//$this->db->set('data_fim',$dadosFormulario['data_fim']);
       	//$this->db->set('documento',$dadosFormulario['bol_incorporacao']);
    	//$this->db->insert('alteracao');

        // Flag para verificar se o militar foi inserido
        //$insertAlteracao = $this->db->affected_rows();


        // Verificação se os dados foram inseridos com sucesso
        if ($insertMilitar) {
            return "Miliar Registrado!";
        } else{
            return "Erro ao cadastrar militar!";
        }

    }

    public function getMilitaresGrid(){
        // Query com inner join para pegar os dados de outras table na consulta
        // foi utilizado alias porque o resultado da consulta existe column com nomes iguais, então é gerado um array
        // sobrescrevendo os indices iguais
        
        //$this->db->select('militar.id_militar, om.nome AS nome_da_om, militar.nome AS nome_do_militar, 
        //    arma.descricao AS desc_arma');

        $this->db->select('militar.id_militar, militar.nome AS nome_do_militar, militar.nome_de_guerra,
            arma.descricao AS desc_arma');

        //$this->db->select('militar.nome');
        $this->db->from('militar');
        //$this->db->join('om', 'militar.id_om = om.id_om','inner');
        $this->db->join('arma', 'militar.id_arma = arma.id_arma','inner');
        $allMilitary = $this->db->get();

        // Exibir ultima query realizada pelo banco
        // echo $this->db->last_query();
        
        return $allMilitary;
    }

    public function exibirAlteracao($id_militar){

        // Query com inner join para pegar os dados de outras table na consulta
        // foi utilizado alias porque o resultado da consulta existe column com nomes iguais, então é gerado um array
        // sobrescrevendo os indices iguais
        
        /*pessoal-> cpf;nome_militar;identidade;telefone;
        militar-> posto;arma;especialidade;referenciacao;
        estagio atual-> status;data inicio;data fim; observacao;
        historico->  status;data inicio;data fim; observacao;
        */
        /*
        $this->db->query('SELECT militar.id_militar, militar.cpf, militar.nome AS nome_do_militar, militar.identidade,
            militar.telefone,militar.hierarquia.descricao AS graduacao,arma_quadro_servico.descricao AS arma,
            especialidade.descricao AS especialidade,referenciacao.codigo AS referenciacao,om.nome AS nome_da_om,
            alteracao.data_inicio,alteracao.data_fim,alteracao.documento'
            );
        */
        $this->db->select('militar.id_militar, militar.cpf, militar.nome AS nome_do_militar, militar.identidade,
            militar.telefone,militar.nome_de_guerra,militar.foto,militar.orgao_expedidor,militar.email,
            arma.descricao AS arma,tipo_militar.descricao_tipo_militar AS tipo_militar, graduacao.descricao AS graduacao,
            especialidade.cod_especialidade AS espec_cod,especialidade.descricao AS espec_desc');
        // Parte da query de busca da alteração
        //om.nome AS nome_da_om,alteracao.data_inicio,alteracao.data_fim,alteracao.documento
        $this->db->from('militar');
        $this->db->where('id_militar',$id_militar);
        $this->db->join('graduacao', 'militar.id_graduacao = graduacao.id_graduacao','inner');
        $this->db->join('arma', 'militar.id_arma = arma.id_arma','inner');
        $this->db->join('especialidade', 'militar.id_especialidade = especialidade.id_especialidade','inner');
        $this->db->join('tipo_militar', 'militar.id_tipo_militar = tipo_militar.id_tipo_militar','inner');
        //$this->db->join('alteracao', 'alteracao.id_militar = militar.id_militar','inner');
        //$this->db->join('om', 'om.id_om = alteracao.id_om','inner');

        // Cria indice do array com as informações do militar
        $alteracaoIndividual['informacaoDoMilitar'] = $this->db->get()->row();


        /*$this->db->select('alteracao.data_inicial,alteracao.data_final,alteracao.boletim,om.nome AS nome_da_om');
        $this->db->from('alteracao');
        $this->db->where('id_militar',$id_militar);
        $this->db->join('om', 'om.id_om = alteracao.id_om','inner');
        $this->db->join('eis', 'eis.id_eis = alteracao.id_eis','inner');
        $this->db->join('alteracao', 'alteracao.id_militar = militar.id_militar','inner');
        $this->db->join('om', 'om.id_om = alteracao.id_om','inner');
        */

        // Cria indice do array com as informações das alterações
        //$alteracaoIndividual['informacaoDaAlteracao'] = $this->db->get()->result();
        

        // CRIA INDICE DO ARRAY COM INFORMAÇÕES DE DATAS
        // 1º data de incorporação
        // usa o where para restringir apenas o registro com id eis igual 1, essa é a primeira alteração
        // ou seja, a data de incorporação do militar

        //$this->db->select('alteracao.data_inicio');
        //$this->db->from('alteracao');
        //$this->db->where('id_militar',$id_militar);
        //$this->db->where('id_eis =',1);   

        //$alteracaoIndividual['dataIncorporacao'] = $this->db->get()->row();
        
        
        // 2º data das alterações sem a data da incorporação

        //$this->db->select('alteracao.data_inicio,alteracao.data_fim');
        //$this->db->from('alteracao');
        //$this->db->where('id_militar',$id_militar);   
        //$this->db->where('id_eis !=',1);   

        //$alteracaoIndividual['datasAlteracoes'] = $this->db->get()->result();
        

        //Teste
        

        return $alteracaoIndividual;

    }

    public function salvarAlteracao($id_militar){















    }

}