// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require sweetalert
//= require sweetalert2
//= require sweet-alert2-rails
//= require bootstrap-sprockets
//= require filterrific/filterrific-jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-datepicker
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require lightbox-bootstrap
//= require_tree .

window.sweetAlertConfirmConfig = {
  title: '¿Está seguro?',
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#d33',
  confirmButtonText: 'Si, eliminar registro',
  cancelButtonText: 'Cancelar'
};
