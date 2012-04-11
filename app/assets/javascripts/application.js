// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require tinymce-jquery
//= require_tree .

$(document).ready(function(){
    $('h2#session').click(function(){
        noty({"text": sessiondata,"layout":"bottomLeft","type":"information","animateOpen":{"height":"toggle"},"animateClose":{"height":"toggle"},"speed":500,"timeout":5000,"closeButton":false,"closeOnSelfClick":true,"closeOnSelfOver":false});
    })
})
