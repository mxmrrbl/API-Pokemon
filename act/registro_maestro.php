<?php
    include('../libreria/principal.php');
    // Using Medoo namespace.
    use Medoo\Medoo;

    $rs = new Resultado();

    $rs->verificar("correo, clave, nombre, apellido, whatsapp, ciudad");

    $database = new Medoo(['type' => 'mysql','host' => DB_HOST,'database' => DB_NAME,'username' => DB_USER,'password' => DB_PASS]);

    $posibleCorreo =  $database->select('maestro','*',['correo' => $_POST['correo']]);

    $posibleWhatsapp =  $database->select('maestro','*',['whatsapp' => $_POST['whatsapp']]);

    if (count($posibleCorreo) > 0) {
        $rs->exito = false;
        $rs->mensaje = "El correo ya existe";
        $rs->finalizar();
    }

    if (count($posibleWhatsapp) > 0) {
        $rs->exito = false;
        $rs->mensaje = "El whatsapp ya existe";
        $rs->finalizar();
    }

    $maestro = [];
    $maestro["correo"] = $_POST["correo"];
    $maestro["clave"] = md5($_POST["clave"] . SALT_PKM);
    $maestro["nombre"] = $_POST["nombre"];
    $maestro["apellido"] = $_POST["apellido"];
    $maestro["whatsapp"] = $_POST["whatsapp"];
    $maestro["ciudad"] = $_POST["ciudad"];



    $database->insert('maestro', $maestro);

    $rs->mensaje = "Registro exitoso";

    $rs->finalizar();
    
?>