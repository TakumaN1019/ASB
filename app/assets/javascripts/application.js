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
//= require jquery3
//= require cocoon
//= require activestorage
//= require turbolinks
//= require_tree .


$(function(){

  // successメッセージの表示からフェードアウトまで
  $("#success").animate({right: 0}, 1000);
  $("#success").delay(1500).fadeOut(1000);

  // noticeメッセージの非表示
  $("#notice_back").on("click", function(){
    $("#notice").fadeOut();
    $(this).fadeOut();
  });

  // エラーメッセージ
  $("#alert #close").click(function (){
    $("#alert").slideUp();
  });


  // 選択結果を表示
  $("#look_select").click(function(){
    $("#selects").slideToggle();
    if($(this).hasClass("hide")){
      $(this).text("中身を見る");
      $(this).removeClass("hide");
    } else {
      $(this).text("閉じる");
      $(this).addClass("hide");
    }
  });

  // flashメッセージの表示からフェードアウトまで
  //$("#flash").animate({right: 0}, 1000);
  //$("#flash").delay(1500).fadeOut(1000);

});


