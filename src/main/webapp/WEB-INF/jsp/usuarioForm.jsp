<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>JSP</title>
</head>
<body>
<h1>Usuário</h1>

<form id="form">
    <input type="hidden" id="id" name="id" value="${it.usuario.id}"/>
    <input type="hidden" id="version" name="version" value="${it.usuario.version}"/>

    <span>Nome: </span>
    <input type="text" name="nome" value="${it.usuario.nome}"/>
    <button type="submit">Salvar</button>
    <button type="button" onclick="excluir()">Excluir</button>
</form>

<script src="/js/jquery.js"></script>
<script src="/js/jquery.serializejson.js"></script>
</body>
</html>

<script>
    $('#form').submit(function (event) {
        event.preventDefault();

        $.ajax({
            type: 'POST',
            url: '/usuarios',
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify($(this).serializeJSON())
        });
    });

    function excluir() {
        $.ajax({
            type: 'DELETE',
            url: '/usuarios/' + $('#id').val() + '/' + $('#version').val()
        });
    }
</script>