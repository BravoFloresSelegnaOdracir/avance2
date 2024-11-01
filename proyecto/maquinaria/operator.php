<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NTERFAZ OPERADOR</title>
    <link rel="stylesheet" href="includes/styles.css">
</head>
<body>
    <div class="container">
        <!-- Barra lateral con los botones -->
        <div class="sidebar">
            <h2>MEI</h2>
            <p>Bienvenido OPERADOR</p>
            <button onclick="showContent('report')">Generate Incident Report</button>
            <button onclick="showContent('equipment')">Registered Equipment</button>
            <button onclick="showContent('close')">Log Out</button>
        </div>

        <!-- Contenedor donde cambiará el contenido -->
        <div class="content">
            <div id="report" class="section active">
                <h3>Generate Incident Report</h3>
                <section>
                    <h2>Add a new incident</h2>
                    <div>
                        <form action="data/addIncident.php" method="post">
                            <fieldset>
                                <legend>Fill all form fields</legend>
                                <div>
                                    <label for="description">Description</label>
                                    <input type="text" id="description" name="description">
                                </div>
                                <div>
                                    <label for="problem">Problem</label>
                                    <select id="problem" name="problem" required>
                                        <option value="ELE">Electric</option>
                                        <option value="MEC">Mechanical</option>
                                        <option value="MTO">Maintenance</option>
                                    </select>
                                </div>
                                <div>
                                    <label for="priority">Priority</label>
                                    <select id="priority" name="priority" required>
                                        <option value="ALT">High</option>
                                        <option value="MED">Medium</option>
                                        <option value="BAJ">Low</option>
                                    </select>
                                </div>
                                <div>
                                    <label for="equipment">Equipment</label>
                                    <input type="text" id="equipment" name="equipment" required>
                                </div>
                                <div>
                                    <button type="submit">Create a New Incident</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </section>
            </div>

            <div id="preventive" class="section">
                <h3>Preventive Maintenance</h3>
                <!-- Contenido de Mantenimiento Preventivo -->
            </div>

            <div id="equipment" class="section">
                <h3>Registered Equipment</h3>
                <!-- Contenido de Equipos Registrados -->
            </div>

            <div id="incidents" class="section">
                <h3>Incident Control</h3>
                <!-- Contenido de Control de Incidencias -->
            </div>

            <div id="close" class="section">
                <h3>Log Out</h3>
                <!-- Contenido para cerrar sesión -->
            </div>
        </div>
    </div>
    <script src="includes/script.js"></script>
</body>
</html>