<div class="email-box">
    <div>
        <p>
            Hola, ${user.nombre},
            Para recuperar tu contraseña pulsa <a href='${createLink(absolute: true, controller: "user", action: "resetPassword", params: [token:"${token.value}", email:"${user.email}"])}'>este enlace</a>
        </p>
    </div>
</div>