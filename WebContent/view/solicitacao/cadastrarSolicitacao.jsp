<%@ page language="java" contentType="text/html; charset=iso-8859-1"   pageEncoding="iso-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registrar Solicita��o</title>

<link rel="stylesheet" type="text/css"href="view/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"src="view/bootstrap/js/bootstrap.min.js">
</script>
</head>

<body>
<c:import url="/view/menu/menu.jsp" />

<center>
	<hr>
	<h3>Registrar Solicita��o</h3>
	<hr>
			<div style="text-align: center; color: green;">${mensagemSucessoSolicitacao}</div>

	<form action="registrarSolicitacao" method="POST" enctype="multipart/form-data">
			
			<form:errors path="solicitacao.usuario" style="text-align: center; color: red;"/>
			<div class="form-group">
			<label for="usuario">Usuario:*</label><select id="usuario" name="usuario" class="form-control" style="width: 200px;" >
			
				<option value="">Selecione uma op��o</option>
				<c:forEach items="${listaUsuario}" var="usuario">
					<option value="${usuario.id}">${usuario.nome}</option>
				</c:forEach>
			
			</select>
			</div>
			
			<form:errors path="solicitacao.tipoSolicitacao" style="text-align: center; color: red;"/>
		<div class="form-group">
			<label for="tipoSolicitacao">Tipo de solicita��o:*</label>
			<select id="tipoSolicitacao" name="tipoSolicitacao" class="form-control" style="width: 200px;" >
			
				<option value="">Selecione uma op��o</option>
				<c:forEach items="${listaTipoSolicitacao}" var="obj">
					<option value="${obj.id}">${obj.descricao}</option>
				</c:forEach>
			
			</select>
			</div>
			
			<div class="form-group" id="mostrar" style="height:100px;width:300px;border:1px;visibility:hidden;">
				<label for="quantidade">Quantidade:</label>
			<select class="form-control" style="width: 390px;" name="quantidade">
  				<option value="1">1</option>
  				<option value="2">2</option>
  				<option value="3">3</option>
			</select>
			</div>
			
			<button type="reset" class="btn btn-danger" role="button">Limpar &nbsp; </button>
		<button type="submit" class="btn btn-success"> &nbsp; Cadastrar &nbsp;</button>
			
	</form>
	
</center>
</body>
</html>