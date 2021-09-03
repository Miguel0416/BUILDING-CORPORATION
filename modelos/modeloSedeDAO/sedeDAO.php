<?php


include_once PATH."modelos/ConBdMysql.php";

class sedeDAO extends ConDbMySql{
    public function __construct($servidor, $base, $loginDB, $passwordDB){
        parent::__construct($servidor, $base, $loginDB, $passwordDB);  
    }
    
    public function seleccionarTodos(){
        $planconsulta = "SELECT rol_id_rol, rol_tipo_rol,rol_created_at, rol_updated_at, rol_usuSesion, rol_autEstado ";
        $planconsulta.="FROM sede ";

        $registroLibros = $this->conexion->prepare($planconsulta);
        $registroLibros->execute();

        $listadoRegistrosLibros = array();

        while( $registro = $registroLibros->fetch(PDO::FETCH_OBJ)){
            $listadoRegistrosLibros[]=$registro;
        }
          $this->cierreBd();
          return $listadoRegistrosLibros;
    }

    public function seleccionarID($sed_id){
        $consulta = "SELECT * FROM sede WHERE sed_id= ?;";

        $listar = $this->conexion->prepare($consulta);
        $listar->execute(array($sed_id[0]));

        $registroEncontrado = array();

        while( $registro = $listar->fetch(PDO::FETCH_OBJ)){
            $registroEncontrado[]=$registro;
        }
          $this->cierreBd();
          
        if(!empty($registroEncontrado)){
            return ['exitoSeleccionId' => true, 'registroEncontrado' => $registroEncontrado];
        }else{
            return ['exitoSeleccionId' => false, 'registroEncontrado' => $registroEncontrado];
        }
    } 

    public function insertar($registro){
        try {
            $consulta = "INSERT INTO sede (sed_id, sed_fecha_modificacion, sed_estado, sed_created_at, sed_constructora_id, sed_autEsado, sed_nombre_sede, sed_ubicacion_id, sed_updated_at, sed_usuSesion)VALUES (:(1, '02/09/2021 04:06', 1, '02/09/2021 04:06', 1, 1, 'usaquen', 1, '02/09/2021 04:08', '');";

            $insertar = $this->conexion->prepare($consulta);

            $insertar -> bindParam(":sed_id", $registro['sed_id']);
            $insertar -> bindParam(":sed_fecha_modificacion", $registro['sed_fecha_modificacion']);
            $insertar -> bindParam(":sed_estado", $registro['sed_estado']);
            $insertar -> bindParam(":sed_created_at", $registro['sed_created_at']);
            $insertar -> bindParam(":sed_constructora_id", $registro['sed_constructora_id']);
            $insertar -> bindParam(":sed_autEsado", $registro['sed_autEsado']);
            $insertar -> bindParam(":sed_nombre_sede", $registro['sed_nombre_sede']);
            $insertar -> bindParam(":sed_ubicacion_id", $registro['sed_ubicacion_id']);
            $insertar -> bindParam(":sed_updated_at", $registro['sed_updated_at']);     
            $insertar -> bindParam(":sed_usuSesion", $registro['sed_usuSesion']);

            $insercion = $insertar->execute();

            $clavePrimaria = $this->conexion->lastInsertId();

            return ['Inserto'=>1,'resultado'=>$clavePrimaria];

            $this->cierreBd();
        } catch (PDOException $pdoExc) {
            return ['Inserto'=>0,$pdoExc->errorInfo[0]];
        }
    }

    public function actualizar($registro){
        try {
            $consulta = "UPDATE sede SET 
            sed_constructora_id = :sed_constructora_id, 
            sed_usuSesion =:sed_usuSesion WHERE sed_id = :sed_id";
            
            $actualizar = $this -> conexion -> prepare($consulta);

            
            $actualizar -> bindParam(":rol_tipo_rol", $registro['rol_tipo_rol']);
            $actualizar -> bindParam(":rol_usuSesion", $registro['rol_usuSesion']);
            $actualizar -> bindParam(":rol_id_rol", $registro['rol_id_rol']);
            $actualizacion = $actualizar -> execute();

            $this->cierreBd();

            return ['actualizacion' => $actualizacion, 'mensaje' => 'Resgistro Actualizado'];
        } catch (PDOException $pdoExc) {
            return ['actualizacion' => 0, 'mensaje' => $pdoExc];
        }
    }

    public function eliminar($sId = array()){
        try{
        $consulta = "DELETE FROM (rol_id_rol, rol_tipo_rol, rol_created_at, rol_updated_at, rol_autEstado, rol_usuSesion) WHERE Rol = :1;";

        $eliminar = $this->conexion->prepare($consulta);
        $eliminar->bindParam(':rol_id_rol', $sId[0],PDO::PARAM_INT);
        
        $resultado = $eliminar->execute();
        print_r($resultado);
        $this->cierreBd();

        if(!empty($resultado)){
            return ['eliminado' => true, 'registroEliminado' => array($sId[0])];
        }
    }catch(PDOException $pdo){
            return ['eliminado' => false, 'mensaje' => $pdo];
        }
    }

    public function habilitar($sId= array()){
        try {
            $cambiarEstado = 1;

            if(isset($sId[0])){
                $actualizar = "UPDATE rol SET rol_autEstado = ? WHERE rol_id_rol = ?";
                $actualizacion = $this->conexion->prepare($actualizar);
                $actualizaciones = $actualizacion->execute(array($cambiarEstado, $sId[0]));
                return ['actualizacion' => $actualizaciones, 'mensaje' => 'Resgistro Activado'];
            }
        } catch (PDOException $pdoExce) {
            return ['actualizacion' => 0, 'mensaje' => $pdoExce];
        }
    }

    public function eliminarLogico($rol_id_rol = array()){
        try {
            $cambiarEstado = 0;

            if(isset($rol_id_rol[0])){
                $actualizar = "UPDATE rol SET rol_autEstado = ? WHERE rol_id_rol = ?";
                $actualizacion = $this->conexion->prepare($actualizar);
                $actualiza = $actualizacion->execute(array($cambiarEstado, $rol_id_rol[0]));
                return ['actualizacion' => $actualiza, 'mensaje' => 'Resgistro Desactivado'];
            }
        } catch (PDOException $pdoExc) {
            return ['actualizacion' => 0, 'mensaje' => $pdoExc];
        }
        
    }
}
?>