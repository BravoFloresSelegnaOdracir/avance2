<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN</title>
    <link rel="stylesheet" href="includes/login.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="wrapper">
    <?php var_dump($_POST);?>

    <form action="app/login.php" method="POST">
    <h1>LOGIN</h1>
    <div class="input-box">
        <input type="number" name="txtnick" placeholder="No. Employee" required>
    </div>
    <div class="input-box">
        <input type="password" name="txtpass" placeholder="Password" required>
    </div>
    <h4>Rol: </h4>
    <center>
        <select name="rol" required>
            <option value="0" style="display:none;">Choose</option>
            <option value="OPE">Operator</option>
            <option value="TEC">Technician</option>
            <option value="GER">Manager</option>
        </select>
    </center>
    <br>
    <button type="submit" class="btn">Login</button>
</form>

    </div>
</body>
</html>
