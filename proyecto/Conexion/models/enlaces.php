<?php 
class Paginas{
	public function enlacesPaginaModel($enlaces){
		if($enlaces=="Index" || $enlaces== "RegistroAlumno"|| $enlaces== "Docentes"|| $enlaces== "ActividadesComplementarias"|| $enlaces== "Congresos"){
			$module = "views/modules/".$enlaces.".php";
		}
		else{
			$module = "views/modules/Index.php";
		}
		return $module;		
	}
}

 ?>