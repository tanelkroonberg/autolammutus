<select id="cars">

	<?if(!empty($cars)): foreach($cars as $car):?>
	<option value="<?=$car['id']?>"><?=$car['name']?></option>
	<?endforeach;endif?>
</select>

<select id="models">
</select>

<select id="engine_size">
</select>

<button id="search">Otsi tulemusi!</button>