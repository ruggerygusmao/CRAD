<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastrar Serviço</title>

<link rel="stylesheet" type="text/css"href="view/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"src="view/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function habilitar()
	{
	document.getElementById("habilitarSelect").disabled = false; //Habilitando
	}
	function desabilitar()
	{
		document.getElementById("habilitarSelect").disabled = true; //Desabilitando
	}
	</script>

</head>
<body>
<c:import url="menu.jsp"/>
<center><div>
	<hr>
	<h3>Cadastrar Servico</h3>
	<hr>
	
		<div style="text-align: center; color: red;"> ${mensagemServico} </div>
	
	
	<form action="incluirTipoSolicitacao" method="post" enctype="multipart/form-data">
		<p>
			<div class="form-group">
				<label for="descricao">Descrição:*</label>
				<input type="text" id="descricao" class="form-control"name="descricao" style="width: 200px;" maxlength="100" />
			</div>
		
		
			<div class="form-group">
				<label for="anexo">Anexo:*</label>
				<label>Sim</label><input type="radio" name="anexo" id="sim" value="true" onclick="habilitar()"/>
				<label>Não</label><input type="radio" name="anexo"id="nao" value="false" onclick="desabilitar()" />
			</div>
			
			<div class="form-group">
				<label for="documentos">Documentos:</label>
			<select multiple class="form-control" style="width: 390px;" name="documentos" id="habilitarSelect" disabled>
  				<option value="a">1-Atestado Médico</option>
  				<option value="b">2-Cópia da CTPS - Identificação e Contrato</option>
  				<option value="c">3-Declaração de Tranferência do Órgão</option>
  				<option value="d">4-Declaração da Empresa com o respectivo horário</option>
  				<option value="e">5-Guia de Transferência</option>
  				<option value="f">6-Histórico Escolar do Ensino Fundamental (original)</option>
  				<option value="g">7-Histórico Escolar do Ensino Médio (original)</option>
  				<option value="h">8-Histórico Escolar do Ensino Superior (original)</option>
  				<option value="i">9-Histórico Escolar do Ensino Técnico</option>
  				<option value="j">10-Ementas das disciplinas cursadas com Aprovação</option>
  				<option value="k">11-Declaração de Unidade Militar</option>
			</select>
			</div>
	
			<div class="form-group">
				<label for="anexo">Complemento:*</label>
				<label>Sim</label><input type="radio" name="complemento" value="true"  />
				<label>Não</label><input type="radio" name="complemento" value="false" />
			</div>
	
			<button type="reset" class="btn btn-danger" role="button">Limpar &nbsp;</button>
		<button type="submit" class="btn btn-success"> &nbsp; Cadastrar &nbsp; </button>
		
	</form>
</div></center>

</body>
</html>