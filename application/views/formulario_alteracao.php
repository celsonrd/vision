<?php

//converter o array de objetos em array simples
$militar = (array) $militar;

?>

<div class="col-md-10 col-md-offset-1">
   <div class="col-md-2">
     <h2><p class="text-center">Foto</p></h2>
     <img src="<?php echo base_url("/public/fotos/")."/".$militar['informacaoDoMilitar']->foto?>" class="img-thumbnail">
</div>
  <div class="col-md-10">
  <h2><p class="text-center">Informações Pessoais</p></h2>
    <div class="table-responsive">          
      <table class="table table-bordered table-condensed">
        <tbody>
          <tr>
            <td>Nome:</td>  
            <td><?php echo $militar['informacaoDoMilitar']->nome_do_militar;?></td>                    
          </tr>
          <tr>
            <td>Nome de guerra:</td>  
            <td><?php echo $militar['informacaoDoMilitar']->nome_de_guerra;?></strong></td>                    
          </tr>
            <td>Identidade:</td>
            <td><?php echo $militar['informacaoDoMilitar']->identidade;?></td>
          </tr>
            <td>Orgão Expeditor:</td>
            <td><?php echo $militar['informacaoDoMilitar']->orgao_expedidor;?></td>            
          </tr>            
            <td>CPF:</td>
            <td><?php echo $militar['informacaoDoMilitar']->cpf;?></td>
          </tr>            
            <td>Telefone:</td>
            <td><?php echo $militar['informacaoDoMilitar']->telefone;?></td>
          </tr>
            <td>E-mail:</td> 
            <td><?php echo $militar['informacaoDoMilitar']->email;?></td>                                          
          </tr>
        </tbody>
      </table>
    </div>
  </div>



<!--Modal para salvar novas alterações-->
<div class="col-md-2 col-md-offset-5">
<button class="btn btn-success" data-toggle="modal" data-target="#modalAlteracao">Cadastrar Alteração</button>
</div>


<!-- Modal -->
<div class="modal fade" id="modalAlteracao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
        
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">
               Preencha todas as informações
            </h4>
        </div>

         <div class="modal-body">
          <form class="form-horizontal" action="<?php echo base_url('index.php');?>/militar/salvarAlteracao" method="post">
            <fieldset>

            <!-- Select Basic -->
            <div class="form-group">
              <label class="col-md-5 control-label" for="tipo_alteracao">Tipo de Alteração:</label>
              <div class="col-md-4">
                <select id="tipo_alteracao" name="tipo_alteracao" class="form-control">
                  <option></option>
                  <?php
                  foreach ($tipoAlteracao -> result() as $tipo) {
                  echo'<option value="' . $tipo->id_tipo_alteracao . '">'. $tipo->descricao . '</option>';
                  }   
                  ?>
                </select>
              </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
              <label class="col-md-5 control-label" for="om">Organiação miltiar:</label>
              <div class="col-md-4">
                <select id="tipo_alteracao" name="tipo_alteracao" class="form-control">
                <option></option>
                  <?php
                  foreach ($om -> result() as $value) {
                  echo'<option value="' . $value->id_om . '">'. $value->nome . '</option>';
                  }   
                  ?>
                </select>
              </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
              <label class="col-md-5 control-label" for="documento">Boletim incorporação / prorrogação:</label>  
              <div class="col-md-4">
              <input id="documento" name="documento" type="text" placeholder="" class="form-control input-md">
                
              </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
              <label class="col-md-5 control-label" for="data_incio">Data Inicial:</label>  
              <div class="col-md-4">
              <input id="data_incio" name="data_incio" type="text" placeholder="" class="form-control input-md">                
              </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
              <label class="col-md-5 control-label" for="observacao">Observação:</label>  
              <div class="col-md-4">
                <textarea class="form-control" id="observacao" name="observacao" for="observacao"></textarea>

            
              </div>
            </div>

            <!-- Button (Double) -->
            <div class="form-group">
              <label class="col-md-5 control-label" for="salvar">Operações:</label>
              <div class="col-md-7">
                <button id="salvar" name="salvar" class="btn btn-success">Salvar</button>
                <button id="cancelar" name="cancelar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
              </div>
            </div>

            </fieldset>
            </form>

        </div>
      </div>
  </div>
</div>

  <div class="col-md-10 col-md-offset-1">
    <h2><p class="text-center">Informações Militares</p></h2>
    <div class="table-responsive">          
      <table class="table table-bordered table-condensed">
        <tbody>
          <tr>
            <td><b>Posto / Graduação:</b></td>
            <td><?php echo $militar['informacaoDoMilitar']->graduacao;?></td>
          </tr>
          <tr>
            <td><b>Arma / Quadro / Serviço:</b></td>
            <td><?php echo $militar['informacaoDoMilitar']->arma;?></td>
          </tr>
          <tr>
            <td><b>Tipo de serviço:</b></td>
            <td><?php echo $militar['informacaoDoMilitar']->tipo_militar;?></td>
          </tr>
          <tr>  
            <td><b>Referenciação:</b></td>
            <td><?php echo $militar['informacaoDoMilitar']->espec_cod . " - " . $militar['informacaoDoMilitar']->espec_desc;?></td>
          </tr>      
        </tbody>
      </table>
      <div class="alert alert-info text-center" role="alert">
        <span class="glyphicon glyphicon-info-sign"></span>A ultima prorrogação tem <strong> Anos Mes Dias</strong>
      </div>      
      <div class="alert alert-info text-center" role="alert">
        <span class="glyphicon glyphicon-info-sign"></span>Data limite para serviço na ativa <strong>Anos Meses Dias </strong>
      </div>
      <div class="alert alert-info text-center" role="alert">
        <span class="glyphicon glyphicon-info-sign"></span>Tempo de serviço até hoje <strong>Anos Meses Dias</strong>
      </div>
    </div>
  </div>  

  <div class="col-md-10 col-md-offset-1">
  <h2><p class="text-center">Estágio Atual</p></h2>
    <div class="table-responsive">          
      <table class="table table-bordered table-condensed">
        <tbody>
          <tr>
            <td><b>OM:</b></td>
            <td><?php //echo $informacaoDaAlteracao[0]->nome_da_om;?></td>
          </tr>
          <tr>          
            <td><b>Documento:</b></td>
            <td><?//php echo $informacaoDaAlteracao[0]->documento;?></td>
          </tr>
          <tr>
            <td><b>Data inicio:</b></td>
            <td><?//php echo date("d/m/Y",$informacaoDaAlteracao[0]->data_inicio);?></td>
          </tr>
          <tr>
            <td><b>Data Fim:</b></td>
            <td>  <?//php echo date("d/m/Y",$informacaoDaAlteracao[0]->data_fim);?></td>
          </tr>     
        </tbody>
      </table>
    </div>
    <!-- Alertas -->
    <div class="alert alert-success" role="alert">
        <strong>Aviso!</strong> Solicitação de prorrogação de tempo de serviço <strong>RECEBIDA</strong>
    </div>
    <div class="alert alert-warning" role="alert">
        <strong>Aviso!</strong> Prazo de solicitação de prorrogação de tempo de serviço <strong>ATRASADA</strong> 
    </div>
    <div class="alert alert-danger" role="alert">
        <strong>Aviso!</strong> Solicitação de prorrogação de tempo de serviço <strong>NÃO RECEBIDA</strong>
    </div>
    </div>


  <div class="col-md-12">
   <h2><p class="text-center">Histórico Do Militar</p></h2>
    <div class="table-responsive">          
      <table class="table table-bordered table-condensed">
        <tbody>
        <?php //foreach ($informacaoDaAlteracao as $key => $value) {?>
          <tr>
            <td><b>OM:</b></td>
            <td><? //echo $informacaoDaAlteracao[$key]->nome_da_om ?></td>
            <td><b>Data inicio:</b></td>
            <td><? //echo date("d/m/Y",$informacaoDaAlteracao[$key]->data_inicio) ?></td>
            <td><b>Data Fim:</b></td>
            <td><? //echo date("d/m/Y",$informacaoDaAlteracao[$key]->data_fim) ?></td>
            <td><b>Documento:</b></td>
            <td><? //echo $informacaoDaAlteracao[$key]->documento ?></td>
            <td><b>Estágio:</b></td>
            <td><? //echo $informacaoDaAlteracao[$key]->eis ?></td>
          </tr>   
          <? //} ?>
        </tbody>
      </table>
    </div>
  <br/>
  </div>
