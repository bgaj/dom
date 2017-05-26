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
//= require uikit/components/grid.min
//= require uikit/components/form-select.js
//= require uikit/components/sticky.min
//= require uikit/components/tooltip.js
//= require uikit/components/notify.min
//= require uikit/components/notify.min
//= require uikit/components/datepicker.js
//= require uikit/components/form-select.js
//= require uikit/core/modal.js
//= require jquery_ujs
//= require selectize


var lastScrollPos = 0;
var currentScrollPos, direction;

function detectScrollDirection() {
    currentScrollPos = window.pageYOffset;
    if (currentScrollPos > lastScrollPos) {
        direction = "d";
    } else if (currentScrollPos < lastScrollPos) {
        direction = "u";
    } else {
        direction = null;
    }
    lastScrollPos = currentScrollPos;

    return direction;
}
/* sprawdzanie kierunku przewijania */

var Eengine2017 = {
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
    Eengine2017.ready();
    Eengine2017.selectizeInit();



});


$(window).load(function() {
    Eengine2017.load();
});