class Ability

  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
        #can :manage, InscripcionRegistro
      #elsif user.invitado?
        #can :create, InscripcionRegistro
        #can :update, InscripcionRegistro
        #can :subir_comprobante, InscripcionRegistro do |inscripcion_registro|
          #inscripcion_registro.try(:imagen)
        #end
        can :habilitar_constancia, InscripcionRegistro do |inscripcion_registro|
          habilitar_constancia.try(:habilitar_constancia) == false || habilitar_constancia.try(:habilitar_constancia) == true
        end
      elsif user.jefe_cec?
        can :manage, :all
      elsif user.jefe_ec?
        can :manage, :all
      elsif user.invitado?
        #can :read, InscripcionRegistro
        can :create, InscripcionRegistro
        can :show, InscripcionRegistro
        #can :update, InscripcionRegistro do |inscripcion_registro|
          #inscripcion_registro.try(:user) == user
        #end
        can :create, FrInscripcionRegistro
        can :show, FrInscripcionRegistro
        can :update, FrInscripcionRegistro do |fr_inscripcion_registro|
          fr_inscripcion_registro.try(:user) == user
        end
        can :create, ItInscripcionRegistro
        can :show, ItInscripcionRegistro
        can :update, ItInscripcionRegistro do |it_inscripcion_registro|
          it_inscripcion_registro.try(:user) == user
        end
        #can :read, ExamenColocacionIdioma
        can :create, ExamenColocacionIdioma
        can :update, ExamenColocacionIdioma do |examen_colocacion_idioma|
          examen_colocacion_idioma.try(:user) == user
        end
        can :show, ExamenColocacionIdioma
        can :subir_comprobante, ExamenColocacionIdioma
        can :manage, :panel_alumnos
      elsif user.control_cec?
        can :read, Calendario
        can :create, Calendario
        can :update, Calendario
        can :destroy, Calendario
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
        #
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
        #
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
        can :read, User
        can :instructores, User
        can :historiales_ingles, User
        can :historial_ingles, User
        can :destroy, User
        can :update, User
        can :manage, :anexos_unicos
      elsif user.profesor?
        #can :read, InscripcionRegistro
        can :update, InscripcionRegistro
        can :evaluacion_media, InscripcionRegistro
        can :evaluacion_final, InscripcionRegistro
        can :show, Grupo
        can :asignar_calificaciones, Grupo
        can :lista_asistencia, Grupo
        can :manage, :panel_profesores
        can :asignar_calificaciones, InscripcionRegistro
        can :actualizar_asignar_calificaciones, InscripcionRegistro
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
        can :read, ClaveCatalogo
        can :create, ClaveCatalogo
        can :update, ClaveCatalogo
        can :destroy, ClaveCatalogo
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
        can :read, NumeroRegistro
        can :create, NumeroRegistro
        can :update, NumeroRegistro
        can :destroy, NumeroRegistro
        can :read, Procedencium
        can :create, Procedencium
        can :update, Procedencium
        can :destroy, Procedencium
        can :read, Proyecto
        can :create, Proyecto
        can :update, Proyecto
        can :destroy, Proyecto
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
