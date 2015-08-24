<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>FORM</title>

    <link rel="stylesheet" href="/lib/materialize/dist/css/materialize.css" media="screen,projection"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="/lib/alertify-js/build/css/alertify.css"/>
    <link rel="stylesheet" href="/lib/alertify-js/build/css/themes/bootstrap.css"/>
</head>
<body>
<div class="container">
    <h3>Usuário</h3>

    <div class="row">
        <form id="form" class="col s12">
            <input type="hidden" id="id" name="id" value="${it.usuario.id}"/>
            <input type="hidden" id="version" name="version" value="${it.usuario.version}"/>

            <div class="row">
                <div class="input-field col s6">
                    <input type="text" id="nome" name="nome" value="${it.usuario.nome}">
                    <label for="nome">Nome</label>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <input type="date" class="datepicker" id="data" name="data" data-value="${it.usuario.data}">
                    <label for="data">Data</label>
                </div>
            </div>

            <div class="row">
                <div class="col s6">
                    <button class="btn waves-effect" type="submit">Salvar</button>
                    <c:if test="${not empty it.usuario.id}">
                        <button class="btn waves-effect red" type="button" onclick="excluir()">Excluir</button>
                    </c:if>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="/lib/jquery/dist/jquery.js"></script>
<script src="/lib/jquery.serializeJSON/jquery.serializejson.js"></script>
<script src="/lib/materialize/dist/js/materialize.js"></script>
<script src="/lib/alertify-js/build/alertify.js"></script>
<script src="/js/alertify-defaults.js"></script>
<script src="/js/pickadate-defaults.js"></script>
</body>
</html>

<script>
    $('#form').submit(function (event) {
        event.preventDefault();

        var form = $(this).serializeJSON();

        $.ajax({
            type: 'POST',
            url: '/usuarios',
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(form)
        });
    });

    function excluir() {
        alertify.confirm("Deseja realmente excluir o registro?", function () {
            $.ajax({
                type: 'DELETE',
                url: '/usuarios/' + $('#id').val() + '/' + $('#version').val()
            });
        });
    }

    $(function () {
        $('.datepicker').pickadate({
            selectMonths: true,
            selectYears: 15
        });
    });
</script>