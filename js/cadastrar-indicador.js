$('title').text('Cadastro de Orgão');

var datatable = $('#datatable').DataTable( {
	"ajax": {
		"url": url + '/api.php',
		"deferRender": true,
		"dataSrc": function (json) { if (json.data) return json.data; else return false; },
		"type": "POST",
		"data": function (d) {
			d.classe = 'indicador';
			d.metodo = 'obterTodos';
			d.token = token;
		}
	},
	"columns": [
		{ "data": "idindicador", "className": "details-control" },
		{ "data": "indicador", "className": "details-control", "visible": true},
		{ "data": "idgrupo_indicador", "className": "details-control", "visible": true},
		{ "data": "dt_update", "className": "details-control dt-body-right", "visible": true, "render": function(datetime) { return datetime_format(datetime,'d/m/y h:i')} }
	],
	"responsive": true,		
	"language": {
		"url": "lib/datatables/Portuguese-Brasil.lang"
	}
});

$('#datatable tbody').on('click', 'tr', function () {
	data = datatable.row( this ).data();
	loadForm();
});

$('#btn-novo').click(function() {
	data = null;
	loadForm();
});

function loadForm() {
	$('.modal-content').load('partial/cadastrar-indicador-form.html', function(response,status) {
		if ( status == 'success' ) $('.modal').modal('show');
	});
}