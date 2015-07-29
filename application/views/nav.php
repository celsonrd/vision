<!-- Menu -->
	<div class="row">
		<div class="col-md-12">
			<nav role="navigation" class="navbar navbar-default">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <!-- Collection of nav links and other content for toggling -->
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><?php echo anchor(base_url("index.php/administrarMilitar"),"Home");?>
                <li><?php echo anchor(base_url("index.php/militar/exibirFormularioDeCadastro"),"Cadastro de militar");?>
                <li><?php echo anchor(base_url("index.php/militar/listar"),"Listagem de militar");?>
                <!-- <li><a href="#">Referenciação</a></li> -->
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><?php echo anchor(base_url("index.php/acesso/logout"),"Sair");?>
            </ul>
        </div>
    </nav>
</div>

	<!-- Fim menu -->



