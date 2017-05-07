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
//= require uikit/uikit
//= require uikit/core/offcanvas.js
//= require uikit/components/grid.min
//= require uikit/components/sticky.min
//= require uikit/components/notify.min
//= require uikit/components/accordion.js
//= require jquery_ujs
//= require selectize


var AdminPZU2017 = {
    app: this,

    init: function () {},

    ready: function () {
    },

    load: function () {},

    selectizeInit: function(){
        $('.f-selectize-input').selectize({

        });
    }
};

$(document).ready(function(){
    AdminPZU2017.ready();
    AdminPZU2017.selectizeInit();

    $('.f-subsection-toggle').on('click', function(){
        $(this).parent().find('.f-campaigns').toggle('500');
    });
});


$(window).load(function() {
    AdminPZU2017.load();
});
