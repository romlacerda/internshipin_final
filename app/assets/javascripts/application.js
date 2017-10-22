// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
//= require bootstrap-datepicker


$(document).on('turbolinks:load', function() {
    $('[data-toggle="tooltip"]').tooltip(); 
	$("#topic_subcategory_id").html('');
	$("#topic_category_id").on('change', function() {
		$("#topic_subcategory_id").prop('disabled', false);
		var categoria = $("#topic_category_id").val();
		populaSelectSubcategoria(categoria);
	});

	$("#botaoAtivarFiltros").on("click", function() {
		$("#caixaFiltros").show();
	});

	//Tela de Cadastro
	$("#user_matricula").on("blur", function() {
		if($("#user_cpf").val() != "" && $("#user_matricula").val() != "") {
			getDadosCadastro();
		} else {
		}
	})
	$("#user_cpf").on("blur", function() {
		if($("#user_cpf").val() != "" && $("#user_matricula").val() != "") {
			getDadosCadastro();
		} else {
		}
	})

});

function getDadosCadastro() {
	$matricula = $("#user_matricula").val();
	$cpf = $("#user_cpf").val();

	$.ajax({
		type: 'POST',
		dataType: 'json',
		url: '/registrations/getDadosCadastro',
		data: { matricula: $matricula, cpf: $cpf },
		success: function(result) {
			if(result != null) {
				$("#user_nome").val(result.nome);
				$("#user_sobrenome").val(result.sobrenome);
				$("#buttonCadastrar").prop('disabled', false);
			} else {
			}
			
		}
	})
}


function searchTopics() {
	$categoria = $("#topic_category_id").val();
	$subcategoria = $("#topic_subcategory_id").val();

	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: '/topics/search',
		data: { category_id: $categoria, subcategory_id: $subcategory },
		success: function(result) {
			alert(result);
		}
	})
}





function abrirModalDuvidaEnviada() {

	var selectCategoria = $("#topic_category_id").val();
	var selectSubcategoria = $("#topic_subcategory_id").val();
	var selectTitulo = $("#topic_titulo").val();
	var selectDescricao = $("#topic_descricao").val();

	if (selectCategoria != "" && selectSubcategoria != "" && 
		selectTitulo != "" && selectDescricao != "") {
		$("#duvidaEnviadaModal").modal("show");
	} else {
		console.log('Preencha os campos')
	} 
}


function abrirModalDuvidaEditada() {

	var selectCategoria = $("#topic_category_id").val();
	var selectSubcategoria = $("#topic_subcategory_id").val();
	var selectTitulo = $("#topic_titulo").val();
	var selectDescricao = $("#topic_descricao").val();

	if (selectCategoria != "" && selectSubcategoria != "" && 
		selectTitulo != "" && selectDescricao != "") {
		$("#duvidaEditadaModal").modal("show");
	} else {
		console.log('Preencha os campos')
	} 
}

function populaSelectSubcategoria(category_id) {
	$.ajax({
		type: 'POST',
		dataType: 'json',
		url: '/subcategories/getByCategoryId',
		data: { category_id: category_id },
		success: function(result) {
			console.log(result);
			var options = "";
			$("#topic_subcategory_id").html();
			$(result).each(function(index, item) {
				if(item.category_id == category_id) {
					options += '<option value='+ item.id + '>' + item.nome + '</option>';
				}
			});
			$("#topic_subcategory_id").empty().append(options);
		}
	})
}

function fecharModalDuvidaEnviada() {
	$("#duvidaEnviadaModal").modal("hide");
}

function fecharModalDuvidaEditada() {
	$("#duvidaEditadaModal").modal("hide");
}

function responderResposta(answer) {
	$("#caixaDeResposta_" + answer).show();
}
