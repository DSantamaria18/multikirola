<div class="email-box">
    <p>El usuario ${user.nombre} ${user.apellidos} ha solicitado el borrado de sus datos.</p>
    <br />
    <div>
        <label for="nombre">Nombre:</label>
        <span><label>${user.nombre}</label></span>
    </div>

    <div>
        <label for="apellidos">Apellidos:</label>
        <span><label>${user.apellidos}</label></span>
    </div>

    <div>
        <label for="email">Email:</label>
        <span><label>${user.email}</label></span>
    </div>

    <div>
        <label for="movil">Móvil:</label>
        <span><label>${user.movil}</label></span>
    </div>

    <div>
        <label for="whatsapp">Notificaciones WhatsApp:</label>
        <span><label><g:if test="${user?.whatsapp == true}">SI</g:if><g:else>NO</g:else></label></span>
    </div>
</div>
