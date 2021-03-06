<?php

/*
 *  Arquivo de cadastro de usuários
 * @author Álvaro Bacelar
 * @date 06/05/2016
 */
require_once './lib/smarty/config/config.php';
require_once './includes/funcoes/verifica.php';
require_once './includes/models/ManipulateData.php';

if ($estaLogado == "SIM") {

    if ($nivel == "admin") {

        // verificação de erro de senhas ou de duplicação de usuário no cadastro (feedback para o usuário)
        if (isset($_SESSION["erro"])) {
            if ($_SESSION["erro"] == "ERRO") {
                $smarty->assign("erroCadastro", "<div class='alert alert-danger' role='alert'>As senhas não conferem</div>");
            } else if ($_SESSION["erro"] == "duplicado") {
                $smarty->assign("erroCadastro", "<div class='alert alert-danger' role='alert'>Usuário já cadastrado</div>");
            } else if ($_SESSION["erro"] == "Cadastrado") {
                $smarty->assign("erroCadastro", "<div class='alert alert-success' role='alert'>Usuário cadastrado com sucesso!</div>");
            } else if ($_SESSION["erro"] == "vazio") {
                $smarty->assign("erroCadastro", "<div class='alert alert-danger' role='alert'>Erro ao cadastrar novo usuário, não foi informado os parâmetros para cadastro!</div>");
            }
        } else {
            $smarty->assign("erroCadastro", "");
        }
        unset($_SESSION["erro"]);

        $buscaGrupo = new ManipulateData();
        $buscaGrupo->setTable("grupo_servidor");
        $buscaGrupo->select();
        while ($resultado[] = $buscaGrupo->fetch_object()) {
            $smarty->assign("grupo", $resultado);
        }

        $smarty->assign("conteudo", "paginas/cadastrarUsuario.tpl");
        $smarty->display("HTML.tpl");
    } else {
        header("Location: accessDenied.php");
    }
}