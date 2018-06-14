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
//= require jquery
//= require_tree .
//= require bootstrap-sprockets
//= require wow

// -------------タブ

$(window).on("load",function(){
 $("li").on("click",function(){
    $("li.selected").removeClass("selected");
    $(this).addClass("selected");
    $(".tab div").hide();
    $("." + this.id).show();
 });
});

// // ---------------モーダル
// // <div id="modal-overlay2"></div>
// $(function(){
//     var name = $('input[name=article_id_pre]').val();
//  $(`#modal-open${name}`).click(function(){
// //キーボード操作などにより、オーバーレイが多重起動するのを防止する
// $(this).blur();	//ボタンからフォーカスを外す
// // if($("#modal-overlay")[0]) return false;		//新しくモーダルウィンドウを起動しない (防止策1)
// // if($("#modal-overlay")[0]) $("#modal-overlay").remove();		//現在のモーダルウィンドウを削除して新しく起動する (防止策2)
// //オーバーレイを出現させる
// $("body").append('<div id="modal-overlay' + `${name}` + '"></div>');
// $("#modal-overlay").fadeIn("slow");
// //コンテンツをセンタリングする
// centeringModalSyncer();
// //コンテンツをフェードインする
// $("#modal-content").fadeIn("slow");
// //[#modal-overlay]、または[#modal-close]をクリックしたら…
// $("#modal-overlay,#modal-close").unbind().click(function(){
// //[#modal-content]と[#modal-overlay]をフェードアウトした後に…
// $("#modal-content,#modal-overlay").fadeOut("slow", function(){
// //[#modal-overlay]を削除する
// $('#modal-overlay').remove();
// });
// });
// });
// //リサイズされたら、センタリングをする関数[centeringModalSyncer()]を実行する
// $(window).resize(centeringModalSyncer);
// //センタリングを実行する関数
// function centeringModalSyncer() {
// //画面(ウィンドウ)の幅、高さを取得
// var w = $(window).width();
// var h = $(window).height();
// // コンテンツ(#modal-content)の幅、高さを取得
// // jQueryのバージョンによっては、引数[{margin:true}]を指定した時、不具合を起こします。
// var cw = $("#modal-content").outerWidth();
// var ch = $("#modal-content").outerHeight();
// // var cw = $("#modal-content").outerWidth();
// // var ch = $("#modal-content").outerHeight();
// //センタリングを実行する
// $("#modal-content").css({"left": ((w - cw)/2) + "px","top": ((h - ch)/2) + "px"});
// }
// });


$(function(){
    $('.modal-open').click(function(){
        $('body').append('<div class="modal-overlay"></div>');
        $('.modal-overlay').fadeIn('slow');
        // モーダルのIDを取得
        var modal = '#' + $(this).attr('data-target');
        modalResize();
        $(modal).fadeIn('slow');
        $('.modal-overlay, .modal-close').off().click(function(){
            $(modal).fadeOut('slow');
            $('.modal-overlay').fadeOut('slow',function(){
                $('.modal-overlay').remove();
            });
        });
        $(window).on('resize', function(){
            modalResize();
        });
        // モーダルコンテンツの表示位置を設定する関数
        function modalResize(){
            // ウィンドウの横幅、高さを取得
            var w = $(window).width();
            var h = $(window).height();
             // モーダルコンテンツの表示位置を取得
            var x = (w - $(modal).outerWidth(true)) / 2;
            var y = (h - $(modal).outerHeight(true)) / 2;
            // モーダルコンテンツの表示位置を設定
            $(modal).css({'left': x + 'px','top': y + 'px'});
        } 
    });
});

