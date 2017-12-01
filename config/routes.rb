Rails.application.routes.draw do

  resources :buscar_cartas do
    collection do
      get :carta
    end
  end

  resources :grupos_unitarios
  resources :unitarios do
    collection do
      get 'asignar_calificaciones'
      patch 'actualizar_asignar_calificaciones'
      get 'editar_datos'
      patch 'actualizar_editar_datos'
      get 'asignar_grupos_nms_s'
      get 'grupos_nms_s'
      patch 'actualizar_grupos_nms_s'
      get 'seleccionar_credenciales_media'
      get '/credenciales_media/:id', to: 'unitarios#credenciales_media', as: 'credenciales_media'
      get '/carta_compromiso/:id', to: 'unitarios#carta_compromiso', as: 'carta_compromiso'
      get 'reporte_dems'
    end
  end
  resources :anexos_unicos_examen do
    collection do
      get 'index'
      get 'imprimir_anexo_unico'
    end
  end
  resources :seccion_nombres
  resources :anexos_unicos do
    collection do
      get 'index'
      get 'imprimir_anexo_unico'
    end
  end
  resources :it_inscripcion_registros do
    collection do
      delete 'destroy_multiple'
      post 'habilitar_multiples_constancias'
      patch 'actualizar_multiples_constancias'
      get 'ver_constancias'
      get 'constancia/:id', to: 'inscripcion_registros#constancia',  as: 'constancia'
      post 'imprimir'
      post 'asignar_calificaciones'
      patch 'actualizar_asignar_calificaciones'
      get 'reporte_curso'
      get 'reporte_dec'
      post 'editar_datos'
      patch 'actualizar_editar_datos'
    end
  end
  resources :fr_inscripcion_registros do
    collection do
      delete 'destroy_multiple'
      post 'habilitar_multiples_constancias'
      patch 'actualizar_multiples_constancias'
      get 'ver_constancias'
      get 'constancia/:id', to: 'inscripcion_registros#constancia',  as: 'constancia'
      post 'imprimir'
      post 'asignar_calificaciones'
      patch 'actualizar_asignar_calificaciones'
      get 'reporte_curso'
      get 'reporte_dec'
      post 'editar_datos'
      patch 'actualizar_editar_datos'
    end
  end
  resources :curriculums
  resources :registro_cursos
  resources :examen_colocacion_idiomas
  resources :constancia
  resources :historial_carta
  resources :grupo_datos
  resources :datos_bancos
  resources :numero_registros
  resources :proyectos
  resources :clave_catalogos
  resources :cuota_cursos
  resources :modalidad_oferta
  resources :tipo_oferta
  resources :centros
  resources :materia
  resources :lugar_nombres
  devise_for :users, :controllers => { registrations: 'registrations' }
  scope "/admin" do
    resources :users
  end
  resources :roles
  resources :users do
    collection do
      get 'instructores'
      get 'historiales_ingles'
      get 'historial_ingles/:id', to: 'users#historial_ingles', as: 'historial_ingles'
      get 'anexos_unicos/:id', to: 'users#anexos_unicos', as: 'anexos_unicos'
      get 'conclusion_eventos', to: 'users#conclusion_eventos', as: 'conclusion_eventos'
      get 'datos_anexo_unico'
      get 'generar_anexo_unico'
      get 'historial_academico_ingles/:id', to: 'users#historial_academico_ingles', as: 'historial_academico_ingles'
    end
  end
  resources :estados
  resources :grupos do
    collection do
      post 'edit_multiple'
      patch 'update_multiple'
      get 'crear_constancias/:id', to: 'grupos#crear_constancias',  as: 'crear_constancias'
      get 'calificaciones/:id', to: 'grupos#calificaciones', as: 'calificaciones'
      get 'apertura/:id', to: 'grupos#apertura', as: 'apertura'
      get 'lista_asistencia/:id', to: 'grupos#lista_asistencia', as: 'lista_asistencia'
      get 'supervisar/:id', to: 'grupos#supervisar', as: 'supervisar'
    end
  end
  #resources :profesor_nombres
  resources :generos
  resources :curso_nombres
  resources :calendarios
  resources :procedencia
  resources :cuota
  resources :nivel_nombres
  resources :idiomas
  resources :horarios
  resources :inscripcion_registros do
    collection do
      delete 'destroy_multiple'
      post 'habilitar_multiples_constancias'
      patch 'actualizar_multiples_constancias'
      get 'ver_constancias'
      get 'constancia/:id', to: 'inscripcion_registros#constancia',  as: 'constancia'
      post 'imprimir'
      post 'asignar_calificaciones'
      patch 'actualizar_asignar_calificaciones'
      get 'reporte_curso'
      get 'reporte_dec'
      post 'editar_datos'
      patch 'actualizar_editar_datos'
      get 'caso_especial'
      post 'guardar_caso_especial'
    end
  end
  resources :panel_alumnos do
    collection do
      get 'facturacion'
      get 'regulaciones'
    end
  end
  resources :panel_profesores do
    collection do
      get 'mis_grupos'
      get 'historial_academico'
    end
  end
  get '/panel_control_escolar/', to: 'panel_control_escolar#index'

  resources :reinscripcion_registros do
    collection do
      get :boleta
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #devise_scope :user do
    #root to: "devise/sessions#new"
  #end
  root to: "inicio#index"
end
