// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery-ui

//= require turbolinks
//= require datetimepicker
//= require_tree .

$(document).on("turbolinks:load", function() {
  $("body").on("change", ".tasks_item-check" , function(){
  	console.log(this.value)
    const path = this.value.split(" ")
      $.ajax({
        url: "/lists/" + path[0] + "/tasks/" + path[1],
        type: "PUT",
        data: { "task": {"done": this.checked} }
      });
    });
$("body").on("mouseenter", ".handle" , function(){
  $(".tasks").sortable({
    axis: "y",
    handle: ".handle",
    update: function(){
      $.post($(this).data("update-url"), $(this).sortable("serialize"));
    }
  });
  });
});