<?php
$_SESSION["js"] = false;
$_SESSION["togglejs"] = false;
?>
<meta http-equiv="refresh" content="0;URL=?page=<?php if(isset($_GET["redireccionar"])){echo $_GET["redireccionar"];} else{echo "home";} ?>" />