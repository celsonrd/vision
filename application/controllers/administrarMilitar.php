<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class AdministrarMilitar extends CI_Controller {

	public function __constructor(){	
		
	}
 
	public function index(){

		if (!$this->session->userdata('nome_usuario')){

			redirect('index.php/login','location');
		}
	
		$this->load->view('header');
		$this->load->view('nav');

	}
	
}