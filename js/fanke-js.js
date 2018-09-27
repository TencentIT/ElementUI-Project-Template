// JavaScript Document

$(function(){
	$('#top_bg #top #topright li.has_hide').hover(function(){
		$(this).addClass('cur');
		$(this).find('.menu_a').addClass('cur');
		$(this).find('.hide_box').show();
	},function(){
		$(this).removeClass('cur');
		$(this).find('.menu_a').removeClass('cur');
		$(this).find('.hide_box').hide();	
	})

	//凡客诚品和v+商城效果
	$('#main #logo_box #on_search li').click(function(){
		$(this).removeClass('no_bg').siblings().addClass('no_bg');
	})

	//购物车添加效果
	$('#main #logo_box #gouwuche').hover(function(){
		$(this).addClass('cur');
		$(this).find('.hide_box').show();
	},function(){
		$(this).removeClass('cur');
		$(this).find('.hide_box').hide();
	})

	//凡客旗下效果切换
	$('#main #logo_box #fankeqixia_box .fankeqixia').mouseover(function(){
		$(this).addClass('cur');
		$(this).siblings('.hide_box').show();
	})
	$('#main #logo_box #fankeqixia_box .fankeqixia').mouseout(function(){
		$(this).removeClass('cur');
		$(this).siblings('.hide_box').hide();
	})
	$('#main #logo_box #fankeqixia_box  .hide_box').mouseover(function(){
		$(this).siblings('.fankeqixia').addClass('cur');
		$(this).show();
	})
	$('#main #logo_box #fankeqixia_box  .hide_box').mouseout(function(){
		$(this).siblings('.fankeqixia').removeClass('cur');
		$(this).hide();
	})

	//灰色导航条区域
	$('#main #menu2_box .menu2_left .list .list_a').mouseover(function(){
		$(this).addClass('cur');		//让当前li 里面的a 标签加上一个cur class	
		$(this).siblings('.hide_box').show();//让当前li 隐藏的区域显示出来
	})
	 $('#main #menu2_box .menu2_left .list .list_a').mouseout(function(){
		$(this).removeClass('cur');
		$(this).siblings('.hide_box').hide();
	})
	$('#main #menu2_box .menu2_left .list .hide_box').mouseover(function(){
		$(this).show();
		$(this).siblings('.list_a').addClass('cur');
	})
	$('#main #menu2_box .menu2_left .list .hide_box').mouseout(function(){
		$(this).hide();
		$(this).siblings('.list_a').removeClass('cur');
	})

	//图片轮换版效果
	var flash_sta=0;
	var timer=setInterval(autoRun,3000);
	function autoRun(){	//控制自动轮播的函数
		flash_sta++;
		// if(flash_sta==7){
		// 	flash_sta=0;
		// }
		flash_sta=(flash_sta==7)?0:flash_sta;	//判断 flash_sta是否等于7
		$('#main  #flash_box .flash a img').eq(flash_sta).fadeIn().siblings('.img').hide();
			//让对应的图片显示，兄弟图片隐藏
		$('#main  #flash_box .flash ul li').eq(flash_sta).addClass('cur').siblings('li').removeClass('cur');
		//控制li的样式
	}

	$('#main  #flash_box .flash ul li').mouseover(function(){	//鼠标移入事件
		clearInterval(timer);
		flash_sta=$(this).index();	//获得鼠标移入地第几个li 
		$('#main  #flash_box .flash a img').eq(flash_sta).fadeIn().siblings('.img').hide();
			//让对应的图片显示，兄弟图片隐藏
		$('#main  #flash_box .flash ul li').eq(flash_sta).addClass('cur').siblings('li').removeClass('cur');
		//控制li的样式
	})

	$('#main  #flash_box .flash ul li').mouseout(function(){	//鼠标移出效果
		timer=setInterval(autoRun,3000);
	})

	//无缝滚动效果
	var ul_width=0;
	$('.wufeng .wufeng_right ul.list1 li').each(function(){
		ul_width=ul_width+$(this).width();	//计算ul宽度
	})
	$('.wufeng .wufeng_right ul ').css('width',ul_width+'px');	//将宽度加到ul上面
	$('.wufeng .wufeng_right ul.list2').css('left',ul_width+'px');	//给第二个ul设置left值

	var change_left=710-ul_width*2;
	function wufeng(obj){
		setInterval(function(){
			var old_left=obj.position().left;	//	获得obj现有的left
			var new_left=old_left-1;
			if(new_left<change_left){
				obj. css('left','710px');
				new_left=710;
			}
			obj.css('left',new_left+'px');
		},20)
	}
	wufeng($('.wufeng .wufeng_right ul.list1'));
	wufeng($('.wufeng .wufeng_right ul.list2'));

	//商品分类推荐效果
	$('#main #fenlei_box  .fenlei_list .list ').mouseover(function(){
		$(this).find('.left').addClass('l_cur');
		$(this).find('.right').addClass('r_cur');
	})
	$('#main #fenlei_box  .fenlei_list .list').mouseout(function(){
		$(this).find('.left').removeClass('l_cur');
		$(this).find('.right').removeClass('r_cur');
	})

	//table切换页效果
	$('#main #fenlei_box  .news_tab .tab_title li').mouseover(function(){
		var cur=$(this).index();
		$('#main #fenlei_box .news_tab .con').eq(cur).show().siblings('.con').hide();
		$(this).addClass('cur').siblings().removeClass('cur');
	})
})  