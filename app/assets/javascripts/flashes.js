//= require pnotify/pnotify.js
//= require pnotify/pnotify.animate.js
//= require pnotify/pnotify.buttons.js
//= require pnotify/pnotify.callbacks.js
//= require pnotify/pnotify.confirm.js
//= require pnotify/pnotify.desktop.js
//= require pnotify/pnotify.history.js
//= require pnotify/pnotify.mobile.js
//= require pnotify/pnotify.nonblock.js

$(document).ready(function() {
    PNotify.prototype.options.styling = "bootstrap3";
    $(window).bind('rails:flash', function(e, params) {
        switch(params.type){
            case 'alert':
                params.type = 'error';
                break;
            case 'notice':
                params.type = 'success';
                break;
            default:
        }
        new PNotify({
            title: params.message,
            type: params.type,
            buttons: {
                closer: true,
                closer_hover: false,
                sticker: false,
            }
        });
    });
});