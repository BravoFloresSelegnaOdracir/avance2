<?php
include('../data/employee.php');

session_start();

$myuser = new Employee();
$myuser->setNickname($_POST['txtnick']);
$myuser->setPassword($_POST['txtpass']);
$rol = $_POST['rol'];

$userData = $myuser->getUserData($rol);

if ($userData != 'wrong') {
    $registro = mysqli_fetch_assoc($userData);
    $_SESSION['numEmpleado'] = $_POST['txtnick'];
    $_SESSION['nombreCompleto'] = $registro['nombreCompleto'];
    $_SESSION['tipoEmpleado'] = $registro['tipoEmpleado'];

    echo "Tipo de Empleado: " . $_SESSION['tipoEmpleado'];

    switch ($_SESSION['tipoEmpleado']) {
        case 'OPE':
            header("Location: http://localhost/maquinaria/operator.php");
            break;
        case 'TEC':
            header("Location: ../technician.php");
            break;
        case 'GER':
            header("Location: ../manager.php");
            break;
        default:
            header("Location: ../login.php?error=1");
            break;
    }
    exit();
} else {
    header("Location: ../login.php?error=1");
    exit();
}

?>

