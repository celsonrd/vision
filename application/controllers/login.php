<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Login extends CI_Controller {
 
	public function index(){

		$this->load->view('header');
		$this->load->view('chamada');
		$this->load->view('formulario_login');
	}
		
}