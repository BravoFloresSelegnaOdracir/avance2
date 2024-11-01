<?php
require "connection.php";
$db = connection();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['description']) && isset($_POST['problem']) && isset($_POST['priority']) && isset($_POST['equipment'])) {
        $description = $_POST["description"];
        $problem = $_POST["problem"];
        $priority = $_POST["priority"];
        $equipment = $_POST["equipment"];

        $query = "CALL insertarIncidencias('$description', '$problem', '$priority', '$equipment');";
        
        $response = mysqli_query($db, $query);
        if ($response) {
            echo "<script>alert('Incident added successfully.'); window.location.href = '../operator.php';</script>";
        } else {
            echo "<p style='color: red;'>Incident Not Created: " . mysqli_error($db) . "</p>";
        }
    } else {
        echo "<p style='color: red;'>Missing form fields!</p>";
    }
} else {
    echo "<p style='color: red;'>Form not submitted correctly!</p>";
}

?>