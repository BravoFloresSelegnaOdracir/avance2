<?php
include('connection.php');

class Employee {
    private $nickname;
    private $password;

    public function setNickname($nickname) {
        $this->nickname = $nickname;
    }

    public function setPassword($password) {
        $this->password = $password;
    }

    public function getUserData($rol) {
        $connection = connection();
        $numE = $this->nickname;
        $password = $this->password;
    
        $query = "CALL datosInicioSesion(?, ?, @nombreCompleto, @tipoEmpleado)";
        $stmt = $connection->prepare($query);
        
        if ($stmt === false) {
            die("Error en la preparación de la consulta: " . $connection->error);
        }
        
        $stmt->bind_param("si", $password, $numE);
        $stmt->execute();
        $stmt->close();
    
        $result = $connection->query("SELECT @nombreCompleto AS nombreCompleto, @tipoEmpleado AS tipoEmpleado");
    
        if ($result && $result->num_rows > 0) {
            return $result;
        } else {
            return 'wrong';
        }
    }
    
}
?>
