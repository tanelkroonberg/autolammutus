/**
 * Created with JetBrains PhpStorm.
 * User: Rüperaal
 * Date: 30.04.13
 * Time: 12:47
 * To change this template use File | Settings | File Templates.
 */
function select_car(){

}
$(function(){
	$('#cars').bind('change', function(event){
		$('#models option').remove();
		$.ajax({
			method: 'post',
			dataType: 'html',
			url: BASE_URL +'parts/get_models',
			data: { car: $('#cars option:selected').attr('value') },
			complete: function($data){
				var models = eval($data.responseText);
				for (var key in models) {
					var model = models[key];
					var name = model['name'];
					var id = model['id'];
					$('#models').append($('<option>', {
						id: id,
						text : name
					}));
				}
			}
		})
	});
	$('#models').bind('click', function(event){
		$('#engine_size option').remove();
		$.ajax({
			method: 'post',
			dataType: 'html',
			url: BASE_URL +'parts/get_engine_size',
			data: { models: $('#models option:selected').val() },
			complete: function($data){
				var engine_sizes = eval($data.responseText);
				console.log(engine_sizes);
				for (var key in engine_sizes) {
					var engine_size = engine_sizes[key];
					var name = engine_size['engine_size'];
					$('#engine_size').append($('<option>', {
						text : name
					}));
			}
			}
		})
		});
	$('#search').bind('click', function(event){
		$.ajax({
			method: 'post',
			dataType: 'html',
			url: BASE_URL +'parts/get_result',
			data: {
				car: $('#cars option:selected').attr('value'),
				models: $('#models option:selected').val(),
				engine_size:$('#engine_size option:selected').val()
			},
			complete: function($data){
				console.log($data);
			}
		})
	})

});