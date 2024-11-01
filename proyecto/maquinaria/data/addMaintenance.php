<?php
include "../includes/headerO.php";

require "connection.php";
$db = connection();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['description']) && isset($_POST['type']) && isset($_POST['incident'])) {
        $description = $_POST["description"];
        $type = $_POST["type"];
        $incident = $_POST["incident"];

        $query = "CALL insertarMantenimiento('$description', '$type', '$incident');";
        
        $response = mysqli_query($db, $query);
        if ($response) {
            echo "<script>alert('Maintenance added successfully.'); window.location.href = '../technician.php';</script>";
        } else {
            echo "<p style='color: red;'>Maintenance Not Created: " . mysqli_error($db) . "</p>";
        }
    } else {
        echo "<p style='color: red;'>Missing form fields!</p>";
    }
} else {
    echo "<p style='color: red;'>Form not submitted correctly!</p>";
}
?>