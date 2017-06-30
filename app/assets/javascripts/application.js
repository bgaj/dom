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
//= require uikit/core/dropdown.js
//= require uikit/components/datepicker.js
//= require uikit/components/form-select.js
//= require uikit/core/modal.js
//= require jquery_ujs
//= require selectize
//= require jquery.dataTables.min.js
//= require dataTables.uikit.min.js
//= require cocoon


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
        $('.f-selectize-input').selectize();
        $('.f-selectize-input').removeClass('f-selectize-input');
    },
    toogle_menu: function () {
        $('#menu_toggle').on('click', function () {
           $('.whole-page').toggleClass('close');
        });

    },
    changeCheckboxes: function () {
         var form = $('#'+$('.f-check-all').data('form'));
        $('.f-check-all').on('change',function () {
            if ($(this)[0].checked){
               form.find('.f-to-check').prop('checked', true);
           }
           else{
                form.find('.f-to-check').prop('checked', false);
            }
        });
    },
    removeTempThrowForm: function () {
        $('.f-temp-throw').on('click', function(){
           var target = $(this).data('target');
           $('#temp_throw-'+target).remove();
        });
    },
    templateLoad: function () {
        $('#template').on('change', function(){
            window.location.href = $(this).val();
        });
        $('#template_edit').on('change', function(){
            window.location.href = $(this).val();
        })
    }
};

$(document).ready(function(){
    Eengine2017.ready();
    Eengine2017.selectizeInit();
    Eengine2017.toogle_menu();
    Eengine2017.templateLoad();
    Eengine2017.removeTempThrowForm();
    Eengine2017.changeCheckboxes();
    $('#dataTable').DataTable( {
        "aaSorting": [],
        "language": {
            "processing":     "Przetwarzanie...",
            "search":         "Szukaj:",
            "lengthMenu":     "Pokaż _MENU_ pozycji",
            "info":           "Pozycje od _START_ do _END_ z _TOTAL_ łącznie",
            "infoEmpty":      "Pozycji 0 z 0 dostępnych",
            "infoFiltered":   "(filtrowanie spośród _MAX_ dostępnych pozycji)",
            "infoPostFix":    "",
            "loadingRecords": "Wczytywanie...",
            "zeroRecords":    "Nie znaleziono pasujących pozycji",
            "emptyTable":     "Brak danych",
            "paginate": {
                "first":      "Pierwsza",
                "previous":   "Poprzednia",
                "next":       "Następna",
                "last":       "Ostatnia"
            },
            "aria": {
                "sortAscending": ": aktywuj, by posortować kolumnę rosnąco",
                "sortDescending": ": aktywuj, by posortować kolumnę malejąco"
            }
        },
        "dom": '<"uk-flex uk-flex-wrap uk-flex-space-between uk-margin-bottom"lf>rt<"uk-flex uk-flex-wrap uk-flex-space-between"ip>'
    } );

    $('#throws')
        .on('cocoon:after-insert', function(elem) {
            $('#'+elem.currentTarget.getElementsByTagName('select')[0].id).selectize()
        })
    $('#forage_elements')
        .on('cocoon:after-insert', function(elem) {
            $('#'+elem.currentTarget.getElementsByTagName('select')[0].id).selectize()
        })
    $('#temp_forage_elements')
        .on('cocoon:after-insert', function(elem) {
            $('#'+elem.currentTarget.getElementsByTagName('select')[0].id).selectize()
        })

});


$(window).load(function() {
    Eengine2017.load();
});