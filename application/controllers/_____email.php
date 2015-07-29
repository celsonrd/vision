<?php 
 
class Email extends CI_Controller {

	public function __constructor(){

		parent::__construct();

		
	}

	public function index(){

		
			$config['protocol'] = "smtp";
			$config['smtp_host'] = "ssl://smtp.gmail.com";
			$config['smtp_port'] = "465";
			$config['smtp_user'] = "celsonrd@gmail.com"; 
			$config['smtp_pass'] = "N1c0l3sempre";
			$config['charset'] 	= "utf-8";
			$config['mailtype'] = "html";

			$this->load->library('email',$config);


			$this->email->initialize($config);

		$this->email->from('celsonrd@gmail.com', 'Celson Rodrigues');
		$this->email->to('celsonrd@gmail.com'); 
		$this->email->subject('Email Test');
		$this->email->message('Testing the email class.');	
		$this->email->send();

		echo $this->email->print_debugger();

		//echo phpinfo();	
	}
	
}