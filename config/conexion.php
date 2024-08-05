<?php
    /* TODO: Inicio de Session */
    session_start();
    class Conectar{
        protected $dbh;

        protected function Conexion(){
            try{
                /* TODO: Cadena de Conexion */
                $conectar = $this->dbh=new PDO("sqlsrv:Server=ANGELHP\SQLEXPRESS;Database=CompraVenta","sa","220312");
                //$conectar = $this->dbh=new PDO("sqlsrv:server = tcp:andercode01.database.windows.net,1433; Database = compraventa01","andercode","Anderson1987");
                return $conectar;
            }catch (Exception $e){
                /* TODO: En caso de error mostrar mensaje */
                print "Error Conexion BD". $e->getMessage() ."<br/>";
                print "Error Conexion BD2 ". sqlsrv_errors();

                die();
            }
        }

        public static function ruta(){
            /* TODO: Ruta de acceso del Proyecto (Validar su puerto y nombre de carpeta por el suyo) */
            return "http://localhost:90/PERSONAL_CompraVenta/";
            /* return "https://compraventaandercode.azurewebsites.net/"; */
        }
    }
?>