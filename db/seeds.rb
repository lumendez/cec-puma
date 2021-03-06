Centro.create!([
  {nombre: "Ingeniero Eugenio Méndez Docurro", direccion: "Allende 38, entrada por Belisario Domínguez 22, Col. Centro, Delegación Cuauhtémoc", telefono: "57296000", extension: "", lugar: "Ciudad de México"}
])
ClaveCatalogo.create!([
  {nombre: "0853/0854"},
  {nombre: "0857/0858"},
  {nombre: "0855/0856"},
  {nombre: "0861/0863"}
])
CuotaCurso.create!([
  {nombre: "$510.00/$940.00", descripcion: "Cuota para básico"},
  {nombre: "$510.00/$987.50", descripcion: "Cuota para intermedio"},
  {nombre: "$510.00/$1018.50", descripcion: "Cuota para avanzado"},
  {nombre: "$1163.50/$1428.50", descripcion: "Cuota de certificación"}
])
CursoNombre.create!([
  {nombre: "Intensivo A"},
  {nombre: "Intensivo B"},
  {nombre: "Intensivo C"},
  {nombre: "Intensivo D"},
  {nombre: "Intensivo E"},
  {nombre: "Intensivo F"},
  {nombre: "Intensivo G"},
  {nombre: "Intensivo H"},
  {nombre: "Intensivo I"},
  {nombre: "Sabatino 1"},
  {nombre: "Sabatino 2"},
  {nombre: "Sabatino 3"},
  {nombre: "Sabatino 4"},
  {nombre: "Sabatino 5"},
  {nombre: "Verano 1"},
  {nombre: "Verano 2"},
  {nombre: "Verano 3"},
  {nombre: "Certificación del Nivel de Dominio B2"},
  {nombre: "Certificación de Metodología TKT"}
])
DatosBanco.create!([
  {nombre: "BBVA Bancomer", cuenta: "01 6835 8273", referencia: "", titular: "Fondo de Investigación Científica y Desarrollo Tecnológico del IPN"}
])
Estado.create!([
  {nombre: "Pendiente"},
  {nombre: "Abierto"},
  {nombre: "Cerrado"}
])
Genero.create!([
  {genero: "Femenino"},
  {genero: "Masculino"}
])
Horario.create!([
  {hora: "07:00-09:00"},
  {hora: "09:00-11:00"},
  {hora: "11:00-13:00"},
  {hora: "12:00-14:00"},
  {hora: "13:00-15:00"},
  {hora: "15:00-17:00"},
  {hora: "17:00-19:00"},
  {hora: "19:00-21:00"},
  {hora: "09:00-14:00"},
  {hora: "14:00-19:00"}
])
Idioma.create!([
  {idioma: "Inglés"},
  {idioma: "Francés"},
  {idioma: "Italiano"}
])
ModalidadOfertum.create!([
  {nombre: "Presencial"},
  {nombre: "A distancia"}
])
NivelNombre.create!([
  {nivel: "Básico 1"},
  {nivel: "Básico 2"},
  {nivel: "Básico 3"},
  {nivel: "Básico 4"},
  {nivel: "Básico 5"},
  {nivel: "Intermedio 1"},
  {nivel: "Intermedio 2"},
  {nivel: "Intermedio 3"},
  {nivel: "Intermedio 4"},
  {nivel: "Intermedio 5"},
  {nivel: "Avanzado 1"},
  {nivel: "Avanzado 2"},
  {nivel: "Avanzado 3"},
  {nivel: "Avanzado 4"},
  {nivel: "Avanzado 5"},
  {nivel: "Certificación de Metodología TKT 1"},
  {nivel: "Certificación de Metodología TKT 2"},
  {nivel: "Certificación de Metodología TKT 3"},
  {nivel: "Certificación del Nivel de Dominio B2.1"},
  {nivel: "Certificación del Nivel de Dominio B2.2"},
  {nivel: "Certificación del Nivel de Dominio B2.3"}
])
NumeroRegistro.create!([
  {nombre: "DFLE-CELEX02I-Act-15"}
])
Procedencium.create!([
  {procedencia: "Instituto Politécnico Nacional"},
  {procedencia: "Otro"},
  {procedencia: "Prestación"}
])
Proyecto.create!([
  {nombre: "Cursos Extracurriculares de Lenguas Extranjeras"}
])
Role.create!([
  {nombre: "Administrador", descripcion: "Administra el sistema"},
  {nombre: "Invitado", descripcion: "Alumno, puede enviar registros de inscripción"},
  {nombre: "Profesor", descripcion: "Tiene las funciones de instructor"},
  {nombre: "Control escolar", descripcion: "Valida inscripciones"},
  {nombre: "Coordinación CELEX", descripcion: "Encargado de la coordinación del CELEX"},
  {nombre: "Jefe Educación Continua", descripcion: "Jefe del Departamento de Educación Continua"},
  {nombre: "Cursos control", descripcion: "Control de los cursos del CEC"},
  {nombre: "Director", descripcion: "Director de Centro de Educación Continua"},
  {nombre: "Subdirector", descripcion: "Subdirector de Servicios Educativos"},
  {nombre: "Diplomados control", descripcion: "Se hace cargo de administrar los diplomados"},
  {nombre: "Instructor diplomados", descripcion: "Se encarga de evaluar los diferentes módulos de los diplomados"}
])
SeccionNombre.create!([
  {nombre: "A"},
  {nombre: "B"},
  {nombre: ""},
  {nombre: "C"},
  {nombre: "D"},
  {nombre: "E"},
  {nombre: "F"},
  {nombre: "G"},
  {nombre: "H"},
  {nombre: "I"},
  {nombre: "J"},
  {nombre: "K"},
  {nombre: "L"},
  {nombre: "M"},
  {nombre: "N"},
  {nombre: "O"},
  {nombre: "P"},
  {nombre: "Q"},
  {nombre: "R"},
  {nombre: "S"},
  {nombre: "T"},
  {nombre: "U"},
  {nombre: "V"},
  {nombre: "W"},
  {nombre: "X"},
  {nombre: "Y"},
  {nombre: "Z"}
])
TipoOfertum.create!([
  {nombre: "Curso"}
])
