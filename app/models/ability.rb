class Ability

  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
        can :habilitar_constancia, InscripcionRegistro do |inscripcion_registro|
          habilitar_constancia.try(:habilitar_constancia) == false || habilitar_constancia.try(:habilitar_constancia) == true
        end
      # Privilegios para el jefe del centro de educación continua
      elsif user.jefe_cec?
        can :manage, :all
      # Privilegios para el jefe de educación continua
      elsif user.jefe_ec?
        can :manage, :all
      # Privilegios para los usuarios del CELEX
      elsif user.invitado?
        #can :read, InscripcionRegistro
        can :create, InscripcionRegistro
        can :show, InscripcionRegistro
        can :certificacion, InscripcionRegistro
        can :talon, InscripcionRegistro
        can :create, FrInscripcionRegistro
        can :show, FrInscripcionRegistro
        can :update, FrInscripcionRegistro do |fr_inscripcion_registro|
          fr_inscripcion_registro.try(:user) == user
        end
        can :talon, FrInscripcionRegistro
        can :create, ItInscripcionRegistro
        can :show, ItInscripcionRegistro
        can :update, ItInscripcionRegistro do |it_inscripcion_registro|
          it_inscripcion_registro.try(:user) == user
        end
        can :talon, ItInscripcionRegistro
        #can :read, ExamenColocacionIdioma
        can :create, ExamenColocacionIdioma
        can :update, ExamenColocacionIdioma do |examen_colocacion_idioma|
          examen_colocacion_idioma.try(:user) == user
        end
        can :show, ExamenColocacionIdioma
        can :subir_comprobante, ExamenColocacionIdioma
        can :manage, :panel_alumnos
      elsif user.control_ec?
        can :validar_documentos, Unitario
        can :habilitar_constancia, Unitario
        can :read, Unitario
        can :update, Unitario
        can :read, GruposUnitario
        can :create, GruposUnitario
        can :update, GruposUnitario
        can :grupo_excel, GruposUnitario
      elsif user.control_dp_ec?
        can :validar_documentos, InscripcionDiplomado
        can :habilitar_constancia, InscripcionDiplomado
        can :read, InscripcionDiplomado
        can :update, InscripcionDiplomado
        can :read, GruposDiplomado
        can :create, GruposDiplomado
        can :update, GruposDiplomado
      elsif user.control_cec?
        can :read, Calendario
        can :create, Calendario
        can :update, Calendario
        can :destroy, Calendario
        can :read, ExamenColocacionIdioma
        can :create, ExamenColocacionIdioma
        can :update, ExamenColocacionIdioma
        can :destroy, ExamenColocacionIdioma
        can :asignar_nivel, ExamenColocacionIdioma
        can :read, Grupo
        can :create, Grupo
        can :apertura, Grupo
        can :edit_multiple, Grupo
        can :update_multiple, Grupo
        can :apertura, Grupo
        can :edit_multiple, Grupo
        can :update_multiple, Grupo
        can :update, Grupo
        can :destroy, Grupo
        can :read, InscripcionRegistro
        can :create, InscripcionRegistro
        can :update, InscripcionRegistro
        can :control_escolar, InscripcionRegistro
        can :destroy, InscripcionRegistro
        can :habilitar_historial_academico, InscripcionRegistro
        can :habilitar_contancia, InscripcionRegistro
        can :reporte_curso, InscripcionRegistro
        can :reporte_dec, InscripcionRegistro
        can :ver_constancias, InscripcionRegistro
        can :constancia, InscripcionRegistro
        can :imprimir, InscripcionRegistro
        can :editar_datos, InscripcionRegistro
        can :actualizar_editar_datos, InscripcionRegistro
        can :caso_especial, InscripcionRegistro
        can :guardar_caso_especial, InscripcionRegistro
        can :habilitar_tkt, InscripcionRegistro
        can :habilitar_b2, InscripcionRegistro
        can :ver_constancias_tkt, InscripcionRegistro
        can :constancia_tkt, InscripcionRegistro
        can :talon, InscripcionRegistro
        # Privilegios para Francés
        can :read, FrInscripcionRegistro
        can :create, FrInscripcionRegistro
        can :update, FrInscripcionRegistro
        can :control_escolar, FrInscripcionRegistro
        can :destroy, FrInscripcionRegistro
        can :habilitar_historial_academico, FrInscripcionRegistro
        can :habilitar_contancia, FrInscripcionRegistro
        can :reporte_curso, FrInscripcionRegistro
        can :reporte_dec, FrInscripcionRegistro
        can :ver_constancias, FrInscripcionRegistro
        can :constancia, FrInscripcionRegistro
        can :imprimir, FrInscripcionRegistro
        can :editar_datos, FrInscripcionRegistro
        can :actualizar_editar_datos, FrInscripcionRegistro
        can :caso_especial, FrInscripcionRegistro
        can :guardar_caso_especial, FrInscripcionRegistro
        can :talon, FrInscripcionRegistro
        # Privilegios para Italiano
        can :read, ItInscripcionRegistro
        can :create, ItInscripcionRegistro
        can :update, ItInscripcionRegistro
        can :control_escolar, ItInscripcionRegistro
        can :destroy, ItInscripcionRegistro
        can :habilitar_historial_academico, ItInscripcionRegistro
        can :habilitar_contancia, ItInscripcionRegistro
        can :reporte_curso, ItInscripcionRegistro
        can :reporte_dec, ItInscripcionRegistro
        can :ver_constancias, ItInscripcionRegistro
        can :constancia, ItInscripcionRegistro
        can :imprimir, ItInscripcionRegistro
        can :editar_datos, ItInscripcionRegistro
        can :actualizar_editar_datos, ItInscripcionRegistro
        can :caso_especial, ItInscripcionRegistro
        can :guardar_caso_especial, ItInscripcionRegistro
        can :talon, ItInscripcionRegistro
        can :read, User
        can :instructores, User
        can :historiales_ingles, User
        can :historial_ingles, User
        can :historial_academico_ingles, User
        can :historiales_frances, User
        can :historial_frances, User
        can :historial_academico_frances, User
        can :destroy, User
        can :update, User
        can :manage, :anexos_unicos
      # Privilegios para los instructores de los CELEX
      elsif user.profesor?
        #can :read, InscripcionRegistro
        can :show, Grupo
        can :asignar_calificaciones, Grupo
        can :lista_asistencia, Grupo
        can :manage, :panel_profesores
        can :asignar_calificaciones, InscripcionRegistro
        can :actualizar_asignar_calificaciones, InscripcionRegistro
        can :update, InscripcionRegistro
        can :evaluacion_media, InscripcionRegistro
        can :evaluacion_final, InscripcionRegistro
        can :asignar_calificaciones, FrInscripcionRegistro
        can :actualizar_asignar_calificaciones, FrInscripcionRegistro
        can :update, FrInscripcionRegistro
        can :evaluacion_media, FrInscripcionRegistro
        can :evaluacion_final, FrInscripcionRegistro
        can :asignar_calificaciones, ItInscripcionRegistro
        can :actualizar_asignar_calificaciones, ItInscripcionRegistro
        can :update, ItInscripcionRegistro
        can :evaluacion_media, ItInscripcionRegistro
        can :evaluacion_final, ItInscripcionRegistro
      elsif user.insctructor_dp?
        manage :panel_instructor_diplomados
      # Privilegios para el coordinador del CELEX
      elsif user.coordinador_celex?
        can :read, Calendario
        can :create, Calendario
        can :update, Calendario
        can :destroy, Calendario
        can :read, InscripcionRegistro
        can :create, InscripcionRegistro
        can :update, InscripcionRegistro
        can :control_escolar, InscripcionRegistro
        can :destroy, InscripcionRegistro
        can :manage, :panel_control_escolar
        can :read, Grupo
        can :create, Grupo
        can :apertura, Grupo
        can :edit_multiple, Grupo
        can :update_multiple, Grupo
        can :apertura, Grupo
        can :edit_multiple, Grupo
        can :update_multiple, Grupo
        can :habilitar_historial_academico, InscripcionRegistro
        can :habilitar_contancia, InscripcionRegistro
        can :historiales_ingles, User
        can :historial_ingles, User
        can :read, ExamenColocacionIdioma
        can :create, ExamenColocacionIdioma
        can :update, ExamenColocacionIdioma
        can :destroy, ExamenColocacionIdioma
        can :asignar_nivel, ExamenColocacionIdioma
        can :read, CuotaCurso
        can :create, CuotaCurso
        can :update, CuotaCurso
        can :destroy, CuotaCurso
        can :read, CursoNombre
        can :create, CursoNombre
        can :update, CursoNombre
        can :destroy, CursoNombre
        can :read, DatosBanco
        can :create, DatosBanco
        can :update, DatosBanco
        can :destroy, DatosBanco
        can :read, Genero
        can :create, Genero
        can :update, Genero
        can :destroy, Genero
        can :read, Horario
        can :create, Horario
        can :update, Horario
        can :destroy, Horario
        can :read, Idioma
        can :create, Idioma
        can :update, Idioma
        can :destroy, Idioma
        can :read, NivelNombre
        can :create, NivelNombre
        can :update, NivelNombre
        can :destroy, NivelNombre
        can :read, Procedencium
        can :create, Procedencium
        can :update, Procedencium
        can :destroy, Procedencium
        can :habilitar_constancias, Grupo
        can :crear_constancias, Grupo
        can :habilitar_multiples_constancias, InscripcionRegistro
        can :actualizar_multiples_constancias, InscripcionRegistro
        can :ver_constancias, InscripcionRegistro
        can :constancia, InscripcionRegistro
        can :imprimir, InscripcionRegistro
        can :reporte_curso, InscripcionRegistro
        can :reporte_dec, InscripcionRegistro
        can :read, User
        can :instructores, User
      end
  end

end
