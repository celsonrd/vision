<div class="col-md-10 col-md-offset-1">
   <div class="col-md-2">
     <h2><p class="text-center">Foto</p></h2>
     <img src="<?php echo base_url("/public/fotos/")."/$informacaoDoMilitar->foto"?>" class="img-thumbnail">
</div>
  <div class="col-md-10">
  <h2><p class="text-center">Informações Pessoais</p></h2>
    <div class="table-responsive">          
      <table class="table table-bordered table-condensed">
        <tbody>
          <tr>
            <td><b>Nome:</b></td>  
            <td><?php echo $informacaoDoMilitar->nome_do_militar;?></td>                    
          </tr>
          <tr>
            <td><b>Nome de guerra:</b></td>  
            <td><b><?php echo $informacaoDoMilitar->nome_de_guerra;?></b></td>                    
          </tr>
            <td><b>Identidade:</b></td>
            <td><?php echo $informacaoDoMilitar->identidade;?></td>
          </tr>
            <td><b>Orgão Expeditor:</b></td>
            <td><?php echo $informacaoDoMilitar->orgao_expedidor;?></td>            
          </tr>            
            <td><b>CPF:</b></td>
            <td><?php echo $informacaoDoMilitar->cpf;?></td>
          </tr>            
            <td><b>Telefone:</b></td>
            <td><?php echo $informacaoDoMilitar->telefone;?></td>
          </tr>
            <td><b>E-mail:</b></td> 
            <td><?php echo $informacaoDoMilitar->email;?></td>                                          
          </tr>
        </tbody>
      </table>
    </div>
  </div>

<!--Modal para salvar novas alterações-->
<div class="col-md-2 col-md-offset-5">
<button class="btn btn-success" data-toggle="modal" data-target="#modalAlteracao">Cadastrar Alteração</button>

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
            Add some text here
         </div>

         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            <button type="button" class="btn btn-primary">Salvar alteração</button>
         </div>
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
            <td><?php echo $informacaoDoMilitar->graduacao;?></td>
          </tr>
          <tr>
            <td><b>Arma / Quadro / Serviço:</b></td>
            <td><?php echo $informacaoDoMilitar->arma;?></td>
          </tr>
          <tr>
            <td><b>Tipo de serviço:</b></td>
            <td><?php echo $informacaoDoMilitar->tipo_militar;?></td>
          </tr>
          <tr>  
            <td><b>Referenciação:</b></td>
            <td><?php echo $informacaoDoMilitar->espec_cod . " - " . $informacaoDoMilitar->espec_desc;?></td>
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
        <span class="glyphicon glyphicon-info-sign"></span>Tempo de serviço até hoje <strong>Anos Meses Dias</strong>";?>
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
            <td><?php echo $informacaoDaAlteracao[0]->nome_da_om;?></td>
          </tr>
          <tr>          
            <td><b>Documento:</b></td>
            <td><?php echo $informacaoDaAlteracao[0]->documento;?></td>
          </tr>
          <tr>
            <td><b>Data inicio:</b></td>
            <td><?php echo date("d/m/Y",$informacaoDaAlteracao[0]->data_inicio);?></td>
          </tr>
          <tr>
            <td><b>Data Fim:</b></td>
            <td><?php echo date("d/m/Y",$informacaoDaAlteracao[0]->data_fim);?></td>
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
        <?php foreach ($informacaoDaAlteracao as $key => $value) {?>
          <tr>
            <td><b>OM:</b></td>
            <td><? echo $informacaoDaAlteracao[$key]->nome_da_om ?></td>
            <td><b>Data inicio:</b></td>
            <td><? echo date("d/m/Y",$informacaoDaAlteracao[$key]->data_inicio) ?></td>
            <td><b>Data Fim:</b></td>
            <td><? echo date("d/m/Y",$informacaoDaAlteracao[$key]->data_fim) ?></td>
            <td><b>Documento:</b></td>
            <td><? echo $informacaoDaAlteracao[$key]->documento ?></td>
            <td><b>Estágio:</b></td>
            <td><? echo $informacaoDaAlteracao[$key]->eis ?></td>
          </tr>   
          <? } ?>
        </tbody>
      </table>
    </div>
  <br/>





<br/><br/><br/><br/>

  


  </div>
