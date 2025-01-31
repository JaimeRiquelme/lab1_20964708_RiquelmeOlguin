#lang racket/base
(require racket/date)
(require racket/string)

(require "TDA_Drive_20964708_RiquelmeOlguin.rkt")
(require "TDA_User_20964708_RiquelmeOlguin.rkt")
(require "TDA_Folder_20964708_RiquelmeOlguin.rkt")
(require "TDA_File_20964708_RiquelmeOlguin.rkt")

(provide (all-defined-out))


;Nombre de la función: make-system
;Dominio: string X list X list X string X list X user X list
;Recorrido: system
;Descripción: Esta función toma un nombre de sistema nombre, una lista de drives drive, una lista de usuarios usuarios,
; una ruta actual de sistema ruta, la fecha actual fecha-actual, el usuario logeado en el sistema logeado y la letra de unidad
;actual current-drive. Retorna una lista que representa un sistema con la información proporcionada.
(define (make-system nombre drive usuarios ruta fecha-actual logeado current-drive papelera)
  (list nombre drive usuarios ruta fecha-actual logeado current-drive papelera))



;Nombre de la función: get-nombre-system
;Dominio: system
;Recorrido: system
;Descripción: Esta función toma un sistema system como argumento y devuelve el nombre del sistema.

(define get-nombre-system (lambda (system) (car system)))

;Nombre del selector: get-drive-system
;Dominio: system
;Recorrido: lista de drives
;Descripción: Esta función toma un sistema system como argumento y devuelve la lista de drives del sistema.

(define get-drive-system (lambda (system) (cadr system)))

;Nombre del selector: get-usuarios-system
;Dominio: system
;Recorrido: lista de usuarios
;Descripción: Esta función toma un sistema system como argumento y devuelve la lista de usuarios del sistema.

(define get-usuarios-system (lambda (system) (caddr system)))

;Nombre del selector: get-ruta-system
;Dominio: system
;Recorrido: ruta actual del sistema
;Descripción: Esta función toma un sistema system como argumento y devuelve la ruta actual del sistema.

(define get-ruta-system (lambda (system) (cadddr system)))


;Nombre del selector: get-fecha-system
;Dominio: system
;Recorrido: fecha actual del sistema
;Descripción: Esta función toma un sistema system como argumento y devuelve la fecha actual del sistema.

(define get-fecha-system (lambda (system)(cadddr (reverse system))))

;Nombre del selector: get-logeado-system
;Dominio: system
;Recorrido: usuario logeado en el sistema
;Descripción: Esta función toma un sistema system como argumento y devuelve el usuario logeado en el sistema.

(define get-logeado-system (lambda(system)(caddr(reverse system))))

;Nombre del selector: get-current-drive-system
;Dominio: system
;Recorrido: letra de unidad actual del sistema
;Descripción: Esta función toma un sistema system como argumento y devuelve la letra de unidad actual del sistema.

(define get-current-drive-system (lambda (system)(cadr(reverse system))))
;Nombre del selector: get-papelera-system
;Dominio: system
;Recorrido: lista con contenido pepelera.
;Descripción: Esta función toma un sistema system como argumento y devuelve la papelera del sistema.

(define get-papelera-system(lambda(system)(car(reverse system))))

;Nombre del modificador: set-nombre-system
;Dominio: system-nombre, nombre
;Recorrido: system-nombre
;Descripción: Esta función toma dos argumentos, un sistema system-nombre y un nombre. Devuelve un nuevo sistema con el mismo drive-system, usuarios-system,
;ruta-system, fecha-system, logeado-system y current-drive-system que system-nombre, pero con el nombre cambiado a nombre.

(define set-nombre-system (lambda (system-nombre nombre)(make-system nombre (get-drive-system system-nombre) (get-usuarios-system system-nombre)
                 (get-ruta-system system-nombre) (get-fecha-system system-nombre) (get-logeado-system system-nombre)(get-current-drive-system system)(get-papelera-system system))))

;Nombre del modificador: set-drive-system
;Dominio: system y drive
;Recorrido: system y drive
;Descripción: Esta función toma un sistema system y un drive drive como argumentos, y devuelve un nuevo sistema que tiene la lista de unidades actualizada.

(define set-drive-system(lambda (system drive)(make-system (get-nombre-system system) drive (get-usuarios-system system) (get-ruta-system system)
                 (get-fecha-system system) (get-logeado-system system)(get-current-drive-system system)(get-papelera-system system))))
;Nombre del modificador: set-drive-system2
;Dominio: system y drive
;Recorrido: system y drive
;Descripción: Esta función toma un sistema system y un drive drive como argumentos, y devuelve un nuevo sistema que tiene la lista de unidades actualizada.
(define set-drive-system2(lambda (system drive)(make-system (get-nombre-system system) drive (get-usuarios-system system) (string-append(string(car(get-current-drive-system system))) ":/")
                 (get-fecha-system system) (get-logeado-system system)(get-current-drive-system system)(get-papelera-system system))))

;Nombre del modificador: set-usuarios-system
;Dominio: system
;Recorrido: system
;Descripción: Esta función toma un sistema system y una lista de usuarios como argumentos, y devuelve un nuevo sistema con la lista de usuarios actualizada.

(define set-usuarios-system(lambda (system usuarios)(make-system (get-nombre-system system) (get-drive-system system) usuarios (get-ruta-system system)
                 (get-fecha-system system) (get-logeado-system system)(get-current-drive-system system)(get-papelera-system system))))

;Nombre del modificador: set-ruta-system
;Dominio: system
;Recorrido: system
;Descripción: Esta función toma un sistema system y una ruta como argumentos y devuelve un nuevo sistema con la ruta actualizada.

(define set-ruta-system(lambda (system ruta)(make-system (get-nombre-system system) (get-drive-system system) (get-usuarios-system system) ruta
                 (get-fecha-system system) (get-logeado-system system)(get-current-drive-system system)(get-papelera-system system))))

;Nombre del modificador: set-fecha-system
;Dominio: system
;Recorrido: fecha actual del sistema
;Descripción: Esta función toma un sistema system y una fecha como argumentos, y devuelve un nuevo sistema con la fecha actualizada.
;La función accede a la fecha actual del sistema mediante el selector get-fecha-system y reemplaza su valor por el nuevo valor pasado como argumento.

(define set-fecha-system(lambda (system fecha)(make-system (get-nombre-system system) (get-drive-system system) (get-usuarios-system system) (get-ruta-system system)
                 fecha (get-logeado-system system)(get-current-drive-system system)(get-papelera-system system))))

; Nombre de la función: set-logeado
; Dominio: system X user
; Recorrido: system actualizado
; Recursión: No aplica
; Descripción: Esta función toma un sistema y un usuario como argumentos. Devuelve un nuevo sistema con el usuario actualizado,
;conservando todos los demás campos del sistema original.


(define set-logeado(lambda (system user)(make-system (get-nombre-system system)(get-drive-system system)(get-usuarios-system system)(get-ruta-system system)
                 (get-fecha-system system)user(get-current-drive-system system)(get-papelera-system system))))

; Nombre de la función: set-current-drive
; Dominio: system X current-drive
; Recorrido: system actualizado
; Recursión: No aplica
; Descripción: Esta función toma un sistema y un current-drive como argumentos. Devuelve un nuevo sistema con el drive
;actual actualizado, conservando todos los demás campos del sistema original.

                 

(define set-current-drive(lambda (system current-drive)(make-system (get-nombre-system system)(get-drive-system system)(get-usuarios-system system)(get-ruta-system system)
                 (get-fecha-system system)(get-logeado-system system) current-drive(get-papelera-system system))))

; Nombre de la función: set-papelera
; Dominio: system X basura
; Recorrido: system actualizado
; Recursión: No aplica
; Descripción: Esta función toma un sistema y un elemento basura como argumentos. Devuelve un nuevo sistema con
;el elemento basura añadido a la papelera, conservando todos los demás campos del sistema original.


(define set-papelera(lambda (system basura)(make-system (get-nombre-system system)(get-drive-system system)(get-usuarios-system system)(get-ruta-system system)
                 (get-fecha-system system)(get-logeado-system system) (get-current-drive-system system)(cons basura (get-papelera-system system)))))





;Nombre de la función: system
;Dominio: nombre (string)
;Recorrido: system
;Descripción: Esta función toma un nombre como argumento y devuelve un sistema vacío con ese nombre.
; El sistema vacío no tiene drives, usuarios, ruta actual, fecha actual, usuario logeado o unidad de drive actual.
(define (system nombre)
  (if(string? nombre)
  (make-system nombre '() '() "" (fecha-actual) '() null '())
  #f))

;Nombre de la función: run
;Dominio: sistema X comando
;Recorrido: resultado del comando aplicado al sistema
;Descripción: Esta función toma un sistema system y un comando como argumentos.
; El comando debe ser una función que toma el sistema como argumento y devuelve un resultado.
; La función run aplica el comando al sistema y devuelve el resultado obtenido.
(define run(lambda (system comando)(comando system)))





;Nombre de la función: add-drive
;Dominio: sistema X letra (string) X nombre (string) X capacidad (number)
;Recorrido: sistema actualizado con la unidad de disco añadida
;Descripción: Esta función toma un sistema system, una letra de unidad letra, un nombre nombre y una capacidad capacidad como argumentos.
; Si la letra de unidad letra no está en la lista de unidades de disco del sistema system, la función crea una nueva unidad de disco con la letra letra, el nombre nombre y la capacidad capacidad.
; Luego, actualiza la lista de unidades de disco del sistema system con la nueva unidad de disco y devuelve el sistema actualizado. Si la letra de unidad ya existe, devuelve el sistema sin modificar.
(define add-drive
  (lambda (system)
    (lambda (letra nombre capacidad)
      (if (and (char? letra) (string? nombre) (number? capacidad))
          (if (not (member (char-upcase letra) (map car (get-drive-system system))))
              (make-system (get-nombre-system system)
                           (cons (drive (char-upcase letra) nombre capacidad) (get-drive-system system))
                           (get-usuarios-system system)
                           (if (null? (get-drive-system system))
                               (string-append (string-upcase (string letra)) ":/" (get-ruta-system system))
                               (get-ruta-system system))
                           (get-fecha-system system)
                           (get-logeado-system system)
                           (if (null? (get-current-drive-system system))
                               (list (char-upcase letra))
                               (get-current-drive-system system))
                           (get-papelera-system system))
          system)
          system))))




; Nombre de la funcion: Register
; Dominio: system X name-user (string)
; Recorrido: system
; Descripción: Función para agregar un nuevo usuario al sistema. Toma un sistema system y un nombre de usuario name-user como argumentos.
; Si el nombre de usuario ya existe en el sistema, devuelve el mismo sistema sin cambios.
; Si el nombre de usuario no existe en el sistema, crea un nuevo usuario con el nombre especificado y lo agrega a la lista de usuarios del sistema.
; Devuelve el sistema actualizado con el nuevo usuario agregado.
(define register
  (lambda (system)
    (lambda (name-user)
      (if(string? name-user)
      (if (member (string-upcase name-user) (map car (get-usuarios-system system)))
          system
          (make-system (get-nombre-system system)
                       (get-drive-system system)
                       (append (get-usuarios-system system) (list (make-user (string-upcase name-user))))
                       (get-ruta-system system)
                       (fecha-actual)
                       (get-logeado-system system)
                       (get-current-drive-system system)
                       (get-papelera-system system)))
      system))))





;Nombre de la función: login
;Dominio: system X nombre de usuario (string)
;Recorrido: usuarios del sistema
;Recursión: no utiliza recursión
;Descripción: Esta función toma un sistema system y un nombre de usuario name-user como argumentos.
; Si el nombre de usuario se encuentra en la lista de usuarios del sistema, la función verifica si el usuario ya se ha logeado previamente.
; Si el usuario no se ha logeado previamente, la función llama a la función set-logeado para establecerlo como usuario logeado y devuelve el sistema actualizado.
; Si el usuario ya se ha logeado previamente, la función devuelve el sistema sin modificar. Si el nombre de usuario no se encuentra en la lista de usuarios del sistema, la función devuelve el sistema sin modificar.


(define login
  (lambda (system)
    (lambda (name-user)
      (if(string? name-user)
         (if (member (string-upcase name-user) (map car (get-usuarios-system system)))
             (if (null? (get-logeado-system system))
                 (set-logeado system (string-upcase name-user))
                 system)
             system)
         system))))


;Nombre de la función: logout
;Dominio: system
;Recorrido: system
;Descripción: Esta función toma un sistema system como argumento y verifica si hay algún usuario logeado en el sistema.
; Si hay un usuario logeado, entonces llama a la función set-logeado-path con el argumento de una lista vacía.
; Si no hay ningún usuario logeado, devuelve el sistema sin cambios.

(define logout
  (lambda (system)
    (if (not (get-logeado-system system))
        system
        (set-logeado-path system '()))))

;Nombre de la función: switch-drive
;Dominio: system X drive (string)
;Recorrido: system
;Descripción: Esta función toma un sistema system y una letra de unidad drive como argumentos.
; Verifica si la letra de unidad existe en la lista de drives del sistema utilizando la función drive-Lista?
; Si existe, verifica si hay un usuario logeado en el sistema utilizando la función get-logeado-system.
; Si hay un usuario logeado, llama a la función make-system para crear un nuevo sistema con la letra de unidad actualizada, la ruta cambiada a la raíz de la nueva unidad, el usuario logeado y el valor de la unidad actualizado utilizando la función currentdrive.
; Si no hay un usuario logeado, llama a la función make-system para crear un nuevo sistema con la letra de unidad actualizada y los otros valores del sistema sin cambios.
; Si la letra de unidad no existe, devuelve el sistema sin cambios.

(define switch-drive
  (lambda (system)
    (lambda (drive)
      (if(char? drive)
         (if (drive-Lista? drive system)
             (if (not (null? (get-logeado-system system)))
                 (make-system (get-nombre-system system)
                           (get-drive-system system)
                           (get-usuarios-system system)
                           (string-append (string-upcase(string drive))":/")
                           (get-fecha-system system)
                           (get-logeado-system system)
                           (currentdrive drive)
                           (get-papelera-system system))
                 system)
          
              system)
         system))))

;Nombre de la función: md (make directory)
;Dominio: system X name (string)
;Recorrido: system
;Descripción: Esta función toma un sistema system y un nombre nombre como argumentos,
;             crea un nuevo directorio con el nombre proporcionado nombre en el directorio actual del usuario en el sistema
;             y devuelve el sistema actualizado con los nuevos drives.

(define md
  (lambda (system)
    (lambda(nombre)
      (if(string? nombre)
      (set-drive-system system (SyMDrive system (string (car (get-current-drive-system system)))
                                         (string-upcase nombre)))
      system))))




;Nombre de la función: cd
;Dominio: system X nuevaruta
;Recorrido: sistema actualizado
;Recursión: ninguna
;Descripción: Esta función toma un sistema system y una nueva ruta nuevaruta como argumentos.
; Si la ruta actual no está vacía, la función evalúa la nueva ruta y la actualiza en el sistema en consecuencia.
; Si la nueva ruta es "/" (la raíz del sistema), la función actualiza la ruta con la letra de la unidad actual.
; Si la nueva ruta es ".." (regresar un nivel en el sistema), la función utiliza la función cdpunto para actualizar la ruta.
; Si la nueva ruta es una ruta válida, la función actualiza la unidad de disco actual y la ruta del sistema en consecuencia.
; Si la nueva ruta no es válida, la función intenta actualizar la unidad de disco actual utilizando la función anónima SyMDrive2.
; La función devuelve el sistema actualizado con la ruta y la unidad de disco actualizadas.
(define cd
  (lambda (system)
    (lambda (nuevaruta)
      (if(string? nuevaruta)
         (if (not (null? (get-ruta-system system)))
             (if(equal? "/" nuevaruta)
                (set-ruta-system system (string-append (string (car(get-current-drive-system system))) ":/" ))
                (if(equal? ".." nuevaruta)
                   (set-ruta-system system (cdpunto system (get-ruta-system system)))
                   (if(ispath? system nuevaruta)
                      (make-system (get-nombre-system system) (get-drive-system system) (get-usuarios-system system) (string-upcase nuevaruta)
                                   (get-fecha-system system) (get-logeado-system system)(list(string-ref (car (string-split nuevaruta ":"))0))(get-papelera-system system))
                      (if (SyMDrive2 system (string (car (get-current-drive-system system))) nuevaruta)
                          (set-ruta-system system (string-append (get-ruta-system system) (string-upcase nuevaruta) "/"))               
                          system))))          
             system)
         system))))

;Nombre de la función: add-file
;Dominio: system X filecreado
;Recorrido: Lista de drives actualizada
;Descripción: Esta función toma un sistema system y un archivo filecreado como argumentos.
; Utiliza la función anónima SyMDrive3 para buscar la unidad correspondiente al archivo y actualizar la lista de drives.
; Devuelve la lista de drives actualizada con el archivo agregado.
(define add-file
  (lambda (system)
    (lambda (filecreado)
      (if(equal? filecreado #f)
         system
      (set-drive-system system (SyMDrive3 system filecreado ))))))


; Nombre de la función: del
; Dominio: system
; Recorrido: función
; Recursión: No aplica
; Descripción: Esta función toma un sistema como argumento y devuelve otra función que toma una condición como argumento.
;Si la condición es una cadena de caracteres, busca una copia de un archivo o carpeta con el nombre especificado en la ruta actual del sistema.
;Si encuentra una coincidencia, agrega el elemento encontrado a la papelera y devuelve un nuevo sistema con la papelera actualizada.
;Si la condición no es una cadena de caracteres o no se encuentra ninguna coincidencia, devuelve el sistema sin cambios.


#|(define del1
  (lambda (system)
    (lambda (condicion)
      (if(string? condicion)
         (let ((copia (buscarcopia system condicion (get-ruta-system system))))
               (del2 (set-papelera system (buscarcopia system condicion (get-ruta-system system))) condicion))
         system))))
|#

(define del
  (lambda (system)
    (lambda (condicion)
      (if (string? condicion)
          (if(equal? condicion "*.*")
               (del2 (set-papelera system (buscarcopia system condicion (get-ruta-system system))) condicion)
               (if(equal? (buscarcopia system condicion (get-ruta-system system)) #f)
                  system
                  (del2 (set-papelera system (buscarcopia system condicion (get-ruta-system system)))condicion)))
          system))))




; Nombre de la función: rd
; Dominio: system X carpera(string)
; Recorrido: system
; Recursión: no aplica
; Descripción: Esta función toma un sistema 'system' como argumento y devuelve una función lambda que toma 'carpeta'.
;              La función lambda llama a la función SyMDrive8 con el sistema y la carpeta para eliminarla.
;              Devuelve el sistema actualizado con el resultado de SyMDrive8.

(define rd
  (lambda(system)
    (lambda (carpeta)
      (if(string? carpeta)
         (set-drive-system system (SyMDrive8 system carpeta))
         system))))

; Nombre de la función: copy
; Dominio: system
; Recorrido: función lambda (nombrecopia X ruta)
; Recursión: no aplica
; Descripción: Esta función toma un sistema 'system' como argumento y devuelve una función lambda que toma 'nombrecopia' y 'ruta'.
;              La función lambda verifica si la ruta es una carpeta raíz y llama a la función SyMDrive11 con diferentes opciones.
;              Devuelve el sistema actualizado con los resultados de SyMDrive11.

(define copy
  (lambda (system)
    (lambda (nombrecopia ruta)
      (if(and(string? nombrecopia)(ispath? system ruta))
         (if(esraiz? system ruta)
            (set-drive-system system (SyMDrive11 system ruta nombrecopia 1 ))
            (set-drive-system system (SyMDrive11 system ruta nombrecopia 2)))
         system))))

;Nombre de la función: move
;Dominio: system X nombre X ruta
;Recorrido: sistema actualizado
;Recursión: ninguna
;Descripción: Esta función toma un sistema system, un nombre de archivo y una ruta.
; utiliza la funcion copy para copiar el archivo a la ruta donde se desea mover,
;y posteriormente elimina el archivo de la ruta donde se econtraba utilizando la funcion del2


(define move
  (lambda (system)
    (lambda (archivomov rutamov)
      (if(and(string? archivomov)(ispath? system rutamov))
         (let ((copy-fn (copy system)))
           (let ((new-system (copy-fn archivomov rutamov)))
             (let ((final-system (del2 new-system archivomov)))
               final-system)))
         system))))

; Nombre de la función: ren
; Dominio: system, nombrecarpeta, nuevonombre
; Recorrido: sistema actualizado
; Recursión: no recursiva
; Descripción: Renombra una carpeta o archivo en el sistema 'system' según el nombre actual 'nombrecarpeta' y el nuevo nombre 'nuevonombre'.
;              Si 'nombrecarpeta' y 'nuevonombre' son cadenas, la función verifica si la ruta del sistema es la raíz.
;              Si es la raíz, busca y renombra la carpeta usando 'buscardriverename'.
;              Si no es la raíz, busca y renombra el archivo usando 'buscardriverename'.
;              Si 'nombrecarpeta' o 'nuevonombre' no son cadenas, devuelve el sistema sin cambios.

(define ren
  (lambda(system)
    (lambda(nombrecarpeta nuevonombre)
      (if(and(string? nombrecarpeta)(string? nuevonombre))
         (if(esraiz? system (get-ruta-system system))
            (set-drive-system system (buscardriverename system nombrecarpeta nuevonombre 1));modificar el nombre al folder
            (set-drive-system system (buscardriverename system nombrecarpeta nuevonombre 2)));modificar el nombre al file
         system))))


; Nombre de la función: dir
; Dominio: system
; Recorrido: lista de directorios
; Recursión: No aplica
; Descripción: Esta función toma un sistema como argumento. Si no se proporcionan argumentos adicionales,
;la función devuelve la lista de directorios en el directorio actual del sistema. Si se proporcionan argumentos adicionales, la función devuelve los argumentos sin modificar.

(define dir
  (lambda (system)
    (define (inner-dir args)
      (if (null? args)
          (alistaractual system)
          args))
    (inner-dir '())))


;Nombre de la función: format
;Dominio: system X letra X nombre
;Recorrido: sistema actualizado
;Recursión: ninguna
;Descripción: Esta función toma un sistema system, una letra de unidad letra y un nombre de unidad nombre como argumentos.
; Utiliza la función buscarformat para buscar la unidad correspondiente al formato solicitado y actualizar el sistema en consecuencia.
; La función devuelve el sistema actualizado con la unidad de disco formateada.

(define format
  (lambda (system)
    (lambda (letra nombre)
      (if(and(char? letra)(string? nombre))
         (make-system (get-nombre-system system) (buscarformat system letra nombre) (get-usuarios-system system) (get-ruta-system system)
                 (get-fecha-system system) (get-logeado-system system)(get-current-drive-system system)(get-papelera-system system))
         system))))


#|(define (plus-one s)
  (list->string (map (lambda (c) (integer->char (+ (char->integer c) 1))) (string->list s))))


(define (minus-one s)
  (list->string (map (lambda (c) (integer->char (- (char->integer c) 1))) (string->list s))))
|#




;-----------------OTRAS-FUNCIONES----------------------------------------------------------------------------------------------------;


;Nombre de la función: file
;Dominio: system X nombre X extensión X contenido X seguridad (opcional)
;Recorrido: archivo creado
;Recursión: ninguna
;Descripción: Esta función toma un nombre de archivo nombre, una extensión de archivo extensión, un contenido de archivo contenido y una seguridad opcional seguridad como argumentos.
; Utiliza la función make-folder para crear un archivo con los parámetros entregados.
; La función devuelve el archivo creado.
(define file
  (lambda (nombre extencion contenido . seguridad)
    (if(and(string? nombre)(string? extencion)(string? contenido).(char? seguridad))
      (let ((fecha (fecha-actual)))
        (make-file (string-upcase nombre)
                     extencion
                     contenido
                     fecha
                     fecha
                     null
                     null
                     null
                     seguridad                   
                     null))
      #f)))

;Nombre de la función: folder
;Dominio: system X name (string)
;Recorrido: folder
;Descripción: Esta función toma un sistema system y un nombre nombre como argumentos, crea una nueva carpeta con el nombre
;proporcionado nombre en la ruta actual del usuario en el sistema, y devuelve la carpeta recién creada.
(define folder
  (lambda (system nombre)
      (let ((fecha (fecha-actual)))
        (make-folder nombre
                     null
                     fecha
                     fecha
                     (get-logeado-system system)
                     null
                     null
                     null
                     null
                     (get-ruta-system system)))))


;Nombre de la función: ispath?
;Dominio: system X ruta
;Recorrido: booleano (verdadero o falso)
;Recursión: ninguna
;Descripción: Esta función toma un sistema system y una ruta ruta como argumentos.
; Utiliza la función get-drive-system para obtener la lista de unidades de disco en el sistema y compara la primera parte de la ruta con los nombres de las unidades de disco.
; La función devuelve verdadero si la ruta es una ruta válida en el sistema y falso en caso contrario.

(define ispath?
  (lambda (system path)
    (if(string? path)
      (if (member (string-upcase(car (string-split path ":"))) (map string-upcase(map string (map car (get-drive-system system)))))
          #t
          #f)
      #f)))

;Nombre de la función: fecha-actual
;Dominio: ningún argumento
;Recorrido: lista de fecha y hora actual
;Recursión: ninguna
;Descripción: Esta función no toma argumentos y devuelve la fecha y hora actuales como una lista con el siguiente formato:
; (día mes año hora:minuto). La hora y el minuto se presentan como una cadena de dos dígitos separados por dos puntos.

(define (fecha-actual)(define fecha (current-date))
        (list (date-day fecha)
               (date-month fecha)
               (date-year fecha)
               (string-append (number->string (date-hour fecha))
                       ":"
                (number->string (date-minute fecha)))))

;Nombre de la función: drive-Lista?
;Dominio: unidad de disco X sistema
;Recorrido: booleano (verdadero o falso)
;Recursión: ninguna
;Descripción: Esta función toma una unidad de disco drive y un sistema system como argumentos.
; Utiliza la función get-drive-system para obtener la lista de unidades de disco en el sistema y busca la unidad drive en la lista.
; La función devuelve verdadero si la unidad drive está presente en la lista y falso en caso contrario.
(define drive-Lista?
  (lambda(drive system)
    (member (char-upcase drive) (map car(get-drive-system system))))) 




;Nombre de la función: set-logeado-path
;Dominio: sistema X usuario
;Recorrido: sistema actualizado con el usuario logueado
;Recursión: ninguna
;Descripción: Esta función toma un sistema system y un usuario logueado user como argumentos.
; Utiliza la función get-current-drive-system para obtener la unidad de disco actual en el sistema, y utiliza string-append para construir una ruta que comienza con la letra de la unidad de disco y termina con un slash.
; Luego utiliza la función make-system para crear un nuevo sistema con la misma información que system, pero con la ruta actualizada con la ruta construida anteriormente y el usuario logueado actualizado con user.
; La función devuelve el sistema actualizado.

(define set-logeado-path(lambda (system user)(make-system (get-nombre-system system)(get-drive-system system)(get-usuarios-system system)
                  (string-append (string(car (get-current-drive-system system)))":/")
                 (get-fecha-system system)user(get-current-drive-system system)(get-papelera-system system))))


;Nombre de la función: SyMDrive
;Dominio: system X letra (string) X nombre (string)
;Recorrido: lista de drives
;recursion: recursion de cola
;Descripción: Esta función toma un sistema system, una letra de unidad letra y un nombre de carpeta nombre como argumentos.
; Busca la letra de unidad letra en la lista de drives del sistema y si la encuentra, busca si ya existe una carpeta con el nombre nombre en la unidad correspondiente.
; Si existe, devuelve la lista de drives sin modificar.
; Si no existe, crea una nueva carpeta con el nombre nombre y actualiza la unidad correspondiente con la nueva carpeta.
; Devuelve la lista de drives actualizada.


(define SyMDrive
  (lambda (system letra nombre)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            lista
            (if (equal? (string (get-letra-drive (car drives))) letra)
                (if (member nombre (listarfolders3 system (car drives)))
                    (buscador (cdr drives) (append lista (list (car drives))))
                    (let ((new-drive (set-contenido-drive (folder system nombre) (car drives))))
                      (buscador (cdr drives) (append lista (list new-drive)))))
                (buscador (cdr drives) (append lista (list (car drives))))))))
    (buscador (cadr system) '())))

;Nombre de la función: SyMDrive2
;Dominio: sistema X letra de unidad (cadena de caracteres) X nombre de carpeta (cadena de caracteres)
;Recorrido: Carpeta correspondiente si existe, falso en caso contrario
;Recursión: ninguna
;Descripción: Esta función toma un sistema system, una letra de unidad de disco letra y un nombre de carpeta nombre como argumentos.
; Utiliza la función get-drive-system para obtener la lista de unidades de disco en el sistema y busca la unidad correspondiente a la letra letra.
; Si encuentra la unidad de disco, busca la carpeta correspondiente al nombre nombre en la lista de carpetas de la unidad de disco utilizando la función buscarfolder.
; La función devuelve la carpeta correspondiente si existe, y falso en caso contrario.

(define SyMDrive2
  (lambda (system letra nombre)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            #f
            (if (equal? (string (get-letra-drive (car drives))) letra)
                (buscarfolder (cadddr(car drives)) (string-upcase nombre))                
                (buscador (cdr drives) (append lista (list (car drives))))))))
    (buscador (cadr system) '())))


;Nombre de la función: buscarfolder
;Dominio: lista de folders X nombre (cadena de caracteres)
;Recorrido: valor booleano (true/false)
;Descripción: Esta función toma una lista de folders folders y un nombre de carpeta nombre como argumentos.
; Utiliza recursión para buscar en la lista de folders la carpeta con el nombre especificado.
; Si se encuentra la carpeta, la función devuelve true, de lo contrario devuelve false.
(define buscarfolder
  (lambda (folders nombre )
    (if (null? folders)
        #f
        (let ((folder (car folders)))
          (if (equal? (get-nombre-folder folder) nombre)
              #t
              (buscarfolder (cdr folders) nombre))))))


;Nombre de la función: cdpunto
;Dominio: ruta (cadena de caracteres)
;Recorrido: ruta actualizada a la ruta anterior (subiendo un nivel)
;Recursión: ninguna
;Descripción: Esta función toma una ruta en formato de cadena de caracteres string como argumento.
; Utiliza la función string-split para separar la ruta por las barras diagonales y obtiene una lista de las partes de la ruta.
; Utiliza reverse para invertir el orden de la lista, elimina el último elemento (que corresponde al nombre del directorio actual) utilizando cdr, y vuelve a invertir la lista y la convierte en una cadena de caracteres utilizando string-join.
; Finalmente, utiliza string-append para agregar una barra diagonal al final de la ruta y devuelve la ruta actualizada a la ruta anterior (subiendo un nivel).
(define cdpunto
  (lambda (system string)
    (if(not(esraiz? system string))
    (string-append(string-join (reverse(cdr(reverse(string-split string "/")))) "/")"/")
    string)))



;Nombre de la función: buscarformat
;Dominio: sistema X letra de unidad (cadena de caracteres) X nombre de carpeta (cadena de caracteres)
;Recorrido: lista de unidades de disco con la unidad correspondiente actualizada
;Recursión: recursión de cola
;Descripción: Esta función toma un sistema system, una letra de unidad de disco letra y un nombre de carpeta nombre como argumentos.
; Utiliza la función get-drive-system para obtener la lista de unidades de disco en el sistema y busca la unidad correspondiente a la letra letra.
; Si encuentra la unidad de disco, utiliza cons para agregar una nueva unidad de disco con el nombre nombre y sin contenido a la lista de unidades de disco.
; La función devuelve la lista de unidades de disco con la unidad correspondiente actualizada.
; Utiliza la recursión de cola para buscar la unidad correspondiente.

(define buscarformat
  (lambda (system letra nombre)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            lista
            (if (equal? (string (get-letra-drive (car drives))) (string letra))
                (buscador (cdr drives)
                          (cons (make-drive (get-letra-drive (car drives))
                                            nombre
                                            (get-capacidad-drive (car drives))
                                            '())
                                lista))
                (buscador (cdr drives) (cons (car drives) lista))))))
    (buscador (cadr system) '())))


;Nombre de la función: carpetactual
;Dominio: sistema
;Recorrido: cadena de caracteres que representa el nombre de la carpeta actual
;Descripción: Esta función toma un sistema system como argumento y utiliza get-ruta-system para obtener la ruta actual del sistema.
; Luego, utiliza string-split para dividir la ruta en una lista de cadenas de caracteres separadas por "/".
; Finalmente, utiliza car y reverse para obtener el último elemento de la lista que representa el nombre de la carpeta actual.
; La función devuelve una cadena de caracteres que representa el nombre de la carpeta actual.

(define carpetactual
  (lambda (system)
    (let ((ruta (get-ruta-system system)))
      (car (reverse (string-split  ruta "/"))))))


;Nombre de la función: esactual?
;Dominio: sistema X nombre (cadena de caracteres)
;Recorrido: valor booleano (true/false)
;Descripción: Esta función toma un sistema system y un nombre de carpeta nombre como argumentos.
; Utiliza la función carpetactual para obtener el nombre de la carpeta actual del sistema y compara este nombre con el nombre proporcionado.
; La función devuelve true si el nombre proporcionado coincide con el nombre de la carpeta actual y false en caso contrario.
(define esactual?
  (lambda(system nombre)(equal?(carpetactual system)nombre)))



;Nombre de la función: SyMDrive3
;Dominio: system X filecreado
;Recorrido: lista de drives
;Recursión: Recursión de cola
;Descripción: Esta función toma un sistema system y un archivo filecreado como argumentos.
; Utiliza una función anónima buscador para buscar la letra de unidad correspondiente al archivo en la lista de drives del sistema y actualizar la lista de drives.
; La función utiliza una recursión de cola para buscar la letra de unidad y actualizar la lista de drives.
; Devuelve la lista de drives actualizada con el archivo agregado.
(define SyMDrive3
  (lambda (system filecreado)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            lista
            (if (equal? (string (get-letra-drive (car drives))) (string(car(get-current-drive-system system))))
                (buscador (cdr drives) (append lista (list (set-contenido-drive2 (SyMFolder system filecreado (car drives)) (car drives)))))
                (buscador (cdr drives) (append lista (list (car drives))))))))
    (buscador (cadr system) '())))


;Nombre de la función: SyMFolder
;Dominio: system X filecreado X drive
;Recorrido: lista de carpetas
;Recursión: Recursión de cola
;Descripción: Esta función toma un sistema system, un archivo filecreado y una unidad de disco drive como argumentos.
; Utiliza la función anónima buscar para buscar la carpeta actual en el sistema y actualizar su contenido con el archivo filecreado.
; La función utiliza una recursión de cola para buscar la carpeta actual y actualizar su contenido.
; Devuelve la lista de carpetas actualizada con el archivo filecreado agregado.

(define SyMFolder
  (lambda(system filecreado drive)
    (define buscar
      (lambda(folders lista)
        (if(null? folders)
           lista
           (if(equal? (get-nombre-folder(car folders))(carpetactual system))
              (if(not(member (get-nombre-file filecreado) (map get-nombre-file(get-contenido-folder (car folders)))))
                 (buscar (cdr folders)(append lista(list(set-contenido-folder (car folders) filecreado))))
                 (buscar (cdr folders)(append lista(list(car folders)))))
              (buscar (cdr folders)(append lista(list(car folders))))))))
    (buscar (get-contenido-drive drive) '())))


;Nombre de la función: rdcarpeta
;Dominio: system X nombrecarpeta
;Recorrido: nombre de la carpeta
;Recursión: ninguna
;Descripción: Esta función toma un sistema 'system' y un nombre de carpeta 'nombrecarpeta' como argumentos.
; Verifica si 'nombrecarpeta' es una ruta válida en el sistema.
; Si 'nombrecarpeta' es una ruta válida, devuelve el nombre de la carpeta más interna en la ruta.
; Si 'nombrecarpeta' no es una ruta válida, devuelve 'nombrecarpeta' sin cambios.
(define rdcarpeta
  (lambda (system)
    (lambda (nombrecarpeta)
      (if(ispath? system nombrecarpeta)
         (car(reverse(string-split nombrecarpeta "/")))
         nombrecarpeta))))

; Nombre de la función: SyMDrive4
; Dominio: system
; Recorrido: lista de drives
; Recursión: recursión de cola
; Descripción: Esta función toma un sistema 'system' como argumento y devuelve una lista de drives del sistema. 
; Si un drive está actualmente en uso, devuelve el contenido de la unidad como una lista de elementos 'SyMFolder2'. 
; Si el drive no está en uso, devuelve simplemente el nombre del drive.

(define SyMDrive4
  (lambda (system)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            lista
            (if (equal? (string (get-letra-drive (car drives))) (string(car(get-current-drive-system system))))
                (buscador (cdr drives) (append lista (list (set-contenido-drive2 (SyMFolder2 system (car drives)) (car drives)))))
                (buscador (cdr drives) (append lista (list (car drives))))))))
    (buscador (cadr system) '())))

; Nombre de la función: SyMFolder2
; Dominio: system X drive
; Recorrido: lista de folders en el drive
; Recursión: recursión de cola
; Descripción: Esta función toma un sistema 'system' y un drive 'drive' como argumentos. 
;              Devuelve una lista de folders en el drive, excepto el folder actual, que se devuelve como 'null'.
;              La lista de folders se devuelve en orden alfabético. 
;              Si no hay folders en el drive, devuelve una lista vacía.

(define SyMFolder2
  (lambda(system drive)
    (define buscar
      (lambda(folders lista)
        (if(null? folders)
           lista
           (if(equal? (get-nombre-folder(car folders))(carpetactual system))
                 (buscar (cdr folders)(append lista(list(set-contenido-folder2 (car folders) null))))
                 (buscar (cdr folders)(append lista(list(car folders))))))))
    (buscar (get-contenido-drive drive) '())))




; Nombre de la función: SyMDrive5
; Dominio: system X nombreeliminar
; Recorrido: lista de drives
; Recursión: recursión de cola
; Descripción: Esta función toma un sistema 'system' y un nombre de carpeta 'nombreeliminar' como argumentos.
;              Devuelve una lista de drives del sistema.
;              Si un drive está actualmente en uso, elimina la carpeta con el nombre 'nombreeliminar' del contenido de la unidad.
;              Si el drive no está en uso, devuelve simplemente el nombre del drive.
(define SyMDrive5
  (lambda (system nombreeliminar)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            lista
            (if (equal? (string (get-letra-drive (car drives))) (string(car(get-current-drive-system system))))
                (buscador (cdr drives) (append lista (list (set-contenido-drive2 (SyMFolder3 system (car drives) nombreeliminar) (car drives)))))
                (buscador (cdr drives) (append lista (list (car drives))))))))
    (buscador (cadr system) '())))



; Nombre de la función: SyMFolder3
; Dominio: system X drive X nombreeliminar
; Recorrido: lista de folders en el drive
; Recursión: recursión de cola
; Descripción: Esta función toma un sistema 'system', un drive 'drive' y un nombre de carpeta 'nombreeliminar' como argumentos. 
;              Devuelve una lista de folders en el drive, excepto la carpeta con el nombre 'nombreeliminar', que se elimina.
;              La lista de folders se devuelve en orden alfabético. 
;              Si no hay folders en el drive, devuelve una lista vacía.
(define SyMFolder3
  (lambda(system drive nombreeliminar)
    (define buscar
      (lambda(folders lista)
        (if(null? folders)
           lista
           (if(equal? (get-nombre-folder(car folders))nombreeliminar)
                 (buscar (cdr folders)lista)
                 (buscar (cdr folders)(append lista(list(car folders))))))))
    (buscar (get-contenido-drive drive) '())))


; Nombre de la función: SyMDrive6
; Dominio: system X nombreeliminar
; Recorrido: lista de drives
; Recursión: recursión de cola
; Descripción: Esta función toma un sistema 'system' y un nombre de archivo 'nombreeliminar' como argumentos.
;              Devuelve una lista de drives del sistema.
;              Si un drive está actualmente en uso, elimina el archivo con el nombre 'nombreeliminar' del contenido de la unidad.
;              Si el drive no está en uso, devuelve simplemente el nombre del drive.


(define SyMDrive6
  (lambda (system nombreeliminar)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            lista
            (if (equal? (string (get-letra-drive (car drives))) (string(car(get-current-drive-system system))))
                (buscador (cdr drives) (append lista (list (set-contenido-drive2 (SyMFolder4 system (car drives) nombreeliminar) (car drives)))))
                (buscador (cdr drives) (append lista (list (car drives))))))))
    (buscador (cadr system) '())))


; Nombre de la función: SyMFolder4
; Dominio: system X drive X nombreeliminar
; Recorrido: lista de folders en el drive
; Recursión: recursión de cola
; Descripción: Esta función toma un sistema 'system', un drive 'drive' y un nombre de archivo 'nombreeliminar' como argumentos. 
;              Devuelve una lista de folders en el drive, excepto el folder actual, que se devuelve con el archivo con el nombre 'nombreeliminar' eliminado del contenido.
;              La lista de folders se devuelve en orden alfabético. 
;              Si no hay folders en el drive, devuelve una lista vacía.



(define SyMFolder4
  (lambda(system drive nombreeliminar)
    (define buscar
      (lambda(folders lista)
        (if(null? folders)
           lista
           (if(equal? (get-nombre-folder(car folders))(carpetactual system))
                 (buscar (cdr folders)(append lista (list(set-contenido-folder2 (car folders) (SyMFile system (car folders) nombreeliminar)))))
                 (buscar (cdr folders)(append lista(list(car folders))))))))
    (buscar (get-contenido-drive drive) '())))

; Nombre de la función: SyMFile
; Dominio: system X folder X nombreeliminar
; Recorrido: lista de archivos en el folder
; Recursión: recursión de cola
; Descripción: Esta función toma un sistema 'system', un folder 'folder' y un nombre de archivo 'nombreeliminar' como argumentos.
;              Devuelve una lista de archivos en el folder, excepto el archivo con el nombre 'nombreeliminar', que se elimina.
;              La lista de archivos se devuelve en orden alfabético. 
;              Si no hay archivos en el folder, devuelve una lista vacía.


(define SyMFile
  (lambda (system folder nombreeliminar)
    (define buscar2
      (lambda(files lista)
        (if(null? files)
           lista
           (if(equal? (get-nombre-file (car files))nombreeliminar)
              (buscar2 (cdr files)lista)
              (buscar2 (cdr files)(append lista(list(car files))))))))
    (buscar2 (get-contenido-folder folder) '())))


; Nombre de la función: nombrefile
; Dominio: file
; Recorrido: string
; Recursión: ninguna
; Descripción: Esta función toma un nombre de archivo 'file' como argumento.
;              Devuelve el nombre del archivo sin la extensión.

(define nombrefile
  (lambda (file)(car(string-split file "."))))

; Nombre de la función: SyMDrive8
; Dominio: system X nombreeliminar
; Recorrido: lista de drives actualizados en el sistema
; Recursión: recursión de cola
; Descripción: Esta función toma un sistema 'system' y un nombre de carpeta 'nombreeliminar' como argumentos.
;              Recorre todos los drives en el sistema y si el drive actual coincide con el drive en el sistema,
;              llama a la función SyMFolder5 para eliminar la carpeta con el nombre 'nombreeliminar' en el drive.
;              Devuelve una lista de drives actualizados en el sistema.
;              Si no hay drives en el sistema, devuelve una lista vacía.


(define SyMDrive8
  (lambda (system nombreeliminar)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            lista
            (if (equal? (string (get-letra-drive (car drives))) (string(car(get-current-drive-system system))))
                (buscador (cdr drives) (append lista (list (set-contenido-drive2 (SyMFolder5 system (car drives) nombreeliminar) (car drives)))))
                (buscador (cdr drives) (append lista (list (car drives))))))))
    (buscador (cadr system) '())))

; Nombre de la función: SyMFolder5
; Dominio: system X drive X nombreeliminar
; Recorrido: lista de folders actualizados en el drive
; Recursión: recursión de cola
; Descripción: Esta función toma un sistema 'system', un drive 'drive' y un nombre de carpeta 'nombreeliminar' como argumentos.
;              Recorre todos los folders en el drive y si el nombre del folder coincide con 'nombreeliminar',
;              verifica si el folder está vacío antes de eliminarlo. Si no coincide, se mantiene en la lista.
;              Devuelve una lista de folders actualizados en el drive, excluyendo el folder con nombre 'nombreeliminar' si está vacío.
;              Si no hay folders en el drive, devuelve una lista vacía.


(define SyMFolder5;elimina un folder
  (lambda(system drive nombreeliminar)
    (define buscar
      (lambda(folders lista)
        (if(null? folders)
           lista
           (if(equal? (get-nombre-folder(car folders))(string-upcase nombreeliminar))
              (if (contenido? (car folders))
                 (buscar (cdr folders)lista)
                 (buscar (cdr folders)(append lista(list(car folders)))))
              (buscar (cdr folders)(append lista(list(car folders))))))))
    (buscar (get-contenido-drive drive) '())))


; Nombre de la función: esraiz?
; Dominio: system X nombre
; Recorrido: booleano
; Recursión: no aplica
; Descripción: Esta función toma un sistema 'system' y un nombre de carpeta 'nombre' como argumentos.
;              Verifica si el nombre de la carpeta corresponde a una carpeta raíz en el sistema.
;              Devuelve #t si la carpeta es una carpeta raíz, #f en caso contrario.

(define esraiz?
  (lambda (system nombre)
    (if(member (string-upcase(car(string-split (car(reverse(string-split nombre "/"))) ":"))) (map string(map car (get-drive-system system))))
       #t
       #f)))

; Nombre de la función: buscarcopia
; Dominio: system X nombrecopia
; Recorrido: resultado de la función copia, un folder, un archivo o '()
; Recursión: recursión de cola
; Descripción: Esta función toma un sistema 'system' y un nombre 'nombrecopia' como argumentos.
;              Recorre todos los drives en el sistema y si el drive actual coincide con el drive en el sistema,
;              llama a la función copia para buscar el archivo o carpeta con el nombre 'nombrecopia'.
;              Devuelve el resultado de la función copia, que puede ser un folder, un archivo o '()'.
;              Si no hay drives en el sistema, devuelve '().


(define buscarcopia 
  (lambda (system nombrecopia ruta)
    (define buscador
      (lambda (drives nombrecopia)
        (if (null? drives)
            #f
            (if (equal? (string (get-letra-drive (car drives))) (string (car (get-current-drive-system system))))
                (copia system (car drives) nombrecopia ruta)
                (buscador (cdr drives) nombrecopia)))))
    (buscador (cadr system) nombrecopia)))

; Nombre de la función: copia
; Dominio: system X drive X nombrecopia
; Recorrido: resultado de la función buscarfolder2, un folder, un archivo o null
; Recursión: no aplica
; Descripción: Esta función toma un sistema 'system', un drive 'drive' y un nombre 'nombrecopia' como argumentos.
;              Dependiendo de si 'nombrecopia' es un archivo o una carpeta, llama a la función buscarfolder2 con diferentes opciones.
;              Devuelve el resultado de la función buscarfolder2, que puede ser un folder, un archivo o null.

(define copia
  (lambda (system drive nombrecopia ruta)
    (if (equal? (length (string-split nombrecopia ".")) 1)
        (buscarfolder2 system (get-contenido-drive drive) (string-upcase nombrecopia) 1 ruta ) 
        (if (equal? (length (string-split nombrecopia ".")) 2)
            (buscarfolder2 system (get-contenido-drive drive) (string-upcase nombrecopia) 2 ruta)
            null))))

; Nombre de la función: buscarfolder2
; Dominio: system X folders X nombre X opcion
; Recorrido: folder, archivo o null, según la opción
; Recursión: recursión de cola
; Descripción: Esta función toma un sistema 'system', una lista de folders 'folders', un nombre 'nombre' y una opción como argumentos.
;              Si la opción es 1, busca un folder con el nombre 'nombre' y devuelve el folder si se encuentra.
;              Si la opción es 2, busca un archivo con el nombre 'nombre' y devuelve el archivo si se encuentra.
;              Devuelve null si no se encuentra el folder o el archivo.


(define buscarfolder2
  (lambda (system folders nombre opcion ruta)
    (if (equal? opcion 1)
        (if (null? folders)
            #f
            (let ((folder (car folders)))
              (if (equal? (get-nombre-folder folder) nombre)
                  (set-ubicacion-folder folder (string-upcase ruta))
                  (buscarfolder2 system (cdr folders) nombre 1 ruta)))) 
        (if (equal? opcion 2)
            (if (null? folders)
                '()
                (let ((folder (car folders)))
                  (if (equal? (get-nombre-folder folder) (carpetactual system))
                      (buscarfile (get-contenido-folder folder) nombre ruta) 
                      (buscarfolder2 system (cdr folders) nombre 2 ruta)))) 
            null))))

; Nombre de la función: buscarfile
; Dominio: files X nombre
; Recorrido: archivo encontrado o null
; Recursión: recursión de cola
; Descripción: Esta función toma una lista de archivos 'files' y un nombre 'nombre' como argumentos.
;              Busca un archivo con el nombre 'nombre' en la lista de archivos.
;              Devuelve el archivo encontrado o null si no se encuentra el archivo.


(define buscarfile
  (lambda (files nombre ruta)
    (if (null? files)
        #f
        (let ((archivo (car files)))
          (if (equal? (get-nombre-file archivo) nombre)
              archivo
              (buscarfile (cdr files) nombre ruta ))))))

; Nombre de la función: ubicacioncopia
; Dominio: ruta
; Recorrido: letra del drive en mayúsculas
; Recursión: no aplica
; Descripción: Esta función toma una ruta como argumento.
;              Extrae la letra del drive de la ruta y la devuelve en mayúsculas.

 

(define ubicacioncopia
  (lambda (ruta)(string-upcase(car(string-split (car(reverse(string-split ruta "/"))) ":")))))

; Nombre de la función: SyMDrive11
; Dominio: system X ubicacion X nombrecopia X opcion
; Recorrido: lista de drives actualizada
; Recursión: recursión de cola
; Descripción: Esta función toma un sistema 'system', una ubicación 'ubicacion', un nombre 'nombrecopia' y una opción como argumentos.
;              Recorre todos los drives en el sistema y si el drive actual coincide con la ubicación,
;              llama a las funciones SyMDrive9 y SyMFolder6 para copiar el archivo o carpeta según la opción.
;              Devuelve un sistema con la lista de drives actualizados.
;              Si no hay drives en el sistema, devuelve un sistema con una lista vacía de drives.
       

(define SyMDrive11
  (lambda (system ubicacion nombrecopia opcion)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            lista
            (if (equal? (string (get-letra-drive (car drives))) (string-upcase (car (string-split ubicacion ":"))))
                (if (equal? opcion 1)
                    (let ((buscar-copia (buscarcopia system nombrecopia ubicacion)))
                      (if (equal? #f buscar-copia)
                          (buscador (cdr drives)(append lista(list(car drives))))
                          (buscador (cdr drives) (append lista (list (set-contenido-drive buscar-copia (car drives)))))))
                    (buscador (cdr drives) (append lista (list (set-contenido-drive2 (SyMFolder6 system ubicacion nombrecopia (car drives)) (car drives))))))
                (buscador (cdr drives) (append lista (list (car drives))))))))
    (buscador (cadr system) '())))


; Nombre de la función: SyMFolder6
; Dominio: system X direcopia X nombrecopia X drive
; Recorrido: lista de folders actualizados en el drive
; Recursión: recursión de cola
; Descripción: Esta función toma un sistema 'system', un directorio 'direcopia', un nombre 'nombrecopia' y un drive 'drive' como argumentos.
;              Recorre todos los folders en el drive y si el nombre del folder coincide con 'direcopia',
;              llama a la función SyMDrive9 para copiar el archivo o carpeta con el nombre 'nombrecopia' al folder.
;              Devuelve una lista de folders actualizados en el drive.
;              Si no hay folders en el drive, devuelve una lista vacía.


(define SyMFolder6
  (lambda (system direcopia nombrecopia drive)
    (define buscar
      (lambda (folders lista)
        (if (null? folders)
            lista
            (if (equal? (get-nombre-folder (car folders)) (ubicacioncopia direcopia))
                (if (equal? #f (buscarcopia system nombrecopia direcopia)) 
                    (buscar (cdr folders) (append lista (list (car folders))))
                    (buscar (cdr folders) (append lista (list (set-contenido-folder (car folders) (buscarcopia system nombrecopia direcopia))))))
                (buscar (cdr folders) (append lista (list (car folders))))))))
    (buscar (get-contenido-drive drive) '())))


; Nombre de la función: del
; Dominio: system X condicion
; Recorrido: contenido del sistema
; Recursión: ninguna
; Descripción: Esta función toma un sistema 'system' como argumento y devuelve una función anónima que toma una condición 'condicion'.
;              Si la ruta del sistema no está vacía, verifica si la condición es "*.*".
;              Si es así, establece el drive actual del sistema en la lista de drives del sistema utilizando 'SyMDrive4'.
;              Si la condición es una carpeta, elimina la carpeta utilizando 'SyMDrive5'.
;              Si la condición es un archivo, elimina el archivo utilizando 'SyMDrive6'.
;              Si la ruta del sistema está vacía, devuelve el sistema sin cambios.

(define del2
  (lambda (system condicion)
      (if(not (null? (get-ruta-system system)))
         (if(equal? "*.*" condicion)
            (if(esraiz? system (get-ruta-system system))
               (set-drive-system system (delcontenidodrive system))
               (set-drive-system system (SyMDrive4 system)))
            (if(equal? (length (string-split condicion "."))1)
               (set-drive-system2 system (SyMDrive5 system (string-upcase condicion)));significa que es una carpeta ,elimino carpeta
               (if(equal? (length(string-split condicion "."))2)
                  (set-drive-system system (SyMDrive6 system (string-upcase condicion)));significa que es un file, elimino file
                  system)))
         system)))


; Nombre de la función: delcontenidodrive
; Dominio: system
; Recorrido: lista de drives actualizada
; Recursión: recursion de cola
; Descripción: Elimina el contenido del drive actual en el sistema 'system' y devuelve la lista de drives actualizada.

 (define delcontenidodrive
  (lambda (system)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            lista
            (if (equal? (string (get-letra-drive (car drives))) (string(car(get-current-drive-system system))))
                (buscador (cdr drives) (append lista (list (set-contenido-drive2 null (car drives)))))
                (buscador (cdr drives) (append lista (list (car drives))))))))
    (buscador (cadr system) '())))




; Nombre de la función: buscardriverename
; Dominio: system, nombrefolder, nuevonombre, opcion
; Recorrido: lista de drives actualizada
; Recursión: recursion de cola
; Descripción: Busca y renombra una carpeta o archivo en el sistema 'system', dado el nombre actual 'nombrefolder', el nuevo nombre 'nuevonombre' y la opción 'opcion'.
;              La función auxiliar 'buscador' recorre la lista de drives y compara la letra del drive con la letra del drive actual del sistema.
;              Si las letras coinciden, se crea una nueva lista con el contenido del drive actualizado, utilizando las funciones 'buscarfolderrename1' o 'buscarfolderrename2'.
;              La función 'buscador' se llama recursivamente hasta que todos los drives hayan sido procesados.
;              Finalmente, devuelve la lista de drives actualizada.

(define buscardriverename
  (lambda (system nombrefolder nuevonombre opcion)
    (define buscador
      (lambda (drives lista)
        (if (null? drives)
            lista
            (if (equal? (string (get-letra-drive (car drives))) (string(car(get-current-drive-system system))))
                (if(equal? opcion 1)
                   (buscador (cdr drives) (append lista (list (set-contenido-drive2 (buscarfolderrename1 system (car drives) nombrefolder nuevonombre) (car drives)))));busca en folder y actualiza
                   (buscador (cdr drives) (append lista (list (set-contenido-drive2 (buscarfolderrename2 system (car drives) nombrefolder nuevonombre) (car drives))))));busca en folder y actualiza
                (buscador (cdr drives) (append lista (list (car drives))))))))
    (buscador (cadr system) '())))


; Nombre de la función: buscarfolderrename2
; Dominio: system, drive, nombrefolder, nuevonombre
; Recorrido: lista de carpetas actualizada
; Recursión: recursion de cola
; Descripción: Busca y renombra un archivo dentro de una carpeta específica en el 'drive' dado, según el nombre actual 'nombrefolder' y el nuevo nombre 'nuevonombre'.
(define buscarfolderrename2
  (lambda(system drive nombrefolder nuevonombre)
    (define buscar
      (lambda(folders lista)
        (if(null? folders)
           lista
           (if(equal? (get-nombre-folder(car folders))(carpetactual system))              
               (buscar (cdr folders)(append lista (list(set-contenido-folder2 (car folders) (buscarfilerename system (car folders) nombrefolder nuevonombre)))))
              (buscar (cdr folders)(append lista(list(car folders))))))))
    (buscar (get-contenido-drive drive) '())))

; Nombre de la función: buscarfolderrename1
; Dominio: system, drive, nombrefolder, nuevonombre
; Recorrido: lista de carpetas actualizada
; Recursión: recursion de cola
; Descripción: Busca y renombra una carpeta en el 'drive' dado, según el nombre actual 'nombrefolder' y el nuevo nombre 'nuevonombre'.

(define buscarfolderrename1
  (lambda(system drive nombrefolder nuevonombre)
    (define buscar
      (lambda(folders lista)
        (if(not(member (string-upcase nuevonombre) (map car folders)))
           (if(null? folders)
              lista
              (if(equal? (get-nombre-folder(car folders))(string-upcase nombrefolder))
                 (buscar (cdr folders)(append lista (list(set-nombre-folder (car folders) (string-upcase nuevonombre)))))               
                 (buscar (cdr folders)(append lista(list(car folders))))))
           folders)))
    (buscar (get-contenido-drive drive) '())))

; Nombre de la función: buscarfilerename
; Dominio: system, folder, nombrefile, nuevonombre
; Recorrido: lista de archivos actualizada
; Recursión: recursion de cola
; Descripción: Busca y renombra un archivo en la 'folder' dada, según el nombre actual 'nombrefile' y el nuevo nombre 'nuevonombre'.
(define buscarfilerename 
  (lambda (system folder nombrefile nuevonombre)
    (define buscar2
      (lambda(files lista)
        (if(not(member nuevonombre (map car files)))
           (if(null? files)
              lista
              (if(equal? (get-nombre-file (car files))(string-upcase nombrefile))           
                 (buscar2 (cdr files)(append lista(list(set-nombre-file (car files) nuevonombre))))
                 (buscar2 (cdr files)(append lista(list(car files))))))
           files)))
    (buscar2 (get-contenido-folder folder) '())))



; Nombre de la función: alistaractual
; Dominio: system
; Recorrido: lista de elementos en el directorio actual
; Recursión: No aplica
; Descripción: Esta función toma un sistema como argumento y devuelve la lista de elementos (carpetas y archivos) en el directorio actual del sistema.


(define alistaractual
  (lambda (system)
    (if(esraiz? system (get-ruta-system system))
            (buscardrivelistar system 1)
            (buscardrivelistar system 2))))


; Nombre de la función: buscardrivelistar
; Dominio: system X opcion (entero)
; Recorrido: cadena de caracteres o lista de elementos
; Recursión: recursion de cola
; Descripción: Esta función toma un sistema y una opción como argumentos. Busca el drive en el sistema que coincide con el drive actual
;y devuelve la lista de carpetas (opción 1) o la lista de archivos (opción 2) en el directorio actual.


(define buscardrivelistar
  (lambda (system opcion)
    (define buscador
      (lambda (drives)
        (if (null? drives)
            system
            (if (equal? (string (get-letra-drive (car drives))) (string(car(get-current-drive-system system))))
                   (listarfolders system (car drives) opcion)
                (buscador (cdr drives))))))
    (buscador (cadr system))))

; Nombre de la función: listarfolders
; Dominio: system X drive X opcion (entero)
; Recorrido: string con nombres a listar
; Recursión: recursion de cola
; Descripción: Esta función toma un sistema, un drive y una opción como argumentos. Devuelve una cadena de caracteres que representa
;los nombres de las carpetas en el directorio actual del sistema si la opción es 1, o busca y lista los archivos en el directorio actual si la opción es 2.


(define listarfolders
  (lambda(system drive opcion)
    (define buscar
      (lambda(folders lista)
           (if(null? folders)
              (if(equal? opcion 1)
                 lista
                 (buscarfolderlistar system drive lista));aqui llamo a buscarfolder ubi actual que luego llama a listar file
              (if(equal? (get-ruta-system system)(get-ubicacion-folder(car folders)))
                 (buscar (cdr folders)(string-append lista "\n" (get-nombre-folder (car folders))))
                 (buscar (cdr folders) lista)))))              
    (buscar (get-contenido-drive drive) "")))

; Nombre de la función: buscarfolderlistar
; Dominio: system X drive X listacompleta (cadena de caracteres)
; Recorrido: String con nombres a listar
; Recursión: recursion de cola
; Descripción: Esta función toma un sistema, un drive y una cadena de caracteres listacompleta como argumentos.
;Busca la carpeta en el drive que coincide con el directorio actual del sistema y devuelve la lista de archivos en esa carpeta, concatenada a listacompleta.


(define buscarfolderlistar
  (lambda (system drive listacompleta)
    (define buscar
      (lambda (folders)
        (if (null? folders)
            listacompleta
            (let ((current-folder (car folders)))
              (if (and (equal? (get-nombre-folder current-folder) (carpetactual system))
                       (not (equal? (get-ruta-system system) (get-ubicacion-folder current-folder))))
                  (buscarfilelistar system current-folder listacompleta)
                  (buscar (cdr folders)))))))
    (buscar (get-contenido-drive drive))))


; Nombre de la función: buscarfilelistar
; Dominio: system X folder X listacompleta (cadena de caracteres)
; Recorrido: String con nombres de folders a listar
; Recursión: recursion de cola
; Descripción: Esta función toma un sistema, una carpeta y una cadena de caracteres listacompleta como argumentos.
;Devuelve una cadena de caracteres que representa los nombres de los archivos en la carpeta dada, concatenada a listacompleta.


(define buscarfilelistar 
  (lambda (system folder listacompleta)
    (define buscar2
      (lambda(files lista)
        (if(null? files)
           (string-append lista listacompleta)          
           (buscar2 (cdr files)(string-append lista "\n" (get-nombre-file (car files)))))))
    (buscar2 (get-contenido-folder folder) "")))

; Nombre de la función: buscardrivelistar2
; Dominio: system X opcion (entero)
; Recorrido: String con nombre de folders a listar o lista de elementos
; Recursión: recursion de cola
; Descripción: Esta función toma un sistema y una opción como argumentos. Busca el drive en el sistema que coincide con el drive actual
;y devuelve la lista de carpetas (opción 1) o la lista de archivos (opción 2) en el directorio actual.


(define buscardrivelistar2
  (lambda (system opcion)
    (define buscador
      (lambda (drives)
        (if (null? drives)
            system
            (if (equal? (string (get-letra-drive (car drives))) (string(car(get-current-drive-system system))))
                   (listarfolders system (car drives) opcion)
                (buscador (cdr drives))))))
    (buscador (cadr system))))


; Nombre de la función: listarfolders2
; Dominio: system X drive X opcion (entero)
; Recorrido: String con folders a listar
; Recursión: recursion de cola
; Descripción: Esta función toma un sistema, un drive y una opción como argumentos. Devuelve una cadena de caracteres que representa
;los nombres de las carpetas en el directorio actual del sistema si la opción es 1, o busca y lista los archivos en el directorio actual si la opción es 2.

(define listarfolders2
  (lambda(system drive opcion)
    (define buscar
      (lambda(folders lista)
           (if(null? folders)
              (if(equal? opcion 1)
                 lista
                 (buscarfolderlistar system drive lista));aqui llamo a buscarfolder ubi actual que luego llama a listar file
              (if(equal? (get-ruta-system system)(get-ubicacion-folder(car folders)))
                 (buscar (cdr folders)(string-append lista "\n" (get-nombre-folder (car folders))))
                 (buscar (cdr folders) lista)))))              
    (buscar (get-contenido-drive drive) "")))

; Nombre de la función: listarfolders3
; Dominio: system X drive
; Recorrido: lista de carpetas
; Recursión: recursion de cola
; Descripción: Esta función toma un sistema y un drive como argumentos. Devuelve una lista de carpetas que tienen la misma ubicación que la ruta del sistema actual.


(define listarfolders3
  (lambda(system drive)
    (define buscar
      (lambda(folders lista)
           (if(null? folders)
              lista
              (if(equal? (get-ruta-system system)(get-ubicacion-folder(car folders)))
                 (buscar (cdr folders)(append lista (car folders)))
                 (buscar (cdr folders) lista)))))              
    (buscar (get-contenido-drive drive) '())))

  
  