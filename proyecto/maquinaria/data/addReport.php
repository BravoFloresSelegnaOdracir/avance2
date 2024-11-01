<?php
include('connection.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['report']) && isset($_POST['type']) && isset($_POST['manager'])) {
        $report = $_POST["report"];
        $type = $_POST["type"];
        $manager = $_POST["manager"];

        $db = connection();

        $manager = mysqli_real_escape_string($db, $manager);

        $query = "CALL insertarReporte('$report', '$type', '$manager');";
        
        $response = mysqli_query($db, $query);
        if ($response) {
            echo "<script>alert('Report added successfully.'); window.location.href = '../manager.php';</script>";
        } else {
            echo "<p style='color: red;'>Report Not Created: " . mysqli_error($db) . "</p>";
        }

        mysqli_close($db);
    } else {
        echo "<p style='color: red;'>Missing form fields!</p>";
    }
} else {
    echo "<p style='color: red;'>Form not submitted correctly!</p>";
}
?>
