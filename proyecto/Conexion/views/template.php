<!DOCTYPE html>
<html lang="es">
<head>

	<!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="../css/materialize.css"  media="screen,projection"/>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    

      
	<meta charset="UTF-8">
	<title>Document</title>
</head>

<body>






<?php include "views/navegacion.php"; ?>

<?php
 $mvc = new MvcController();
 $mvc -> enlacesPaginaController();
 ?>

<?php include "views/footer.php"; ?>



<script src="../js/jquery-3.2.0.min.js"></script>  

	 <!--JavaScript at end of body for optimized loading-->
      <script type="text/javascript" src="../js/materialize.min.js"></script>   
<script > 
      // Or with jQuery

  $(document).ready(function(){
    $('select').formSelect();

    $(".dropdown-trigger").dropdown();

    $(".sidenav").sidenav();
    $('.parallax').parallax();



    var categorias =$('.pushpin-demo-nav');
    if(categorias.length){
      categorias.pushpin({top:categorias.offset().top});
    }

  });

</script>





</body>
</html>