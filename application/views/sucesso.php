<script type="text/javascript">
    $(window).load(function(){
        $('#sucessoCadastroMilitar').modal('show');
    });
</script>

<div class="modal fade" id="sucessoCadastroMilitar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Aviso!</h4>
      </div>
      <div class="modal-body">
        <h2><p class="strong">Militar cadastrado com sucesso!</p></h2>
      </div>
      <div class="modal-footer text-center">
      <?php echo anchor(base_url('index.php/administrarMilitar'),"Página Inicial",'class="btn btn-warning"');?>
      <?php echo anchor(base_url('index.php/militar/exibirAlteracao/#modalAlteracao'),"Cadastrar Alteração",'class="btn btn-success"');?>
      <?php echo anchor(base_url('index.php/militar/exibirFormularioDeCadastro'),"Cadastrar Novo Militar",'class="btn btn-primary"');?>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->