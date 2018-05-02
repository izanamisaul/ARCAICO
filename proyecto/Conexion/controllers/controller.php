<?php 
class MvcController{

	#llamar la plantilla
	#------------
	public function pagina(){
		include "views/template.php";

	}

	
	public function enlacesPaginaController(){
	
		if(isset( $_GET["ITSX"])){
			$enlaces = $_GET["ITSX"];
		}
		else{
			$enlaces = "Index";
		}
		$respuesta = Paginas::enlacesPaginaModel($enlaces);
		include $respuesta;
	}
}

 ?>