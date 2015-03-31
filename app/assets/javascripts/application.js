// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function initPage() {
    // Page ready code...


    $(".land_word_illustration").hover(function () {
        $(this).closest(".land_illustration").toggleClass("opacity_illustration");
    });
    $(".land_word_lettering").hover(function () {
        $(this).closest(".land_lettering").toggleClass("opacity_lettering");
    });
    $(".land_word_logo").hover(function () {
        $(this).closest(".land_logo_inner_container").toggleClass("opacity_logo");
    });

    $(".menu_item").hover(function () {
        $(this).children(".menu_word").toggleClass("hidden");
    });
    $(".container_last").hover(function () {
        $(this).find(".mail_to_animate").addClass("mail_animation");
        $(this).find(".vk_to_animate").addClass("vk_animation");
    }, function () {
        $(this).find(".mail_to_animate").removeClass("mail_animation");
        $(this).find(".vk_to_animate").removeClass("vk_animation");
    });

    $(".letterings_inner").hover(function () {
        $(this).children(".letterings_inner_image").toggleClass("half_opacity");
        $(this).children(".letterings_inner_text").toggleClass("hidden");
    });

}

$(document).ready(initPage);
$(document).on('page:load', initPage);


function changeLanguage() {
    $(".circle_button").toggleClass("circle_pressed");
    $(".lang_field").toggleClass("hidden_down");

}