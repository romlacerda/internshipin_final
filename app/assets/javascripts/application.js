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

$(document).ready(function() {
	$("#topic_subcategory_id").html('');
	$("#topic_category_id").on('change', function() {
		$("#topic_subcategory_id").prop('disabled', false);

		var categoria = $("#topic_category_id").val();
		populaSelectSubcategoria(categoria);
	});



});


function abrirModalDuvidaEnviada() {

	var selectCategoria = $("#topic_category_id").val();
	var selectSubcategoria = $("#topic_subcategory_id").val();
	var selectTitulo = $("#topic_titulo").val();
	var selectDescricao = $("#topic_descricao").val();

	if (selectCategoria != "" && selectSubcategoria != "" && 
		selectTitulo != "" && selectDescricao != "") {
		$("#myModal").modal("show");
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
	$("#myModal").modal("hide");
}

function responderResposta(answer) {
	$("#caixaDeResposta_" + answer).show();
}
