if (data) {
	$('input[name="idacao"]').val(data.aidacao);
	$('input[name="nome_acao"]').val(data.anome_acao);
	$('input[name="dt_inicio"]').val(data.adt_inicio);
	$('input[name="dt_termino"]').val(data.adt_termino);
	$('input[name="hr_inicio"]').val(data.ahr_inicio);
	$('input[name="hr_termino"]').val(data.ahr_termino);
	$('input[name="lat"]').val(data.alatitude);
	$('input[name="lng"]').val(data.alongitude);
}

/* Status */ 
//Select Picker para operacao
var selectStatus = $('select[name="status"]');
$.ajax({
	type: 'POST',
	url: url+ "/api.php",
	data: {classe: "acao", metodo: "obterStatus", token: token},
	success: function(result) {	
		selectStatus.append( $('<option>', {text: '-- Novo Status --'}) );
		if ( ! result.data ) result.data = [];
		$.each( result.data, function(index, element) {
			selectStatus.append( $('<option>', {text: element.status}) );
		});

		if (data) selectStatus.val(data.status);
		else selectStatus.val(null);

		selectStatus.selectpicker();	
	}
});

$('select[name="status"]').change(function() {
	if ($(this).val() == '-- Novo Status --') {
		$('#div-status').html("<input class='form-control' type='text' id='status' name='status' placeholder='Escreva o status da ação' required>");
		$('status').change();
		$('status').focus();
	}
});

/* Operação */ 
//Select Picker para operacao
var selectOperacao = $('select[name="idoperacao"]');
$.ajax({
	type: 'POST',
	url: url+ "/api.php",
	data: {classe: "operacao", metodo: "obterTodos", token: token},
	success: function(result) {	
		if ( ! result.data ) result.data = [];
		$.each( result.data, function(index, element) {
			selectOperacao.append( $('<option>', {value: element.idoperacao, text: element.nome_operacao}) );
		});

		selectOperacao.html(selectOperacao.find('option').sort(function(x, y) {
			// to descending order switch "<" for ">"
			return $(x).text() > $(y).text() ? 1 : -1;
		}));

		if (data) selectOperacao.val(data.aidoperacao);
		else selectOperacao.val(null);	

		selectOperacao.selectpicker();				
	}
});


/* MAPA */
var lat = -4.023121;
var lng = -53.105999;
var zoom = 5;

if (data) {
	lat = data.alatitude;
	lng = data.alongitude;
	zoom = 16;
}

// Creating a map object
var map = L.map('map', {center: [lat, lng], zoom: zoom});

// Creating a Layer object
var layer = new L.tileLayer( 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a>'
	});
// Adding layer to the map
map.addLayer(layer);

// Creating scale control
var scale = L.control.scale().addTo(map); 

// Creating marker
var marker = new L.marker(map.getCenter(), {draggable: true}).addTo(map);

// Showi Address on clicked
marker.on('click', function () {
	geocodeReverse( this.getLatLng() );
});

// Showing Address on dragend
marker.on('dragend', function () {
	geocodeReverse( this.getLatLng() );
});

// Adding search control to the map
var searchControl = L.esri.Geocoding.geosearch({
	placeholder:'Procurar por lugares ou endereços',
	position: "topright",
	expanded: false
}).addTo(map);

// Adding results search to the map
var results = L.layerGroup().addTo(map);
searchControl.on('results', function(data){
	results.clearLayers();
	for (var i = data.results.length - 1; i >= 0; i--) {
		marker.setLatLng(data.results[i].latlng);
		popupAddress( data.results[i].properties );
	}
});

var popupAddress = function (address) {
	$('input[name=longlabel]').val(address.LongLabel);
	$('input[name=type]').val(address.Addr_type);
	$('input[name=placename]').val(address.PlaceName);
	$('input[name=address]').val(address.StAddr);
	$('input[name=district]').val(address.District);
	$('input[name=city]').val(address.City);
	$('input[name=region]').val(address.Region);
	$('input[name=postal]').val(address.Postal);
	$('input[name=lat]').val(address.Y);
	$('input[name=lng]').val(address.X);
	
	marker.bindPopup( "<p><b>Aqui é "+address.LongLabel+"</b>.<p><p>Clique na <b>lupa</b> para procurar um local ou endereço. Se nenhum endereço for encontrado, aumente o zoom e procure por um local próximo, depois arraste o icone até o local desejado.</p>", {minWidth: 300} ).openPopup();
}

// Service Geocode Reverse By Esri
var geocodeService = L.esri.Geocoding.geocodeService();
var geocodeReverse = function ( latlng ) {
	geocodeService.reverse().latlng( latlng ).run(function(error, result) {
		if ( result ) {
			var address = result.address;
			address['StAddr'] = result.address.Address;
			address['X'] = result.latlng.lng;
			address['Y'] = result.latlng.lat;
			popupAddress( address );
		} else {
			alert(error);
		}
	});	
}

// clicking on nav-tabs
setTimeout(function(){ map.invalidateSize() }, 300);

$('form').submit(function(){
	var formData = $(this).serializeArray();
	formData.push({name: 'classe', value: 'acao'});
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
				$('input[name="idacao"]').val(result.idoacao);
				alert('Ação ID '+result.idacao+' gravado!');
				datatable.ajax.reload(null, false);
			}
		}
	});
	return false;
});