<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src='application.css'/>
</head>

<body>

<g:render template="/navbar"/>

<div class="container">
    <div id="signupbox" style="margin-top:50px"
         class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                %{--<div class="panel-title">Registro</div>--}%
                <div class="panel-title"><g:message code="default.label.registro"/></div>
            </div>

            <div class="panel-body">
                <form id="signup-form" class="form-horizontal" role="form" onsubmit="return validateForm()"
                      action="/multikirola/user/save" method="post">

                    <div id="signup-alert" style="display:none" class="alert alert-danger">
                        <p>Error:</p>
                        <span></span>
                    </div>


                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.user}">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${this.user}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                        error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>

                %{--<div style="margin-bottom: 25px" class="input-group">--}%
                    <div style="margin-top: 20px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="username" type="text" class="form-control" data-toggle="tooltip-user"
                               title="Tu identificador de acceso a la aplicación. Debe ser único."
                               name="${securityConfig.apf.usernameParameter}" value=""
                        %{--placeholder="Nombre de usuario"--}%
                               placeholder="<g:message code="default.label.nombreUsuario"/>"
                               onchange="$('.error').attr('hidden', true);"/>
                    </div>

                    <div>
                        %{--<label id="error-username" class="error" style="color: red" hidden>ERROR!!!</label>--}%
                        <label id="error-username" class="error" style="color: red" hidden><g:message
                                code="default.error.nombreUsuario"/></label>
                        <label id="error-caracteresUsername" class="error" style="color: red" hidden><g:message
                                code="default.error.caracteresNombreUsuario"/></label>
                    </div>
                    %{--<div style="margin-bottom: 20px" class="input-group">--}%


                    %{--<div style="margin-bottom: 20px" class="input-group">--}%
                    <div style="margin-top: 10px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="useremail" type="text" class="form-control"
                        %{--name="email" value="" placeholder="Email"--}%
                               name="email" value=""
                               placeholder="<g:message code="default.label.correoElectronico"/>"
                               onchange="$('.error').attr('hidden', true); "/>
                    </div>

                    <div>
                        <label id="error-email" class="error" style="color: red" hidden><g:message
                                code="default.error.email"/></label>
                    </div>

                    %{--<div style="margin-bottom: 20px" class="input-group">--}%
                    <div style="margin-top: 10px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
                        <input id="userphone" type="text" class="form-control" name="telefono" value=""
                        %{--placeholder="Teléfono" onchange="$('.error').attr('hidden', true); "/>--}%
                               placeholder="<g:message code="default.label.telefono"/>"
                               onchange="$('.error').attr('hidden', true); "/>
                    </div>

                    <div>
                        %{--<label id="error-userphone" class="error" style="color: red" hidden>ERROR!!!</label>--}%
                        <label id="error-userphone" class="error" style="color: red" hidden><g:message
                                code="default.error.telefono"/></label>
                    </div>

                    %{--<div class="input-group">--}%
                    <div style="margin-top: 10px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                        <input id="usercellphone" type="text" class="form-control" name="movil" value=""
                        %{--placeholder="Teléfono móvil" onchange="$('.error').attr('hidden', true); "/>--}%
                               placeholder="<g:message code="default.label.telefonoMovil"/>"
                               onchange="$('.error').attr('hidden', true); "/>
                    </div>

                    <div>
                        %{--<label id="error-usercellphone" class="error" style="color: red" hidden>ERROR!!!</label>--}%
                        <label id="error-usercellphone" class="error" style="color: red" hidden><g:message
                                code="default.error.telefono"/></label>
                    </div>

                    <div class="input-group" style="margin-bottom: 10px">
                        <div class="checkbox">
                            <label>
                                <g:checkBox id="whatsapp" name="whatsapp" value="${this.user?.whatsapp}"/>
                                %{--Notificadme por Whatsapp--}%
                                <g:message code="default.label.notificadmeWhatsapp"/>
                            </label>
                        </div>
                    </div>

                    <div>
                        %{--<label id="error-whatsapp" class="error" style="color: red" hidden>ERROR!!!</label>--}%
                        <label id="error-whatsapp" class="error" style="color: red" hidden><g:message
                                code="default.error.whatsapp"/></label>
                    </div>

                    <div style="margin-top: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="password" type="password" class="form-control"
                               name="${securityConfig.apf.passwordParameter}"
                        %{--placeholder="Contraseña" onchange="$('.error').attr('hidden', true); "/>--}%
                               placeholder="<g:message code="default.label.contrasena"/>"
                               onchange="$('.error').attr('hidden', true); "/>
                    </div>

                    <div>
                        %{--<label id="error-password" class="error" style="color: red" hidden>ERROR!!!</label>--}%
                        <label id="error-password" class="error" style="color: red" hidden><g:message
                                code="default.error.password"/></label>
                        <label id="error-longitudPassword" class="error" style="color: red" hidden><g:message
                                code="default.error.longitudPassword"/></label>
                        <label id="error-digitoPassword" class="error" style="color: red" hidden><g:message
                                code="default.error.digitoPassword"/></label>
                        <label id="error-minusculasPassword" class="error" style="color: red" hidden><g:message
                                code="default.error.minuculaPassword"/></label>
                        <label id="error-mayusculasPassword" class="error" style="color: red" hidden><g:message
                                code="default.error.mayusculasPassword"/></label>
                        <label id="error-contenidoPassword" class="error" style="color: red" hidden><g:message
                                code="default.error.contenidoPassword"/></label>
                    </div>

                    <div style="margin-top: 10px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="password2" type="password" class="form-control"
                        %{--name="password2" placeholder="Confirmar contraseña"--}%
                               name="password2"
                               placeholder="<g:message code="default.label.confirmarContrasena"/>"
                               onchange="$('.error').attr('hidden', true);"/>
                    </div>

                    <div>
                        %{--<label id="error-password2" class="error" style="color: red" hidden>ERROR!!!</label>--}%
                        <label id="error-password2" class="error" style="color: red" hidden><g:message
                                code="default.error.password2"/></label>
                    </div>

                    <div style="margin-top: 20px" class="input-group">
                        <div class="checkbox">
                            <label>
                                %{--<input id="legal" type="checkbox" name="terms"
                                       value="1" onchange="$('.error').attr('hidden', true); "/> He leído y acepto los <a href="#" target="_blank"> Términos y Condiciones </a> y la <a href="#" target="_blank">Política de Privacidad</a> .--}%
                                <g:checkBox id="legal" name="terms"/>
                                %{--He leído y acepto los <a href="#" target="_blank"> Términos y Condiciones </a> y la <a href="#" target="_blank">Política de Privacidad</a>--}%
                                <span><g:message code="default.label.textoGDPR" htmlEscape="false"/>
                            </label>
                        </div>
                    </div>

                    <div>
                        %{--<label id="error-legal" class="error" style="color: red" hidden>ERROR!!!</label>--}%
                        <label id="error-legal" class="error" style="color: red" hidden><g:message
                                code="default.error.checkCondiciones"/></label>
                    </div>

                    <div class="form-group" style="margin-top: 20px">
                        <!-- Button -->
                        <div class="col-md-9">
                            <input id="btn-signup" type="submit" class="btn btn-info save"
                            %{--name="register" value="Enviar"/>--}%
                                   name="register" value="<g:message code="default.label.enviar"/>"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalCondiciones" tabindex="-1" role="dialog" aria-labelledby="modalCondiciones"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="modalCondcionesTitle"><g:message code="default.title.condiciones"/></h4>
            </div>

            <div class="modal-body">
                <div class="container">
                    <p><g:message code="default.info.condiciones"/></p>

                    %{--
                                            Informazioaren Gizartearen Zerbitzuen eta Merkataritza Elektronikoaren (IGZ ME) inguruko uztailaren 11ko 34/2002 Legeari jarraiki, web gune honen enpresa jabearen datuak eman nahi dizkiegu erabiltzaileei:
                                            <br>
                                            •    Izen Soziala: GOBELA 21, SM <br>
                                            •    Helbide Soziala: Ganeta plaza 4, behea. 48930 Getxo. Bizkaia.<br>
                                            •    IFZ: B-95571873<br>
                                            •    Telefonoa: 946081888<br>
                                            •    e-Maila: cima@cimadidaktika.com<br>
                                            •    Bizkaiko Merkataritza Erregistroan inskribatua, 3452 tomoa, 13 folioa, BI 17754 orria, 1. Inskripzioa.<br>
                                            <br>
                                            Domeinuen izena: getxomultikirolak.eus, www.getxomultikirolak.eus
                                            <br>
                                            <br>

                                            <strong style="text-decoration: underline">HELBURUA</strong>
                                            <br>
                                            <br>
                                            <strong>GOBELA 21, SMk</strong>, web gunearen arduradunak, erabiltzaileen eskura jartzen du dokumentu hau,
                                        Informazioaren Gizartearen Zerbitzuen eta Merkataritza Elektronikoaren (IGZ ME) inguruko 34/2002
                                        Legean ezarritako betebeharrak betetzeko asmoarekin eta web gunearen erabiltzaile guztiei web gunea
                                        erabiltzeko baldintzak zeintzuk diren jakinaraztearren.
                                            <br>
                                            <br>
                                            Web gune honetara sartzen den pertsona orok erabiltzaile izaera izango du, eta konpromisoa hartuko
                                            du hemen ezarritako xedapenak nahiz aplika daitekeen beste edozein lege-xedapen zehatz-mehatz betetzeko.
                                            <br>
                                            <br>
                                            <strong>GOBELA 21, SMk</strong>,web gunean ager daitekeen edozein informazio aldatzeko eskubidea
                                        izango du, eta ez du erabiltzaileari aurrez abisatu edo betebehar horiek informatzeko obligaziorik
                                        izango, web gunean publikatzearekin nahikoa izango delarik.
                                            <br>
                                            <br>
                                            <strong style="text-decoration: underline">ERABILTZEKO BALDINTZAK</strong>
                                            <br>
                                            <br>
                                            Web gune honetan zehazten dira <strong>GOBELA 21, S.L</strong>eskaintzen dituen zerbitzuak. Horiek
                                        erabiltzeak ondorengo baldintzak onartzea eskatzen du, horien gainean edozein erreklamazio
                                        egitea baztertuaz:
                                            <ol>
                                                <li>Web hau kokatuta dagoen zerbitzariak cookie-ak erabiltzen ditu, eta horiek bisitarien ordenagailuan gordeta geratuko dira. Cookie-ak web gunera egindako bisitaren inguruan nolabaiteko informazioa jasotzen duten fitxategi txikiak dira; hala nola, bisitaren eguna eta hasten den ordua, amaitzen den ordua, edota kontsultatutako atal ezberdinei buruzko informazioa. Erabiltzaileak hala nahi badu, nabigatzailea konfigura dezake cookie bat jasoko duen abisatzeko edota ez jasotzeko; kasu horretan, hala ere, web gunera sartu ahal izango du. Cookie-i buruzko informazio gehiago aurki dezakezu Pribatutasun-politikaren atalean.
                                                </li>
                                                <li><strong>GOBELA 21, SMk</strong>, edozein unetan aldatu ahal izango du web gunearen edukia, aurrez abisatu gabe.
                                                </li>
                                                <li><strong>GOBELA 21, SMk</strong>,erabiltzailearen eskura jar ditzake hirugarrenen web guneetara
                                                sartu ahal izateko estekak edo bestelako elementuak. Guk ez ditugu lotutako orrialde horietako
                                                produktuak eta zerbitzuak saltzen eta ez dugu horien gaineko nahiz horietan agertzen den
                                                informazioaren gaineko inolako erantzukizunik hartzen, ez eta horien egiazkotasuna edo
                                                zilegitasunaren ingurukorik edota horietatik eratorri daitezkeen ondorioen gainekorik ere.
                                                    <br>
                                                    Nolanahi ere, <strong>GOBELA 21, SMk</strong> adierazten du berehala kenduko duela
                                                estatuko edo nazioarteko legedia, morala edo ordena publikoa, urra dezakeen edozein eduki,
                                                web gune horretara bideratzen duen helbidea ere berehala kentzearekin batera, eta aipatu
                                                edukiaren berri eskumeneko agintariei emanaz.
                                                </li>
                                                <li>Web gunean adierazitako prezioak, egotekotan, baliozkoak izango dira, akats tipografikoa
                                                dagoenean izan ezik, eta aldatu ahal izango dira aurrez abisatu beharrik gabe.
                                                </li>
                                                <li>Ez da beharrezkoa web gunean erregistratzea edo inolako datu pertsonalik ematea bertan nabigatzeko.
                                                </li>
                                                <li><strong>GOBELA 21, SMk</strong>, ezin du bermatu web guneak etengabe funtzionatzea edo akatsik batere ez izatea. Beraz, gune hau erabiltzearen ondorioz gertatutako kalteren erantzukizunik ez dugu hartzen.
                                                </li>
                                                <li><strong>GOBELA 21, SMk</strong>, bere zerbitzuak eta produktuak era mugagabean eskaintzen ditu, baina horien prestazioa eten dezake, alde bakarretik eta aurrez abisatu beharrik gabe.
                                                </li>
                                                <li><strong>GOBELA 21, SMk</strong>,ez da izango bezeroak web gune hau oker erabiltzeagatik norberari edo hirugarrenei sortutako kalte-ordainen erantzule.
                                                </li>
                                                <li>Erabiltzaileak konpromisoa hartuko du web gune hau edota bertan eskainitako zerbitzuak legearen aurkako, ordena publikoaren aurkako edo baldintza hauen aurkako jarduerak egiteko ez erabiltzeko.
                                                </li>
                                                <li><strong>GOBELA 21, SMk</strong>, ez da sistema informatiko batentzat ondorio negatiboak lortzeko xedearekin infiltratutako transmisio telematiko batean jatorria duten birusen erantzule izango.
                                                </li>
                                                <li><strong>GOBELA 21, SMk</strong>, ez du foroetan, txatetan, blog sortzaileetan, iruzkinetan, sare sozialetan edo beste edozein bidetan gordetako informazioaren eta edukiaren erantzukizunik, hirugarrenei prestatzailearen web orrialdean modu independentean edukiak argitaratzeko aukera ematen badie. Hala ere, eta IGZ-ME Legeko 11. eta 16. artikuluan xedatutakoari jarraiki, GOBELA 21, SM erabiltzaileen, agintarien eta segurtasun-indarren eskura jartzen da, eta modu aktiboan lan egingo du estatuko edo nazioarteko legedia, hirugarrenen eskubideak edo morala eta ordena publikoa kaltetu edo urratu dezaketen eduki guztiak kentzeko edota, behar izanez gero, blokeatzeko. Erabiltzaileak uste badu web gunean sailkapen hori jasan dezakeen edukiren bat dagoela, berehala jakinarazi behar dio web gunearen administratzaileari.
                                                </li>
                                                <li>12.    Web gune honek behar bezala funtzionatzen duen berrikusi eta egiaztatu da. Hasiera batean, funtzionamendu zuzena bermatu daiteke urteko 365 egunetan eta eguneko 24 ordutan. Edonola ere,
                                                    <strong>GOBELA 21, SMk</strong>, ez du baztertzen programazioko zenbait akats izatea edo web gunera sartzea ezinezko egiten duten arrazoi handiagoak, hondamendi naturalak, grebak edo antzeko gertaerak gertatzea.
                                                </li>
                                            </ol>
                                            <br>

                                            Azken finean, erabiltzaileak du web honetako zerbitzuen, edukien eta esteken erabileraren erantzukizuna.
                                            <br>
                                            <br>
                                            <strong style="text-decoration: underline">JABETZA INTELEKTUALA, ARAUDIA ETA FOROA </strong>
                                            <br>
                                            Web gunea, bere programazioa, edizioa, konpilazioa eta bere funtzionamendurako beharrezkoak diren gainerako elementuak, diseinuak, logotipoak, testu eta/edo grafikoak  <strong>GOBELA 21, SMk</strong>,edo, hala badagokio, egileak emandako lizentzia edo baimena du.
                                            <br>
                                            <br>
                                            Web guneko eduki guztiak jabego intelektual eta industrialeko araudiak behar bezala babesten ditu eta dagokien erregistro publikoetan inskribatuta daude. Debekatuta dago web gunea zati batean edo osorik erreproduzitzea edota argitaratzea, baita horren tratamendu informatikoa, banaketa, zabalkundea, eta aldaketa edo eraldaketa egitea ere, jabearen aldez  aurretiko baimenik eta baimen idatzirik gabe.
                                            <br>
                                            <br>
                                            <strong>GOBELA 21 SM</strong> ez diren eta web gunean ager daitezkeen diseinu, logotipo, testu edo
                                        eta grafikoak dagozkien jabearenak dira, eta, beraz, haiek izango dira horien inguruan sortzen den
                                        edozein eztabaidaren arduradunak. Nolanahi ere, <strong>GOBELA 21 SMk</strong> horien aurretiazko eta
                                        berariazko baimena izango du. <strong>GOBELA 21, SMk</strong> horien titularren aldeko jabego industrial eta intelektualeko
                                        eskubideak aitortzen ditu, web gunean agertze edo aipatze hutsak ez duelarik esan nahi zerbitzu-emaileak
                                        horiekiko inolako eskubide edo erantzukizunik duenik, ezta horiek web gunearekiko babes, patrozinio
                                        edo gomendio berezirik egiten dutenik ere.
                                            <br>
                                            <br>

                                            Erabiltzaileak web gune honetan agertzen den materiala erabil dezake erabilera pertsonal eta pribaturako, baina ezingo da helburu komertzialetarako erabili. <strong>GOBELA 21, SM</strong>arduratuko da aurreko baldintzak betetzen diren edota bere web orrialdeetan aurkeztutako edukiak behar bezala erabiltzen diren zaintzeaz; ondorioz, erabiltzaileak eskubide horiek urratzen baditu edo betetzen ez baditu, dagozkion ekintza zibil eta penal guztiak erabiliko ditu.
                                            <br>
                                            <br>
                                            <strong style="text-decoration: underline"> LEGE APLIKAGARRIA ETA JURISDIKZIOA </strong>
                                            <br>
                                            Web gune honekin edo bertan garatutako jarduerekin zerikusia duten eztabaida edo gai guztiak ebazteko, Espainiako legeria aplikatuko da, eta aldeek berariaz bete beharko dute. Ildo horri eutsiz, erabileraren inguruko gatazka guztiak ebazteko aginpidedunak eskumeneko Epaitegiak eta Auzitegiak izango dira.
                    --}%

                </div>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalPrivacidad" tabindex="-1" role="dialog" aria-labelledby="modalPrivacidad"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="modalPrivacidadTitle"><g:message code="default.title.privacidad"/></h4>
            </div>

            <div class="modal-body">
                <div class="container">
                    <p><g:message code="default.info.privacidad"/></p>
                    %{--                        <strong>GOBELA 21, S.L.</strong>, se encuentra profundamente comprometida con el
                                        cumplimiento de la Legislación Española y Europea aplicable a la protección de datos de carácter
                                        personal, y garantiza el cumplimiento íntegro de las obligaciones dispuestas, así como la
                                        implementación de las medidas de seguridad dispuestas en la Ley 15/1999, de Protección de Datos de
                                        Carácter Personal (LOPD) y en el Reglamento General de Protección de Datos (RGPD) de la Unión
                                        Europea 2016/679.
                                            <br>
                                            <br>
                                            <strong>GOBELA 21, S.L.</strong>,no utiliza cookies para recoger información de los
                                        usuarios, ni registra las direcciones IP de acceso. Únicamente se utilizan cookies propias, de
                                        sesión, con finalidad técnica, (aquellas que permiten al usuario la navegación a través del sitio
                                        web y la utilización de las diferentes opciones y servicios que en ella existen).
                                            <br>
                                            <br>
                                            El portal del que es titular <strong>GOBELA 21, S.L.</strong>, contiene enlaces a sitios web
                                        de terceros, cuyas políticas de privacidad son ajenas a la de la <strong>GOBELA 21, S.L.</strong> Al
                                        acceder a tales sitios web usted puede decidir si acepta sus políticas de privacidad y de cookies.
                                        Con carácter general, si navega por internet usted puede aceptar o rechazar las cookies de terceros
                                        desde las opciones de configuración de su navegador.
                                            <br>
                                            <br>
                                            <strong>GOBELA 21, S.L.</strong>, pone a disposición de los usuarios la presente Política de
                                        Privacidad de la entidad para el tratamiento de datos personales, informando a los mismos respecto a
                                        los siguientes aspectos:
                                            <br>
                                            <br>
                                            <ul>
                                                <li>Identidad y Datos de Contacto del Responsable del tratamiento.</li>
                                                <li>Datos tratados,  sus fines y plazos o criterios de conservación de los mismos.</li>
                                                <li>Base jurídica del tratamiento.</li>
                                                <li>Los destinatarios de sus datos personales.</li>
                                                <li>Sobre los derechos que asisten a todo usuario y el procedimiento para ejercitarlos.</li>
                                            </ul>
                                            <br>
                                            <ol>
                                                <li><strong style="text-decoration: underline">RESPONSABLE DE TRATAMIENTO.</strong><br>
                                                    <ul style="list-style-type: none">
                                                        <li>Identidad: GOBELA 21, S.L.</li>
                                                        <li>CIF: B95571873</li>
                                                        <li>Dirección postal: Plaza Ganeta nº 4. 48930 Getxo. Bizkaia.</li>
                                                        <li>Teléfono de contacto: 94 608 18 88</li>
                                                        <li>Correo electrónico de contacto: cima@cimadidaktika.com</li>
                                                    </ul>
                                                </li>
                                                <br>
                                                <li>
                                                    <strong style="text-decoration: underline">
                                                        TRATAMIENTOS DE DATOS PERSONALES.
                                                    </strong>
                                                    <br>
                                                    <br>
                                                    <strong>Tratamientos de Datos personales del colectivo de Clientes</strong>
                                                    <br>
                                                    <br>
                                                    <ul style="list-style-type:none">
                                                        <li><strong>a. ¿Con qué finalidad tratamos sus datos personales?</strong>
                                                            <br>
                                                            <strong>En GOBELA 21, S.L.</strong>, tratamos la información que nos facilitan
                                                        sus clientes con las siguientes finalidades:
                                                            <br>
                                                            <br>
                                                            <ul style="list-style-type:none">
                                                                <li>I.    Gestión, Administración y Prestación de los productos y servicios
                                                                contratados. La gestión y el mantenimiento de la relación comercial para la
                                                                prestación de servicios para el deportecontratados, así como para su
                                                                administración fiscal y contable.
                                                                </li>
                                                                <li>II.    Realización de Envíos Comerciales. En caso de que lo haya
                                                                consentido, la realización de acciones comerciales, de promoción y/o
                                                                marketing por cualquier medio, (incluidos los electrónicos, que expresamente
                                                                consiente), relacionadas con los servicios para el deporte.
                                                                </li>
                                                            </ul>
                                                        <li><strong>b. Legitimación</strong>
                                                            <br>
                                                            La base legal para el tratamiento de sus datos es el consentimiento expreso del
                                                            cliente o, si procede de su/s Representante/s legal/es así como la necesidad del
                                                            tratamiento para la prestación del servicio contratado.
                                                        </li>
                                                        <li><strong>c. Destinatarios</strong>
                                                            <br>
                                                            <ul style="list-style-type: none">
                                                                <li>I.    Si procede a Entidades Bancarias para la gestión los importes
                                                                económicos derivados de la prestación de los servicios contratados.</li>
                                                            </ul>
                                                        </li>
                                                        <li><strong>d. ¿Por cuánto tiempo conservaremos sus datos?</strong>
                                                            <br>
                                                            Los datos personales proporcionados se conservarán, mientras sean necesario para
                                                            la prestación de los servicios contratados. A su finalización los datos serán
                                                            conservados sólo por obligación legal.
                                                            <br>
                                                            Por último, y siempre que hubiera proporcionado su consentimiento para esta
                                                            finalidad,<strong>GOBELA 21, S.L.</strong>, conservará sus datos con el fin de
                                                        mantenerle al día de lasactividades y servicios que pudieran resultar de su interés.
                                                        </li>
                                                    </ul>
                                                    <br>
                                                <li><strong>DECISIONES AUTOMATIZADAS, PERFILES Y LÓGICA APLICADA.</strong>
                                                    <br>
                                                    No se prevé el tratamiento en ningún momento, basado en decisiones automatizadas.
                                                </li>
                                                <br>
                                                <li><strong style="text-decoration: underline">DERECHOS.</strong></li>
                                                <ul>
                                                    <li>
                                                        <strong>¿Cuáles son sus derechos cuando nos facilita sus datos?</strong>
                                                        <br>
                                                        Cualquier persona tiene derecho a obtener confirmación sobre si en <strong>GOBELA 21, S.L.</strong>,
                                                    estamos tratando datos personales que les conciernan, o no.
                                                        <br>
                                                        Asimismo, tal y como prevé el Reglamento General de Protección de Datos, le informamos
                                                        que usted tiene los siguientes derechos:
                                                        <ul style="list-style-type: none">
                                                            <li> Acceder a sus datos: Ud. tiene derecho a acceder a sus datos para conocer qué
                                                            datos personales estamos tratando que le conciernen.</li>
                                                            <li> Solicitar la rectificación o supresión de sus datos: En determinadas circunstancias,
                                                            Ud. tiene derecho a rectificar aquellos datos personales inexactos que le conciernen que
                                                            sean objeto de tratamiento por nuestra parte o, incluso, a solicitarnos su supresión
                                                            cuando, entre otros motivos, los datos ya no fueran necesarios para los fines que fueron
                                                            recogidos.</li>
                                                            <li> Solicitar la limitación del tratamiento de sus datos: En determinadas
                                                            circunstancias, Ud. tendrá derecho a solicitarnos la limitación del tratamiento de sus
                                                            datos, en cuyo caso le informamos que únicamente los conservaremos para el ejercicio o
                                                            defensa de reclamaciones tal y como prevé el Reglamento General de Protección de Datos.</li>
                                                            <li> A la portabilidad de sus datos: En determinadas circunstancias, Ud. tendrá derecho
                                                            a recibir los datos personales que le incumban, y que nos haya facilitado, en un formato
                                                            estructurado, de uso común y lectura mecánica, y a transmitirlos a otro responsable del
                                                            tratamiento.</li>
                                                            <li> Oponerse al tratamiento de sus datos: En determinadas circunstancias y por motivos
                                                            relacionados con su situación particular, Ud. tendrá derecho a oponerse al tratamiento
                                                            de sus datos en cuyo caso, dejaríamos de tratarlos salvo que por motivos legítimos
                                                            imperiosos, o el ejercicio o la defensa de posibles reclamaciones.</li>
                                                        </ul>
                                                    </li>
                                                    <br>
                                                    <li>
                                                        <strong>¿Cuándo responderemos a su solicitud?</strong>
                                                        <br>
                                                        Responderemos a sus peticiones a la mayor brevedad posible y, en todo caso, en el plazo
                                                        de un mes desde la recepción de su solicitud. Dicho plazo podrá prorrogarse otros dos
                                                        meses en caso necesario, teniendo en cuenta la complejidad y el número de solicitudes.
                                                        El responsable informará al interesado de la prórroga dentro del primer mes desde la
                                                        solicitud.
                                                    </li>
                                                    <br>
                                                    <li>
                                                        <strong>¿Usted tiene derecho a retirar su consentimiento?</strong>
                                                        <br>
                                                        El interesado tiene derecho a retirar el consentimiento en cualquier momento, sin que
                                                        ello afecte a la licitud del tratamiento basado en el consentimiento previo a su retirada.
                                                    </li>
                                                    <br>
                                                    <li>
                                                        <strong>¿Dónde debe dirigirse para el ejercicio sus derechos?</strong>
                                                        <br>
                                                        Para el ejercicio de los derechos reconocidos, el interesado podrá ponerse en contacto tanto a
                                                        través de la siguiente dirección de correo electrónico: cima@cimadidaktika como dirigiendo
                                                        un escrito a <strong>GOBELA 21, S.L.</strong>, en la Dirección indicada en el apartado
                                                    primero sobre el Responsable de Tratamiento.
                                                    </li>
                                                    <br>
                                                    <li>
                                                        <strong>¿Usted tiene derecho a reclamar?</strong>
                                                        <br>
                                                        Sí. Usted, especialmente cuando no haya obtenido satisfacción en el ejercicio de sus derechos,
                                                        tiene derecho a presentar reclamación ante la autoridad nacional de control, a estos efectos
                                                        debe dirigirse ante la Agencia Española de Protección de Datos, www.agpd.es.
                                                    </li>
                                                </ul>
                                                <br>
                                                <li><strong style="text-decoration: underline">CATEGORÍA DE DATOS.</strong>
                                                    <ul>
                                                        <li>Las categorías de datos que se tratan son:
                                                            <ul style="list-style-type: circle">
                                                                <li>Datos de identificación.</li>
                                                                <li>Direcciones postales o electrónicas.</li>
                                                                <li>Datos comerciales.</li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ol>
                                        </div>--}%

                    %{--<strong>GOBELA 21, S.L.</strong>, sozietateak izaera pertsonaleko datuen babesari aplikatu
                beharreko Espainiako eta Europako Legeak betetzeko konpromisoa erabat gain hartu du, eta ezarritako
                betebehar guztiak beteko dituela bermatzen du, eta baita ere Izaera Pertsonaleko Datuen Babesari
                buruzko 15/1999 Legean (LOPD) ezarritako eta Europar Batasuneko 2016/679 Datu Babesari buruzko Araudi
                Orokorrean (RGPD) ezarritako neurriak ezartzea.
                    <br>
                    <br>
                    <strong>GOBELA 21, S.L.</strong>,sozietateak ez du cookie-rik erabiltzen erabiltzaileen informazioa biltzeko, ezta
                sarbide IP helbideak erregistratu ere.  Berezko cookie-ak erabiltzen ditu bakarrik, saiokoak,
                helburu teknikoarekin (erabiltzaileari web gunetik zehar nabigatzen eta bertan existitzen diren
                aukera eta zerbitzu desberdinak erabiltzen uzten diotenak bakarrik).
                    <br>
                    <br>
                    <strong>GOBELA 21, S.L.</strong>, titular den atariak hirugarrenen web guneetara doazen estekak
                ditu, eta horien pribatutasun politikak ez dagozkio  GOBELA 21, S.L sozietatearen politikari.
                Aipatutako web gunetara sartzerakoan, erabaki dezakezu ea euren pribatutasun eta cookie-n politikak
                onartzen dituzun ala ez.  Oro har, Internetetik nabigatzen bazara, hirugarrenen cookie-ei uko egin
                diezaiekezu, zure nabigatzailearen konfigurazio aukeretatik.
                    <br>
                    <br>
                    <strong>GOBELA 21, S.L.</strong>, sozietateak datu pertsonalak tratatzeko entitatearen Pribatutasun
                Politika hau erabiltzaileen eskura jarri du, eta horiei hurrengo alderdiak jakinarazi dizkie:
                    <br>
                    <br>
                    <ul>
                        <li>Tratamenduaren Arduradunaren Nortasuna eta Harremanetarako Datuak</li>
                        <li>Tratatutako datuak, bere helburuak eta epeak edo horiek kontserbatzeko irizpideak.</li>
                        <li>Tratamenduaren oinarri juridikoa.</li>
                        <li>Zure datu pertsonalen hartzaileak</li>
                        <li>Erabiltzaile orok dituen eskubideei eta horiek aitortzeko prozedurari buruzkoak.</li>
                    </ul>
                    <br>
                    <ol>
                        <li><strong style="text-decoration: underline">TRATAMENDUAREN ARDURADUNA.</strong><br>
                            <ul style="list-style-type: none">
                                <li>Nortasuna: GOBELA 21, S.L.</li>
                                <li>IFK: B95571873</li>
                                <li>Posta helbidea: Plaza Ganeta nº 4. 48930 Getxo. Bizkaia.</li>
                                <li>Harremanetarako telefonoa: 94 608 18 88</li>
                                <li>Harremanetarako posta elektronikoa: cima@cimadidaktika.com</li>
                            </ul>
                        </li>
                        <br>
                        <li>
                            <strong style="text-decoration: underline">
                                DATU PERTSONALEN TRATAMENDUAK.
                            </strong>
                            <br>
                            <br>
                            <strong>Bezeroen kolektiboko Datu pertsonalen tratamenduak</strong>
                            <br>
                            <br>
                            <ul style="list-style-type:none">
                                <li><strong>a. Zein helburuarekin tratatuko ditugu zure datu pertsonalak?</strong>
                                    <br>
                                    <strong>GOBELA 21, S.L.</strong> sozietatean bezeroek ematen diguten informazioa
                                hurrengo helburuetarako tratatzen dugu:
                                    <br>
                                    <br>
                                    <ul style="list-style-type:none">
                                        <li>I.   I.    Kontratatutako produktuen eta zerbitzuen Kudeaketa, Administrazioa
                                        eta Prestazioa. Merkataritza harremana kudeatzea eta mantentzea kontratatutako
                                        kirolerako zerbitzuak eskaintzeko, eta baita administrazio fiskalerako eta
                                        kontabilitaterako.
                                        </li>
                                        <li>II.    II.    Merkataritza Bidalketak egitea. Horretarako baimena eman izanez
                                        gero, merkataritza, sustapen eta/edo marketin jarduerak edozein baliabideren
                                        bidez egitea, (elektronikoak barne, espresuki baimendutakoak), kirol
                                        zerbitzuekin lotuta.
                                        </li>
                                    </ul>
                                <li><strong>b. Legitimatzea</strong>
                                    <br>
                                    Zure datuak tratatzeko oinarri legala bezeroaren berariazko baimena da, edo bidezkoa
                                    bada, Ordezkari Legalena eta baita kontratatutako zerbitzua eskaintzeko tratamenduaren
                                    premia ere.
                                </li>
                                <li><strong>c. Hartzaileak</strong>
                                    <br>
                                    <ul style="list-style-type: none">
                                        <li>I.    Bidezkoa bada, Banku Entitateei kontratatutako zerbitzuak eskaintzetik
                                        eratorritako zenbateko ekonomikoak kudeatzeko.
                                        </li>
                                    </ul>
                                </li>
                                <li><strong>d. Zenbat denboraz kontserbatuko ditugu zure datuak?</strong>
                                    <br>
                                    Hornitutako datu pertsonalak kontserbatuko dira kontratatutako zerbitzuak
                                    eskaintzeko beharrezkoa den bitartean. Hura amaitzean, datuak legeak hala agintzen
                                    duelako kontserbatuko dira bakarrik.
                                    <br>
                                    Azkenik, eta baldin eta helburu honetarako baimena eman baduzu,<strong>GOBELA 21, S.L.</strong>,
                                sozietateak zure datuak kontserbatuko ditu interesgarriak izan dakizkizukeen jarduerei
                                eta zerbitzuei buruzko informazio eguneratu emateko helburuarekin.
                                </li>
                            </ul>
                            <br>
                        <li><strong>ERABAKI AUTOMATIZATUAK, PROFILAK ETA LOGIKA APLIKATUA..</strong>
                            <br>
                            Ez da, inolaz ere, automatizatutako erabakietan oinarritutako tratamendurik aurreikusten.
                        </li>
                        <br>
                        <li><strong style="text-decoration: underline">ESKUBIDEAK.</strong></li>
                        <ul>
                            <li>
                                <strong>Zeintzuk dira zure eskubideak zure datuak helarazten dizkiguzunean?</strong>
                                <br>
                                Edozeinek <strong>GOBELA 21 S.L</strong> sozietatean dagozkizuen datuak tratatzen
                            ari garen ala ez baieztatzeko eskubidea dauka.
                                <br>
                                Era berean, Datuen Babesari buruzko Araudi Orokorrak aurreikusten duen bezala,
                                jakinarazten dizugu hurrengo eskubideak dituzula:
                                <ul style="list-style-type: none">
                                    <li> Zure datuetara sartzea: Zure datuetan sartzeko eskubidea duzu zuri dagokizun
                                    zein datu pertsonal tratatzen ari garen jakiteko.
                                    </li>
                                    <li> Zure datuak zuzentzea edo ezabatzea eskatzea: Zenbait inguruabarretan,
                                    dagokizun eta gu tratatzen ari garen oker duden datu pertsonalak zuzentzeko
                                    eskubidea duzu, eta baita ezabatzeko ere, besteak beste, bere garaian bildu
                                    ziren xedeetarako dagoeneko beharrezkoak ez direnean
                                    </li>
                                    <li> Zure datuen tratamendua mugatzea eskatzea: Zenbait inguruabarretan, zure
                                    datuen tratamendua mugatzea eskatzeko eskubidea izango duzu. Horrelakoetan,
                                    jakinarazten dizugu datuak gordeko ditugula bakarrik erreklamazioak egiteko edo
                                    defendatzeko, Datuen Babesari buruzko Araudi Orokorrak aurreikusten duen bezala.
                                    </li>
                                    <li> Zure datuak eramatea: Zenbait inguruabarretan, zuri dagokizun eta guri
                                    helarazi dizkiguzun datu pertsonalak jasotzeko eskubidea izango duzu, egituratutako,
                                    ohiko erabilerarako eta irakurketa mekanikoko formatu batean, tratamenduaz arduratuko
                                    den beste bati igortzeko.
                                    </li>
                                    <li> Zure datuen tratamenduari uko egitea: Zenbait inguruabarretan eta zure egoera
                                    partikularrarekin lotutako arrazoiengatik, zure datuak tratatzeari uko egiteko
                                    eskubidea izango duzu. Horrelakoetan, horiek tratatzeari utziko genioke, ezinbesteko
                                    arrazoi legalengatik, edo egon daitezkeen erreklamazioak burutzeagatik edo
                                    defendatzeagatik izan ezik.
                                    </li>
                                </ul>
                            </li>
                            <br>
                            <li>
                                <strong>Noiz erantzungo diogu zure eskaerari?</strong>
                                <br>
                                Zure eskaerei ahalik eta lasterren erantzungo diegu eta, nolanahi ere, eskaera jaso
                                eta hilabeteko epean. Aipatutako epea beste bi hilabetez luzatu ahal izango da
                                beharrezkoa izanez gero, eskaeren konplexutasuna eta kopurua kontuan hartuta.
                                Arduradunak interesatuari luzapenaren berri emango dio lehenengo hilabetearen barruan,
                                eskaera jaso denetik.
                            </li>
                            <br>
                            <li>
                                <strong>Zure baimena atzera botatzeko eskubidea duzu?</strong>
                                <br>
                                Interesatuak baimena edozein unetan atzera botatzeko eskubidea dauka, horrek atzera
                                bota aurretiko baimenean oinarritutako tratamenduaren zilegiztasunari kalterik egin gabe.
                            </li>
                            <br>
                            <li>
                                <strong>Nora jo behar duzu eskubideak aitortzeko?</strong>
                                <br>
                                Onartutako eskubideak aitortzeko, interesatua aipatutako sozietatearekin harremanetan
                                jarri ahal izango da hurrengo posta elektronikoaren helbidearen bidez: cima@cimadidaktika.com
                                edo idatzi bat <strong>GOBELA 21, S.L.</strong>, sozietateari zuzenduta, Tratamenduaren
                            Arduradunari buruzko lehenengo atalean adierazitako Helbidean.
                            </li>
                            <br>
                            <li>
                                <strong>Erreklamatzeko eskubidea duzu?</strong>
                                <br>
                                Bai. Bereziki, zure eskubideen aitorpenarekin ase geratu ez zarenean, erreklamazio bat
                                kontrol agintari nazionalaren aurrean aurkezteko eskubidea duzu. Ondorio hauetarako
                                Datu Babeserako Espainiako Agentziara zuzendu beharko zara.www.agpd.es.
                            </li>
                        </ul>
                        <br>
                        <li><strong style="text-decoration: underline">DATUEN KATEGORIA.</strong>
                            <ul>
                                <li>Hauek dira tratatzen diren datuen kategoriak:
                                    <ul style="list-style-type: circle">
                                        <li>Identifikazio datuak.</li>
                                        <li>Posta helbideak edo elektronikoak</li>
                                        <li>Merkataritza datuak.</li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ol>
                </div>--}%

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>