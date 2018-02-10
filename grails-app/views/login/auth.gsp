<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
    <meta name="layout" content="main"/>
    %{--<meta name="layout" content="main"/>--}%
    %{--<s2ui:title messageCode='spring.security.ui.login.title'/>--}%
    <asset:stylesheet src='application.css'/>
    %{--<asset:stylesheet src='spring-security-ui-auth.css'/>--}%
</head>

<body>
<p/>
%{--<div class="login"  style='text-align:left;'>
    <div class="login-inner" >
        <g:form type='login' focus='username'>
            <div class="sign-in" >
                <h2>Inicio de Sesión</h2>
                <table >
                    <tr >
                        <td style="text-align: left"><label for="username">Usuario:</label></td>
                        <td style="text-align: left"><input type="text" name="${securityConfig.apf.usernameParameter}" id="username"  size="20"/></td>
                        --}%%{--<td style="text-align: left"><input type="text" name="${securityConfig.apf.usernameParameter}" id="username" class='formLogin' size="20"/></td>--}%%{--
                    </tr>
                    <tr>
                        <td style="text-align: right"><label for="password">Contraseña:</label></td>
                        <td><input type="password" name="${securityConfig.apf.passwordParameter}" id="password"  size="20"/></td>
                        --}%%{--<td><input type="password" name="${securityConfig.apf.passwordParameter}" id="password" class="formLogin" size="20"/></td>--}%%{--
                    </tr>
                    <tr>
                        <td>
                        --}%%{--<td colspan='2' style="text-align: right">--}%%{--
                            <label for='remember_me'>Recordarme</label>
                            <input type="checkbox" class="checkbox" name="${securityConfig.rememberMe.parameter}" id="remember_me"/>
                            --}%%{--<input type="checkbox" class="checkbox" name="${securityConfig.rememberMe.parameter}" id="remember_me" checked="checked"/>--}%%{--
                            --}%%{--<label for='remember_me'>Recordarme</label> |--}%%{--
                            --}%%{--<span class="forgot-link">--}%%{--
                                --}%%{--<g:link controller='register' action='forgotPassword'>Recuperar contraseña</g:link>--}%%{--
                            --}%%{--</span>--}%%{--
                        </td>
                        --}%%{--<td><g:link controller='register' action="register">Registrarse</g:link></td>--}%%{--
                        --}%%{--<td><g:link controller='register' action='forgotPassword'>Recuperar contraseña</g:link></td>--}%%{--
                    </tr>
                    <tr>
                        <td colspan='2'>
                            <g:link controller='register' action="register">Registrarse</g:link>
                            <g:link controller='register' action='forgotPassword'>Recuperar contraseña</g:link>
                            --}%%{--<s2ui:linkButton elementId='register' controller='register' messageCode='spring.security.ui.login.register'/>--}%%{--
                            --}%%{--<s2ui:submitButton elementId='loginButton' messageCode='spring.security.ui.login.login'/>--}%%{--
                        </td>
                    </tr>
                </table>
            </div>
        </g:form>
    </div>
</div>--}%

<div class="container">
    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Iniciar Sesión</div>

                <div style="float:right; font-size: 80%; position: relative; top:-10px"><g:link controller='register'
                                                                                                action='forgotPassword'>¿Olvidaste la contraseña?</g:link></div>
                %{--<div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">¿Olvidaste la contraseña?</a></div>--}%
            </div>

            <div style="padding-top:30px" class="panel-body">

                <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                <form id="loginform" class="form-horizontal" role="form" action='${postUrl}' method="post">

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="login-username" type="text" class="form-control"
                               name="${securityConfig.apf.usernameParameter}" value="" placeholder="Usuario">
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="login-password" type="password" class="form-control"
                               name="${securityConfig.apf.passwordParameter}" placeholder="Contraseña">
                    </div>


                    <div class="input-group">
                        <div class="checkbox">
                            <label>
                                <input id="login-remember" type="checkbox" name="remember" value="1"> Recordarme
                            </label>
                        </div>
                    </div>


                    <div style="margin-top:10px" class="form-group">
                        <!-- Button -->

                        <div class="col-sm-12 controls">
                            <button type="submit" class="btn btn-success">Entrar</button>
                            %{--<g:submitButton name="login" value="Entrar" class="buttons button"/>--}%
                            %{--<a id="btn-login" href="#" class="btn btn-success">Entrar  </a>--}%
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-md-12 control">
                            <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%">
                                ¿No tienes cuenta?
                                <a href="/multikirola/user/register">
                                    Regístrate aquí
                                </a>
                                %{--<a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()">
                                    Regístrate aquí
                                </a>--}%
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
    %{-- <div id="signupbox" style="display:none; margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
         <div class="panel panel-info">
             <div class="panel-heading">
                 <div class="panel-title">Registro</div>
                 <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">Iniciar sesión</a></div>
             </div>
             <div class="panel-body" >
                 <form id="signupform" class="form-horizontal" role="form" action="/register/register" method="post">

                     <div id="signupalert" style="display:none" class="alert alert-danger">
                         <p>Error:</p>
                         <span></span>
                     </div>


                     <div style="margin-bottom: 25px" class="input-group">
                         <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                         <input id="signup-useremail" type="text" class="form-control" name="email" value="" placeholder="Email">
                     </div>

                     <div style="margin-bottom: 25px" class="input-group">
                         <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                         <input id="signup-username" type="text" class="form-control" name="${securityConfig.apf.usernameParameter}" value="" placeholder="Nombre">
                     </div>

                     <div style="margin-bottom: 25px" class="input-group">
                         <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
                         <input id="signup-userphone" type="text" class="form-control" name="telefono" value="" placeholder="Teléfono">
                     </div>

                     <div class="input-group">
                         <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                         <input id="signup-usercellphone" type="text" class="form-control" name="telefono" value="" placeholder="Teléfono móvil">
                     </div>

                     <div class="input-group" style="margin-bottom: 25px">
                         <div class="checkbox">
                             <label>
                                 <input id="signup-whatsapp" type="checkbox" name="whatsapp" value="1"> Notificarme por Whatsapp
                             </label>
                         </div>
                     </div>

                     <div style="margin-bottom: 25px" class="input-group">
                         <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                         <input id="signup-password" type="password" class="form-control" name="${securityConfig.apf.passwordParameter}" placeholder="Contraseña">
                     </div>

                     <div style="margin-bottom: 25px" class="input-group">
                         <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                         <input id="signup-password2" type="password" class="form-control" name="${securityConfig.apf.passwordParameter}" placeholder="Confirmar contraseña">
                     </div>

                     <div class="input-group" style="margin-bottom: 25px">
                         <div class="checkbox">
                             <label>
                                 <input id="signup-terms" type="checkbox" name="terms" value="1"> Acepto los términos y condiciones
                             </label>
                         </div>
                     </div>

                     --}%%{--<div class="form-group">
                         <label for="email" class="col-md-3 control-label">Email</label>
                         <div class="col-md-9">
                             <input type="text" class="form-control" name="email" placeholder="Email">
                         </div>
                     </div>

                     <div class="form-group">
                         <label for="firstname" class="col-md-3 control-label">Nombre</label>
                         <div class="col-md-9">
                             <input type="text" class="form-control" name="firstname" placeholder="First Name">
                         </div>
                     </div>
                     <div class="form-group">
                         <label for="lastname" class="col-md-3 control-label">Last Name</label>
                         <div class="col-md-9">
                             <input type="text" class="form-control" name="lastname" placeholder="Last Name">
                         </div>
                     </div>
                     <div class="form-group">
                         <label for="password" class="col-md-3 control-label">Password</label>
                         <div class="col-md-9">
                             <input type="password" class="form-control" name="passwd" placeholder="Password">
                         </div>
                     </div>

                     <div class="form-group">
                         <label for="icode" class="col-md-3 control-label">Invitation Code</label>
                         <div class="col-md-9">
                             <input type="text" class="form-control" name="icode" placeholder="">
                         </div>
                     </div>--}%%{--

                     <div class="form-group">
                         <!-- Button -->
                         <div class="col-md-9">
                             --}%%{--<div class="col-md--3 col-md-9">--}%%{--
                             <button id="btn-signup" type="button" class="btn btn-info">Enviar</button>
                             --}%%{--<button id="btn-signup" type="button" class="btn btn-info"><i class="icon-hand-right"></i> &nbsp Sign Up</button>--}%%{--
                             --}%%{--<span style="margin-left:8px;">or</span>--}%%{--
                         </div>
                     </div>

                     --}%%{--<div style="border-top: 1px solid #999; padding-top:20px"  class="form-group">

                         <div class="col-md-offset-3 col-md-9">
                             <button id="btn-fbsignup" type="button" class="btn btn-primary"><i class="icon-facebook"></i>   Sign Up with Facebook</button>
                         </div>

                     </div>--}%%{--



                 </form>
             </div>
         </div>

</div>--}%
</div>
</body>
</html>