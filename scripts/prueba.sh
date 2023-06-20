#!/bin/bash 
#Crear los archivos
touch index.html script.js styles.css

# Añadir contenido
echo "<!DOCTYPE html>
<html>
<head>
<meta charset=\"UTF-8\">
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">
<script src=\"script.js\"></script>
<title>Prueba</title>

</head>
<body>
    <h1>Documento para pruebas</h1>
</body>
</html>" > index.html

echo "// Pruebas en JavaScript" > script.js

echo "/* Pruebas en CSS */" > styles.css

# Output success message
echo "Se han creado tres documentos: index.html, script.js, styles.css"
