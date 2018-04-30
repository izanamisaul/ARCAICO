<?php 

require_once "Conexion.php";

class Datos extends Conexion{

	public function registroAlumnoModel($datosModel, $tabla){

		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla (nombre_alumno,apellido_paterno,apellido_materno,numero_control,CURP,Semestre,sistema,carrera) VALUES (:nombre,:apellidoPaterno,:apellidoMaterno,:numerocontrol,:curp,:semestre,:sistema,:carreras)");

			

			$stmt->bindParam(":nombre", $datosModel["Nombre"], PDO::PARAM_STR); 
			$stmt->bindParam(":apellidoPaterno", $datosModel["ApellidoPaterno"], PDO::PARAM_STR);
			$stmt->bindParam(":apellidoMaterno", $datosModel["ApellidoMaterno"], PDO::PARAM_STR);
			$stmt->bindParam(":numerocontrol", $datosModel["NdeControl"], PDO::PARAM_STR);
			$stmt->bindParam(":curp", $datosModel["CURP"], PDO::PARAM_STR);
			$stmt->bindParam(":semestre", $datosModel["Semestre"], PDO::PARAM_INT);
			$stmt->bindParam(":sistema", $datosModel["Sistema"], PDO::PARAM_STR);
			$stmt->bindParam(":carreras", $datosModel["Carreras"], PDO::PARAM_STR);


			if($stmt->execute()){

				return "success";
			}
				else{

					print_r($stmt->errorInfo());
					print_r($stmt->errorInfo());
					return "error";
				}
	}
}

 ?>