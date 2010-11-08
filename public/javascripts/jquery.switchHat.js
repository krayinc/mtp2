(function($) {

	//設定（コメントアウトすれば機能停止）
	$(function(){
		$.uHat.switchHat({
			switchBtn: '.switchHat, dl.faq dt',
			switchContents: '.switchDetail, .switchDetail2, dl.faq dd'
		});
		$.uHat.close({
			closeBtnSet: '.switchDetail'
		});
		$.uHat.openAll();
	});

	$.uHat = {

		// 折りたたみ
		switchHat: function(settings) {
			uHatConA = $.extend({
				switchBtn: '.switchHat',
				switchContents: '.switchDetail',
				switchClickAddClass: 'nowOpen'
			}, settings);
			$(uHatConA.switchContents).hide();
			$(uHatConA.switchBtn).addClass("switchOn").click(function(){
				var index = $(uHatConA.switchBtn).index(this);
				$(uHatConA.switchContents).eq(index).slideToggle("slow");
				$(this).toggleClass(uHatConA.switchClickAddClass);
			}).css("cursor","pointer");
		},
		
		

		// 下の方に閉じるボタンを表示する
		close: function(settings) {
			uHatConB = $.extend({
				closeBtnSet: uHatConA.switchContents,
				apCloseBtn: '<span>X Close</span>'				
			}, settings);

			$(".closeBtnHat").children().click(function(){
				$(this).parents(uHatConA.switchContents).slideToggle("slow");
				$(this).parents().prev().contents(uHatConA.switchBtn).removeClass(uHatConA.switchClickAddClass);
			}).css("cursor","pointer");
		},
		

		

		// 全部開くボタン
		openAll: function(settings) {
			uHatConC = $.extend({
				openAllBtnClass: '.allOpenBtn',
				switchBtn: uHatConA.switchBtn,
				openContents: uHatConA.switchContents
			}, settings);
			$(uHatConC.openAllBtnClass).addClass("switchOn").toggle(
				function(){
					$(this).addClass(uHatConA.switchClickAddClass);
					$(uHatConC.openContents).slideDown("slow");
					$(uHatConC.switchBtn).addClass(uHatConA.switchClickAddClass);
				},
				function(){
					$(this).removeClass(uHatConA.switchClickAddClass);
					$(uHatConC.openContents).slideUp("slow");
					$(uHatConC.switchBtn).removeClass(uHatConA.switchClickAddClass);
				}
			).css("cursor","pointer");
		}

	};


})(jQuery);