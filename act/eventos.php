<?php

    include('../libreria/principal.php');
    // Using Medoo namespace.
    use Medoo\Medoo;

    $database = new Medoo(['type' => 'mysql', 'host' => DB_HOST, 'database' => DB_NAME, 'username' => DB_USER, 'password' => DB_PASS,]);

    $data = $database->select('eventos','*');

    $rs = new Resultado($data);

    $rs->finalizar();

?>





