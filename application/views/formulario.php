  <div class="row">
  <div class="col-md-12">
    <?php echo "Bem vindo <b/>". $this->session->userdata('nome_usuario') . "</b>";?>
  </div>  
</div>

<form class="form-horizontal" action="<?php echo base_url('index.php');?>/militar/processarDadosDoMilitar" method="post">
<fieldset>

<!-- Form Name -->
<legend>Cadastro de Militares</legend>

<div class="well">
<!-- Text input-->
<!-- <div class="form-group" >
  <label class="col-md-4 control-label" for="om">Organização Militar:</label>  
  <div class="col-md-3">
  <select class="form-control" name="om">
    <option></option>
      <?php
        //foreach ($om -> result() as $value) {
          //echo'<option value="' . $value->id_om . '">'. $value->nome_om . '</option>';
          //}   
      ?>
    </select>
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="graduacao">Posto / Graduação:</label>  
  <div class="col-md-3">
    <select class="form-control" name="graduacao">
    <option>Selecione</option>
        <?php
              foreach ($graduacao -> result() as $value) {
                echo'<option value="' . $value->id_graduacao . '">'. $value->descricao . '</option>';
              }   
        ?>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="arma">Arma / Quadro / Serviço:</label>  
  <div class="col-md-3">
    <select class="form-control" name="arma">
    <option>Selecione</option>
        <?php
              foreach ($arma -> result() as $value) {
                echo'<option value="' . $value->id_arma . '">'. $value->descricao . '</option>';
              }   
        ?>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="tipo_servico">Tipo de serviço:</label>  
  <div class="col-md-4">
    <select class="form-control" name="tipo_servico">
    <option>Selecione</option>
      <?php
        foreach ($tipoMilitar -> result() as $value) {
          echo'<option value="' . $value->id_tipo_militar . '">'. $value->cod_tipo_militar . " - " . $value->descricao_tipo_militar .'</option>';
          }   
      ?>
    </select>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="especialidade">Especialidade:</label>  
  <div class="col-md-4">
    <select class="form-control" name="especialidade">
    <option>Selecione</option>
      <?php
        foreach ($especialidade -> result() as $value) {
          echo'<option value="' . $value->id_especialidade . '">'. $value->cod_especialidade . " -- " . $value->descricao .'</option>';
          }   
      ?>
    </select>
  </div>
</div>

<!-- Text input-->
<!--
<div class="form-group">
  <label class="col-md-4 control-label" for="data_incorporacao">Data de incorporação:</label>  
  <div class="col-md-2">
    <input id="data_incorporacao" name="data_incorporacao" type="text" placeholder="" class="form-control input-md">
  </div>
</div>

<!-- Text input-->
<!--
<div class="form-group">
  <label class="col-md-4 control-label" for="bol_incorporacao">Boletim de incorporação:</label>  
  <div class="col-md-3">
    <input id="bol_incorporacao" name="bol_incorporacao" type="text" placeholder="" class="form-control input-md">
  </div>
</div>
-->
</div>

<div class="well">
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="nome">Nome:</label>  
  <div class="col-md-6">
  <input id="nome" name="nome" type="text" placeholder="" class="form-control input-md">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="nome_de_guerra">Nome de guerra:</label>  
  <div class="col-md-3">
  <input id="nome_de_guerra" name="nome_de_guerra" type="text" placeholder="" class="form-control input-md">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="data_nascimento">Data de Nascimento:</label>  
  <div class="col-md-2">
    <input id="data_nascimento" name="data_nascimento" type="text" placeholder="" class="form-control input-md">   
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="identidade">Identidade:</label>  
  <div class="col-md-2">
    <input id="identidade" name="identidade" type="text" placeholder="" class="form-control input-md">   
  </div>
</div>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="orgao_expedidor">Orgão Expeditor:</label>  
  <div class="col-md-2">
    <input id="orgao_expedidor" name="orgao_expedidor" type="text" placeholder="" class="form-control input-md">   
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="cpf">CPF:</label>  
  <div class="col-md-2">
  <input id="cpf" name="cpf" type="text" placeholder="" class="form-control input-md">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="telefone">Telefone:</label>  
  <div class="col-md-2">
  <input id="telefone" name="telefone" type="text" placeholder="" class="form-control input-md">
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="email">E-mail:</label>  
  <div class="col-md-6">
  <input id="email" name="email" type="text" placeholder="" class="form-control input-md">
  </div>
</div>
<section class="modal"></section>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="salvar">Salvar dados:</label>
  <div class="col-md-4">
    <button id="salvar" name="salvar" class="btn btn-success">Salvar</button>
  </div> 
</div>
</div>


<! -- <div class="well">
<!-- Text input-->
<!--<div class="form-group">
  <label class="col-md-4 control-label" for="tempo_sv_anterior">Tempo de serviço publico anterior:</label>  
  <div class="col-md-1">
  <input type="text" name="ano_sv" placeholder="Ano" class="form-control input-md">
  </div>
  <div class="col-md-1">
  <input type="text" name="mes_sv" placeholder="Mês" class="form-control input-md">
  </div>
  <div class="col-md-1">
  <input type="text" name="dia_sv" placeholder="Dias" class="form-control input-md">
  </div>
</div>


<!-- Text input-->
<!--
<div class="form-group">
  <label class="col-md-4 control-label" for="referenciacao">Referenciação:</label>  
  <div class="col-md-5">
  <select class="form-control" name="referenciacao">
    <option></option>
      <?php
        //foreach ($especialidade -> result() as $value) {
          //echo'<option value="' . $value->id_especialidade . '">'. $value->cod_especialidade  .' | ' . $value->descricao . '</option>';
          //}   
      ?>
    </select>
    
  </div>
</div>

<!-- Text input-->
<!--
<div class="form-group">
  <label class="col-md-4 control-label" for="observacao">Observação:</label>  
  <div class="col-md-4">
  <input id="observacao" name="observacao" type="text" placeholder="" class="form-control input-md">
    
  </div>
</div>


</div>

</fieldset>
</form>
-->
<footer>
rodapé
</footer>