<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INTERFAZ GERENTE</title>
    <link rel="stylesheet" href="includes/styles.css">
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h2>MEI</h2>
            <p>Welcome MANAGER</p>
            <button onclick="showContent('report')">Generate Incident Report</button>
            <button onclick="showContent('equipment')">Registered Equipment</button>
            <button onclick="showContent('seeEquipment')">See Equipments</button>
            <button onclick="showContent('close')">Log out</button>
        </div>

        <div class="content">
            <div id="report" class="section active">
                <section>
                    <h2>Add a new report</h2>
                    <div>
                        <form action="data/addReport.php" method="post">
                            <fieldset>
                                <legend>Fill all form fields</legend>
                                <div>
                                    <label for="report">Report</label>
                                    <input type="text" id="report" name="report">
                                </div>
                                <div>
                                    <label for="type">Type:</label>
                                    <select id="type" name="type" required>
                                        <option value="GNRL">General</option>
                                        <option value="INCI">Incident</option>
                                        <option value="MANT">Maintenance</option>
                                        <option value="REPR">Repair</option>
                                    </select>
                                </div>
                                <div>
                                    <label for="manager">Manager</label>
                                    <input type="text" id="manager" name="manager" required>
                                </div>
                                <div>
                                    <button type="submit">Create New Report</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                    <!-- Search Section -->
                    <div id="searchSection">
                        <h3>Search by Equipment Number or Name</h3>
                        <form action="data/searchEquipment.php" method="get">
                            <input type="text" id="searchQuery" name="searchQuery" placeholder="Enter equipment number or name">
                            <input type="hidden" id="searchType" name="searchType" value="GNRL"> <!-- Default value -->
                            <button type="submit">Search</button>
                        </form>
                    </div>
                </section>
            </div>

            <div id="equipment" class="section">
                <section>
    <h2>Registered Equipment</h2>
    <div>
        <form action="data/addEquipment.php" method="post">
            <fieldset>
                <legend>Fill all form fields</legend>
                <div>
                    <label for="number">Serial Number</label>
                    <input type="text" id="number" name="number">
                </div>
                <div>
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name">
                </div>
                <div>
                    <label for="datep">Purchase date</label>
                    <input type="date" id="datep" name="datep">
                </div>
                <div>
                    <label for="price">Purchase price</label>
                    <input type="number" id="price" name="price">
                </div>
                <div>
                    <label for="model">Model</label>
                    <select id="model" name="model" required>
                        <option value="BAL">Balancer</option>
                        <option value="CNC">Numeric control</option>
                        <option value="CNT">Centered</option>
                        <option value="CPR">Compressor</option>
                        <option value="EHV">Hydraulic lifter</option>
                        <option value="HRN">Radius tool</option>
                        <option value="INJ">Injector</option>
                        <option value="LAS">Laser</option>
                        <option value="PLS">Presser</option>
                        <option value="PR1">Press machine</option>
                        <option value="RBT">Robot</option>
                        <option value="SLD">Welding machine</option>
                        <option value="TLD">Driller</option>
                        <option value="TRN">Winch</option>
                    </select>
                </div>
                <div>
                    <label for="brand">Brand</label>
                    <select id="brand" name="brand" required>
                        <option value="ABB">ABB Robotics</option>
                        <option value="CAT">Caterpillar</option>
                        <option value="FAN">Fanuc</option>
                        <option value="HAA">Haas Automation</option>
                        <option value="KOM">Komatsu</option>
                        <option value="KUK">KUKA Robotics</option>
                        <option value="YAS">Yaskawa Electric</option>
                    </select>
                </div>
                <div>
                    <label for="status">Status</label>
                    <select id="status" name="status" required>
                        <option value="ACTV">Active</option>
                        <option value="INAC">Inactive</option>
                        <option value="BAJA">Decommissioned</option>
                    </select>
                </div>
                <div>
                    <label for="area">Area</label>
                    <select id="area" name="area" required>
                        <option value="ACTV">Active</option>
                        <option value="INAC">Inactive</option>
                        <option value="BAJA">Decommissioned</option>
                        <option value="BAJA">Decommissioned</option>
                        <option value="BAJA">Decommissioned</option>
                        <option value="BAJA">Decommissioned</option>
                    </select>
                </div>
                <div>
                    <button type="submit">Create a New Incident</button>
                </div>
            </fieldset>
        </form>
    </div>
</section>
            </div>
            <div id="seeEquipment" class="section active">
                <section>
                    <h2>See Equipments</h2>
                    
                </section>
            </div>

            <div id="close" class="section">
                <h3>Log out</h3>
                <!-- Log out content -->
            </div>
        </div>
    </div>
    <script>
        document.getElementById("type").addEventListener("change", function() {
            const searchType = document.getElementById("type").value;
            document.getElementById("searchType").value = searchType;
        });
    </script>
</body>
</html>
