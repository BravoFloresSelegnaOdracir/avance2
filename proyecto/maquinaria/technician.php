<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INTERFAZ TECNICO</title>
    <link rel="stylesheet" href="includes/styles.css">
</head>
<body>
    <div class="container">
        <!-- Barra lateral con los botones -->
        <div class="sidebar">
            <h2>MEI</h2>
            <p>BIENVENIDO TECNICO</p>
            <button onclick="showContent('incidence')">Incident report</button>
            <button onclick="showContent('reparation')">Repair Report</button>
            <button onclick="showContent('repair Report')">Maintenance Report</button>
            <button onclick="showContent('applicationMaterials')">Generate a Request for Materials</button>
            <button onclick="showContent('close')">Log Out</button>
        </div>  

        <!-- Contenedor donde cambiará el contenido -->
        <div class="content">
            <div id="incident " class="section active">
                <h3>Incident report</h3>
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

            <div id="repararacion" class="section">
                <h3>Reporte de Repararacion</h3>
                <!-- Contenido de Equipos Registrados -->
            </div>

            <div id="mantenimiento" class="section">
                <h3>Reporte de Mantenimiento</h3>
                <section>
                    <div>
                        <form action="data/addMaintenance.php" method="post">
                            <fieldset>
                                <legend>Fill all form fields</legend>
                                <div>
                                    <label for="description">Description</label>
                                    <input type="text" id="description" name="description">
                                </div>
                                <div>
                                    <label for="type">Maintenance Type</label>
                                    <select id="type" name="type" required>
                                        <option value="COR">Corrective</option>
                                        <option value="PRE">Preventive</option>
                                    </select>
                                </div>
                                <div>
                                    <label for="incident">Incident</label>
                                    <input type="number" id="incident" name="incident">
                                </div>
                                <div>
                                    <button type="submit">Open a new maintenance</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </section>
            </div>

            <div id="solicitudMateriales" class="section">
                <h3>Reporte de Mantenimiento</h3>
                <!-- Contenido para cerrar sesión -->
            </div>

            <div id="close" class="section">
                <h3>Log out</h3>
                <!-- Contenido para cerrar sesión -->
            </div>
        </div>
    </div>
    <script src="includes/script.js"></script>
</body>
</html>