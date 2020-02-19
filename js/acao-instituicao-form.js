//Listar instituicaoes
//Select Picker para instituicao
var selectInstituicao = $('select[name="idinstituicao"]');
$.ajax({
	type: 'POST',
	url: url+ "/api.php",
	data: {classe: "instituicao", metodo: "obterTodos", token: token},
	success: function(result) {	
		if ( ! result.data ) result.data = [];
		$.each( result.data, function(index, element) {
			selectInstituicao.append( $('<option>', {value: element.idinstituicao, text: element.instituicao}) );
		});

		selectInstituicao.html(selectInstituicao.find('option').sort(function(x, y) {
			// to descending order switch "<" for ">"
			return $(x).text() > $(y).text() ? 1 : -1;
		}));

		if (data) selectInstituicao.val(data.idinstituicao);
		else selectInstituicao.val(null);

		selectInstituicao.selectpicker();				
	}
});

$('form').submit(function(){
	var formData = $(this).serializeArray();
	formData.push({name: 'classe', value: 'acao_instituicao'});
	formData.push({name: 'metodo', value: 'salvar'});
	formData.push({name: 'token', value: token});
	$.ajax({
		type: 'POST',
		url: url+'/api.php',
		data: formData,
		success: function(result) {	
			if ( result.error ) {
				alert(result.error);
			} else {
				console.log(result);
				$('input[name="idinstituicao"]').val(result.idinstituicao);
				alert('Grupo de instituicao ID '+result.idinstituicao+' gravado!');
				datatable.ajax.reload(null, false);
			}
		}
	});
	return false;
});