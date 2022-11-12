<?php
    include('../libreria/principal.php');

    use Medoo\Medoo;

    $rs = new Resultado();

    $rs->verificar("correo, clave");


    $database = new Medoo(['type' => 'mysql', 'host' => DB_HOST, 'database' => DB_NAME, 'username' => DB_USER,'password' => DB_PASS]);


    $db_rs = $database->select('maestro',['id','nombre','apellido','correo','whatsapp','ciudad'],['correo' => $_POST['correo'],'clave' => md5($_POST['clave'] . SALT_PKM)]);

    if(count($db_rs)>0){
        $posible = $db_rs[0];
        $rs->exito = true;
        $rs->mensaje = "Bienvenido";
        $token = generarToken(); 
        $posible['token']=$token;

        $rs->datos = $posible;
        

        $database->update('maestro',['token' => $token],['id' => $posible['id']]);

    }else{
        $rs->exito = false;
        $rs->mensaje = "El correo o la contraseña son incorrectos";
    }

    $rs->finalizar();
?>