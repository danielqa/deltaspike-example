<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>LIST</title>

    <link rel="stylesheet" href="/lib/materialize/dist/css/materialize.css" media="screen,projection"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="/css/app.css"/>
</head>
<body>
<div class="container">
    <h3>Usuário</h3>

    <table class="bordered">
        <thead>
        <tr>
            <th width="5%">#</th>
            <th>Nome</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="usuario" items="${it.usuarios}">
            <tr>
                <td>
                    <a class="waves-effect btn-floating" href="/usuarios/${usuario.id}">
                        <i class="material-icons right">edit</i>
                    </a>
                </td>
                <td>${usuario.nome}</td>
            </tr>
        </c:forEach>
        <c:if test="${empty it.usuarios}">
            <tr>
                <td colspan="2">
                    <span>Nenhum registro encontrado!</span>
                </td>
            </tr>
        </c:if>
        </tbody>
    </table>

    <a class="waves-effect btn" href="/usuarios/novo">Novo</a>
</div>

<script src="/lib/jquery/dist/jquery.js"></script>
<script src="/lib/materialize/dist/js/materialize.js"></script>
</body>
</html>