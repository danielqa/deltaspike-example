<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>JSP</title>
</head>
<body>
<h1>Usuário</h1>

<table>
    <thead>
    <th>
    <td>#</td>
    <td>Nome</td>
    </th>
    </thead>
    <tbody>
    <c:forEach var="usuario" items="${it.usuarios}">
        <tr>
            <td>
                <a href="/usuarios/${usuario.id}">Edit</a>
            </td>
            <td>${usuario.nome}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="/usuarios/novo">Novo</a>

</body>
</html>