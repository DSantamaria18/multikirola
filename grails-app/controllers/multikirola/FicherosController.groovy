package multikirola

import grails.util.Holders

class FicherosController {
    static final String UPLOAD_FOLDER = Holders.getGrailsApplication().config.uploadFolder

    def index() {

        ArrayList<Map> fileList = []
        def f = new File("${UPLOAD_FOLDER}/")
        if (f.exists()) {
            f.eachFile() { file ->
                if (!file.isDirectory()) {
                    Map fileInfo = [:]
                    fileInfo.nombre = file.name
                    fileInfo.tamaño = file.size()/1024
                    fileList.add(fileInfo)
                }
            }
        }
        fileList.sort { a, b -> b.value <=> a.value }

        [fileList: fileList, fileCount: fileList.size()]
    }


    def downloadFile() {
        def filename = params.fileId.replace('###', '.')
        String ruta = "${UPLOAD_FOLDER}/"
        def file = new File(ruta + File.separatorChar + filename)

        response.setContentType("APPLICATION/OCTET-STREAM")
        response.setHeader("Content-Disposition", "Attachment;Filename=\"${filename}\"")
        def fileInputStream = new FileInputStream(file)

        def outputStream = response.getOutputStream()
        byte[] buffer = new byte[4096]
        int len
        while ((len = fileInputStream.read(buffer)) > 0) {
            outputStream.write(buffer, 0, len)
        }
        outputStream.flush()
        outputStream.close()
        fileInputStream.close()
    }

    def uploadFile() {
        def f = request.getFile('FileUpload')
        String ruta = "${UPLOAD_FOLDER}/"
        File folder = new File(ruta)
        if (!folder.exists()) {
            folder.mkdirs()
        }
        if (!f.empty) {
            flash.message = "Se ha subido ${f.getOriginalFilename()}"
            f.transferTo(new File(ruta + File.separatorChar + f.getOriginalFilename()))
        } else {
            flash.message = 'Debes seleccionar un fichero'
        }
        redirect(action: 'index')
    }
}
