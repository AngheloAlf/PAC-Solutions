<html>
  <body style="background-color:gainsboro">
    <div class="container">
      <div class="panel panel-default">
        <div class="panel-body">
          <legend>Login</legend>
          <br>
          <form class="form-horizontal" action="?s=login_handler" method="post">
            <fieldset>
              <div class="form-group">
                <label for="email" class="col-lg-2 control-label">Rut:</label>
                <div class="col-lg-10">
                  <input class="form-control" id="rut" name="rut" placeholder="9696265-k" type="text" required>
                </div>
              </div>
              <div class="form-group">
                <label for="password" class="col-lg-2 control-label">Contraseña:</label>
                <div class="col-lg-10">
                  <input class="form-control" id="password" name="password" placeholder="Contraseña" type="password" required>
                </div>
              </div>
              <div class="form-group">
                <div class="col-md-12">
                  <input class="btn btn-primary btn-block" type="submit" value="Login">
                </div>
              </div>
            </fieldset>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
