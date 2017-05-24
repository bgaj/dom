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
//= require uikit/core/modal.js
//= require jquery_ujs


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
    ee_menu_order: function () {
        /* pokazywanie/ukrywanie menu przy przewijaniu */
        $navbar = jQuery('.header-menu');
        $navbar_height = $navbar.height();
        $header_height = jQuery('#header').height();
        $window = jQuery(window);

        // ustawianie minimalnej wysokości dla całego header
        jQuery('#header').css('min-height', $header_height);

        $window.scroll(function(event){
            if ($window.scrollTop() > $header_height+20) {
                if (!$navbar.hasClass('float-menu') ) {
                    $navbar.addClass('float-menu');
                }
                if(detectScrollDirection() == 'u'){
                    if ($navbar.hasClass('float-menu') && !$navbar.hasClass('rollIn')) {
                        $navbar.addClass('rollIn');
                    }
                } else {
                    if ($navbar.hasClass('rollIn')) {
                        $navbar.removeClass('rollIn');
                    }
                }
            } else if ($navbar.hasClass('float-menu')){
                $navbar.removeClass('float-menu');
                $navbar.removeClass('rollIn');
            }
        });
        /* !pokazywanie/ukrywanie menu przy przewijaniu */
    }
};

$(document).ready(function(){
    Eengine2017.ready();
    // Eengine2017.ee_menu_order();



});


$(window).load(function() {
    Eengine2017.load();
});