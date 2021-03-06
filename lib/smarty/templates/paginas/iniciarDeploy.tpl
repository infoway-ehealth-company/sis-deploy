<div class="panel panel-primary">
    <div class="panel-heading">
        <h2 class="panel-title">Escolha Servidor para Deploy</h2>
    </div>

    {literal}
        <script type="text/javascript">
            $(document).ready(function () {
                $("a").click(function () {
                    var acao = $(this).attr("value");
                    $.ajax({
                        url: "execShell.php", // pagina que irá aparecer
                        type: 'POST', // metodo de recebimento: GET ou POST 
                        data: {fileOk: acao},
                        success: function (data) {
                            $("#conteudo").html(data);
                        },
                        error: function () { // se der erro mostrará uma mensagem
                            $("#conteudo").html("Erro ao executar os comandos");
                        },
                        beforeSend: function () { // antes de mostrar a requisição mostra uma mensagem
                            $("#conteudo").html("<center><img src='img/hourglass.gif' width='70'></center>");
                        }
                    });
                });
            });

        </script>
    {/literal}

    <div class="table-responsive table-bordered">
        <table class="table">

            <nav class="text-center">
                <ul class="pagination">
                    <li class="disabled"><a  aria-label="Previous"><span aria-hidden="true">1º Escolher Servidor</span></a></li>
                    <li class="disabled"><span aria-hidden="true"><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></span></li>
                    <li class="disabled"><a  aria-label="Previous"><span aria-hidden="true">2º Escolher Sistema</span></a></li>
                    <li class="disabled"><span aria-hidden="true"><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></span></li>
                    <li class="disabled"><a  aria-label="Previous"><span aria-hidden="true">3º Enviar arquivo</span></a></li>
                    <li class="disabled"><span aria-hidden="true"><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></span></li>
                    <li class="active"><a >4º Inicar Deploy <span class="sr-only">(current)</span></a></li>
                </ul>
            </nav>

            {if !empty($file)}
                <th><center>Sistema</center></th>             
                <th><center>Usuario</center></th>
                <th><center>Servidor</center></th>
                <th><center>Arquivo</center></th>
                <th><center>Ação</center></th>
                <tr class="text-center">                       
                    <td class="active">{$file->nome_sistema}</td>                        
                    <td class="active">{$file->nome_usuarios_servidor}</td>
                    <td class="active">{$file->nome_servidor}<br><small>(IP - {$file->ip_servidor})</small></td>
                    <td class="active">{$file->nome_file_deploy}</td>
                    <td class="active">
                        <a type="button" value='{$file->id_file_deploy}' title="O arquivo será enviado para o servidor {$file->ip_servidor} e depois será feito o deploy"  class="btn btn-success"> <span class="glyphicon glyphicon-share"></span> Iniciar Deploy</a>
                    </td>
                </tr>
            {else}
                <tr class="text-center"><td><h3>Nenhum arquivo enviado</h3></td></tr>
                        {/if}
        </table>
        <div id="load"></div>
        <br>
        <div class="alert alert-success" id="conteudo" role="alert"></div>
    </div>
    <br />
</div>
<center><a class="btn btn-default" href="javascript:history.back()"><span class="glyphicon glyphicon-circle-arrow-left"></span> Voltar</a></center> 
