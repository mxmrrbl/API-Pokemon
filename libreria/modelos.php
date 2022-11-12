<?php

    function generarToken(){
        $tkn = md5(rand(4,999999999999) . SALT_PKM . uniqid());
        return $tkn;
    }


    Class Resultado{

        public $exito;
        public $datos;
        public $mensaje;

        public function __construct($dato = null){
            $this->exito = true;
            $this->datos = [];
            $this->mensaje = "";

            if($dato != null){
                $this->datos = $dato;
            }
        }

        public function __toString(){
            return json_encode($this);
        }

        public function finalizar(){

            header('Content-Type: application/json');
            echo $this;
            exit;
        }

        public function verificar($campos){
            $campos = explode(",", $campos);
            $campos = array_map('trim', $campos);

            foreach($campos as $campo){
                if(!isset($_POST[$campo])){
                    $this->exito = false;
                    $this->mensaje .= "El campo $campo es requerido <br />";
                }
            }

            if(!$_POST & isset($_GET['form'])){

                echo "<div class='container'>
                <form method='post' action = ''>";
    
                foreach($campos as $campo){
                    echo "<label>$campo</label>";
                    echo "<input type='text' name='$campo' value=''/><br/>";
                }
                echo "<input type='submit' value='Enviar'/>";
                echo "</form>
                </div>
                ";
    
                exit();
            }

            if(!$this->exito){
                $this->finalizar();
            }
    
        }

    }

?>