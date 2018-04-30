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

	public function registroUsuarioController()
	{

		if(isset($_POST["Nombre"]))
		{
		$datosController = array("Nombre"=>$_POST["Nombre"],
						"ApellidoPaterno"=>$_POST["ApellidoPaterno"],
						"ApellidoMaterno"=>$_POST["ApellidoMaterno"],
						"NdeControl"=>$_POST["NdeControl"],
						"CURP"=>$_POST["CURP"],
						"Semestre"=>$_POST["Semestre"],
						"Sistema"=>$_POST["Sistema"],
						"Carreras"=>$_POST["Carreras"]);

		$respuesta = DatosAlumno::registroAlumnoModel($datosController, "alumnos");
		
		if ($respuesta == "success") {
			header("location:index.php?ITSX=usuarioRegistrado");
		}
		else{
			header("location:index.php");
		}
		}
		

	}
}

 ?>