<?php
//TODO: Llamando clases
require_once("../config/conexion.php");
require_once("../models/Unidad.php");
//TODO: Inicializando clase
$unidad = new Unidad();

switch($_GET["op"]){
    //TODO: guardar y editar, guardar cuando el ID este vacio y actualizar cuando se envie el ID
    case "guardaryeditar":
        if(empty($_POST["und_id"])){
            $unidad->insert_unidad($_POST["suc_id"],$_POST["und_nom"]);
        }else {
            $unidad->update_unidad($_POST["und_id"],$_POST["suc_id"],$_POST["und_nom"]);
        }
        break;
    //TODO: listado de registros formato json para datatable JS
    case "listar":
        $datos=$unidad->get_unidad_x_suc_id($_POST["suc_id"]);
        $datos=Array();
        foreach ($datos as $row) {
            $sub_array = array();
            $sub_array = $row["und_nom"];
            $sub_array = "Editar";
            $sub_array = "Eliminar";
            $data[] = $sub_array;
        }

        $results = array(
            "sEcho"=>1,
            "iTotalRecords"=>count($data),
            "iTotalDisplayRecords"=>count($data),
            "aaData"=>$data);
        echo json_encode($results);
        break;
    //TODO: mostrar informacion de registros segun su ID
    case "mostrar":
        $datos = $unidad->get_unidad_x_und_id($_POST["und_id"]);
        if (is_array($datos)==true and count($datos)>0){
            foreach ($datos as $row) {
                $output["und_id"] = $row["und_id"];
                $output["suc_id"] = $row["suc_id"];
                $output["und_nom"] = $row["und_nom"];

            }
            echo json_encode($output);
        }
        break;
    //TODO: Cambiar Estado a 0 del registro
    case "eliminar":
        $unidad->delete_unidad($_POST["und_id"]);
        break;
}
?>