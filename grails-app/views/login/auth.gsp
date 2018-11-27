<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src='application.css'/>
</head>

<body>
<g:render template="/navbar"/>

<div class="container">
    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                %{--<div class="panel-title">Iniciar Sesión</div>--}%
                <div class="panel-title"><g:message code="default.label.login"/></div>
            </div>

            <div style="padding-top:30px" class="panel-body">

                <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                <form id="loginform" class="form-horizontal" role="form" action='${postUrl}' method="post">

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="login-username" type="text" class="form-control"
                               name="${securityConfig.apf.usernameParameter}" value="" placeholder= <g:message
                                code="default.label.email"/>>
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="login-password" type="password" class="form-control"
                               name="${securityConfig.apf.passwordParameter}" placeholder= <g:message
                                code="default.label.contrasena"/>>
                    </div>


                    <div style="margin-top:10px" class="form-group">
                        <!-- Button -->

                        <div class="col-sm-12 controls">
                            <button type="submit" class="btn btn-success"><g:message
                                    code="default.label.entrar"/></button>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-md-12 control">
                            <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%">
                                <g:message code="default.label.noTienesCuenta"/>
                                <a href="/multikirola/user/register">
                                    <g:message code="default.label.registrateAqui"/>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-12 control">
                            <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%">
                                %{--<a href="/multikirola/user/recuperarContraseña">--}%
                                <g:message code="default.label.recuperarContrasena" htmlEscape="false"/>
                                %{--</a>--}%
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


    <div class="modal fade" id="modalRecuperarContraseña" tabindex="-1" role="dialog"
         aria-labelledby="modalRecuperarContraseña"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="modalRecuperarContraseñaTitle"><g:message
                            code="default.title.recuperarContrasena" default="Recuperar Contraseña"/></h4>
                </div>

                <div class="modal-body">
                    <div class="container">
                        <form id="recuperar-contrasena-form" class="form-horizontal" role="form"
                              action="/multikirola/user/recuperarContraseña" method="post">
                            <div style="margin-top: 10px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <input id="userid" type="text" class="form-control"
                                       name="userid" value=""
                                       placeholder="<g:message code="default.label.correoElectronico"/>"
                                       onchange="$('.error').attr('hidden', true); "/>
                            </div>

                            <div class="form-group" style="margin-top: 20px">
                                <!-- Button -->
                                <div class="col-md-9">
                                    <input id="btn-recuperar-contrasena" type="submit" class="btn btn-info save"
                                           name="recuperar-contrasena" onclick="mensajeContraseña()"
                                           value="<g:message code="default.label.enviar"/>"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<g:javascript>

    function mensajeContraseña(){
        const email = $('#userid').val();

        alert(g.message(code='default.text.recuperarContraseña', args=[email]));
    }
</g:javascript>
</body>
</html>