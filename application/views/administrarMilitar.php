<script type="text/javascript">
$(document).ready( function () {
    $('#table_id').DataTable({
        "scrollCollapse": true,
        "paging": false
    });
    new $.fn.dataTable.FixedColumns(table);
} );
</script>

<table id="table_id" class="display">
    <thead>
        <tr>
            <th class='text-center'>OM</th>
            <th class='text-center'>Referenciação</th>
            <th class='text-center'>Arma</th>
            <th class='text-center'>Nome</th>
            <th class='text-center'>Editar</th>
        </tr>
    </thead>
    <tbody>
    <?php
        foreach ($militares->result() as $militar) {
            echo "<tr>";
            echo "<td class='text-center'>" . $militar->nome_da_om . "</td>";
            echo "<td class='text-center'>" . $militar->desc_referenciacao . " - " . $militar->cod_referenciacao ."</td>";
            echo "<td class='text-center'>" . $militar->aqs_desc . "</td>";
            echo "<td class='text-center'>" . $militar->nome_do_militar . "</td>";
            echo "<td class='text-center'>" . " <span class='glyphicon glyphicon-edit'</span> </td>";
            echo "</tr>";
        }
        ?>
    </tbody>
</table>
 