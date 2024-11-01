<?php
require "connection.php";
$db = connection();

if (isset($_GET['searchQuery']) && isset($_GET['searchType'])) {
    $searchQuery = mysqli_real_escape_string($db, $_GET['searchQuery']);
    $searchType = $_GET['searchType'];

    // Define la tabla y el campo a buscar según el tipo de reporte
    switch ($searchType) {
        case "GNRL":
            $table = "general_reports";
            $field = "general_field"; // Cambia "general_field" por el campo adecuado
            break;
        case "INCI":
            $table = "incidents";
            $field = "incident_field"; // Cambia "incident_field" por el campo adecuado
            break;
        case "MANT":
            $table = "maintenances";
            $field = "maintenance_field"; // Cambia "maintenance_field" por el campo adecuado
            break;
        case "REPR":
            $table = "repairs";
            $field = "repair_field"; // Cambia "repair_field" por el campo adecuado
            break;
        default:
            echo "<p style='color: red;'>Invalid report type!</p>";
            exit;
    }

    // Construir y ejecutar la consulta
    $query = "SELECT * FROM $table WHERE $field LIKE '%$searchQuery%'";
    $result = mysqli_query($db, $query);

    if ($result) {
        if (mysqli_num_rows($result) > 0) {
            echo "<h3>Search Results:</h3>";
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<p>" . $row[$field] . "</p>"; // Muestra los resultados (ajusta según el campo)
            }
        } else {
            echo "<p>No results found.</p>";
        }
    } else {
        echo "<p style='color: red;'>Error: " . mysqli_error($db) . "</p>";
    }
} else {
    echo "<p style='color: red;'>Search query or type missing.</p>";
}
?>
