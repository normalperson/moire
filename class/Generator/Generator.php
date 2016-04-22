<?php
require_once(dirname(__FILE__).'/../../init.inc.php');
require_once(dirname(__FILE__).'/src/autoload.php');

class Generator{
	function __construct(){
		global $HTML, $GLOBAL, $DB, $USER;
		$curdir = dirname(__FILE__);

		// $list = glob($curdir.DS.'*.php');
		// pr($list);

		if(!isset($_GET['webf']) || empty($_GET['webf'])) return;
		$func = $_GET['webf'];
		if(file_exists($curdir.DS.$func.'.php')){
			//include($curdir.DS.$func.'.php');
		}else{
			//html_header();
			// echo '<!-- function not found -->';
		}
	}
	function generateJobSheetData(){
		global $DB;
		$numberofrecord = 10000000;
		set_time_limit ( 0 );
		echo "Start------------------- ".date('Y-m-d H:i:s')."------------------------<br\>\n";

		$faker = Faker\Factory::create();
		//$faker->seed(5);

		$sql = "select org_id from fcorg where org_external = 'Y' and org_status = 'ACTIVE'";
		$customerarr = $DB->GetArray($sql,null, PDO::FETCH_ASSOC);
		

		for ($i=0; $i < $numberofrecord; $i++) {

			$jsorgid = $faker->randomElement($customerarr);
			$currency = $DB->GetOne("select rg_currency from fcorg join mregion on org_region = rg_code where org_id = :0",array($jsorgid['org_id']), PDO::FETCH_ASSOC);
			$data = array( 'js_completiondate'   => $faker->dateTimeThisMonth($max = 'now')->format('Y-m-d H:i:s') ,
							'js_currency'        => $currency,
							'js_finalprice'      => $faker->randomElement($array = array (5,10,15,20,25,30,35,40,45)),
							'js_totalinch'       => $faker->numberBetween($min = 30, $max = 300),
							'js_rate'            => 3.3,
							'js_status'          => 'COMPLETED',
							'js_orgid'           => $jsorgid['org_id'],
							'js_description'     => $faker->sentence($nbWords = 6)
				         );
			$ok = $DB->doInsert('mjobsheet',$data);

		}

		echo "End-------------------------".date('Y-m-d H:i:s')."---------------------------<br\>\n\n";
	}
	
}

$Generator = new Generator();
?>