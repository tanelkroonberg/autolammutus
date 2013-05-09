<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Rüperaal
 * Date: 30.04.13
 * Time: 11:17
 * To change this template use File | Settings | File Templates.
 */

class parts
{

	function index()
	{
		global $request;
		$this->scripts[] = 'parts.js';
		$cars =get_all("select * from brand where deleted = 0");
		require 'views/master_view.php';
	}
	function get_models(){
		global $request;
		$this->scripts[] = 'parts.js';
		if(isset($_POST['car'])){
			$id = $_POST['car'];
			$models= get_all("select name, id from model where brand_id = '$id' and deleted = 0");
			$models = json_encode($models, true);
			ob_end_clean();
			exit($models);
		}
	}
		function get_engine_size(){
		global $request;
		$this->scripts[] = 'parts.js';
		if(isset($_POST['models'])){
			$model_name = $_POST['models'];
			$model_id = q("SELECT id FROM model where name='$model_name'");
			$engine_sizes= get_all("select engine_size from model NATURAL JOIN model_specification where id = '$model_id' and deleted = 0");
			$engine_sizes = json_encode($engine_sizes, true);
			ob_end_clean();
			exit($engine_sizes);
		}
		}
		function get_result(){
			global $request;
			$this->scripts[] = 'parts.js';
			if(isset($_POST)){
				$car= $_POST['car'];

				$model_name = $_POST['models'];
				$model_id = q("SELECT id FROM model where name='$model_name'");

				$engine_size = $_POST['engine_size'];
				$result = get_all("SELECT * FROM brand NATURAL JOIN  where brand.id='$car'");
				$result = json_encode($result, true);
			ob_end_clean();
			exit($result);
			}
		}
}