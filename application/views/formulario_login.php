<div class="container">
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <div class="col-md-8 col-md-offset-2">
        <img src="<? echo base_url('public/img/logo3.jpg') ?>"/>
      </div>
        <form class="form-horizontal"  autocomplete="off" method="post" action="<?php echo base_url()?>index.php/acesso/validacao">
   <!-- Text input-->
  <div class="form-group">

    <label class="col-md-3 control-label" for="login_usuario">Usuário:</label>
    <div class="col-md-6">
      <input id="login_usuario" name="login_usuario" type="text" placeholder="" class="form-control input-md">
    </div>
  </div>

  <!-- Password input-->
  <div class="form-group">
    <label class="col-md-3 control-label" for="senha_usuario">Senha:</label>
    <div class="col-md-6">
      <input id="senha_usuario" name="senha_usuario" type="password" placeholder="" class="form-control input-md">
    </div>
  </div>

  <!-- Button -->
  <div class="form-group">
    <div class="col-md-2 col-md-offset-5">
      <button class="btn btn-primary" type="submit">Entrar</button>
    </div>
  </div>


  <!-- Password input-->
  <div class="errors">
   <?php echo validation_errors(); ?>
  </div>

  </form>
  </div>
</div>