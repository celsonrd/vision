<script type="text/javascript">
$(document).ready( function () {
    $('#TabelaMilitares').DataTable({
        "scrollCollapse": true,
        "paging": false,
        "pagingType": "scrolling"
    });
    new $.fn.dataTable.FixedColumns(table);
} );
</script>

<table id="TabelaMilitares" class="display">
    <thead>
        <tr>
            <th class='text-center'>Nome</th>
            <th class='text-center'>Nome de guerra</th>
            <th class='text-center'>Arma</th>
            <th class='text-center'>Editar</th>
        </tr>
    </thead>
    <tbody>
    <?php
        foreach ($militares->result() as $militar) {
            echo "<tr>";
            echo "<td class='text-center'>" . $militar->nome_do_militar ."</td>";
            echo "<td class='text-center'>" . $militar->nome_de_guerra . "</td>";
            echo "<td class='text-center'>" . $militar->desc_arma . "</td>";
            echo "<td class='text-center'>" . anchor("index.php/militar/exibirAlteracao/$militar->id_militar",'<span class="glyphicon glyphicon-user"</span>') . "</td>";
            //echo "<td class='text-center'>" . "  </td>";
            echo "</tr>";
        }
        ?>
    </tbody>
</table>
 