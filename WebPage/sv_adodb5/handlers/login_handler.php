<?
require "sv_adodb5/config.php";
$db = newAdoConnection($driver);
$db->connect($SQLhost,$SQLusuario,$SQLpass,$SQLname);
if($db->isConnected()){
  $query = "SELECT * FROM admin WHERE rut='{$_POST['rut']}'";
  $result = $db->execute($query);
  if($result->numRows()){
    $admin = array();
    $result->fetchInto($admin);
    if($admin["contrasenna"] == $_POST['password']){
      $_SESSION["user_admin"] = $admin;
      header('Location: admin_index.php?page=dashboard');
    }
    else {
      jsAlert("Contraseña Incorrecta!");
    }
  }
  else{
    jsAlert("Usuario no Registrado!");
  }
}
else{
  jsAlert("Error de conexion con el servidor, intentelo mas tarde");
}
?>
