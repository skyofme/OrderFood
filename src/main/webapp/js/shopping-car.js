/**
 * Created by Administrator on 2017/6/30 0030.
 */
var all_check = document.getElementById("all-check");
var check = document.getElementsByTagName("input");

all_check.onclick = function() {
	for (var i = 0; i < check.length; i++) {
		var check_one = check[i];
		if (check_one.type == 'checkbox') {
			check_one.checked = all_check.checked;
		}
	}
};

$(document).ready(function() {
	$(".shopping-car-dec").click(function() {
			if (parseInt($(this).next().val()) > 1) {
				$(this).next().val(parseInt($(this).next().val()) - 1);
			}

			var a = parseInt($(this).parent().parent().prev().children().children().text() * parseInt($(this).next().val() * 100)) / 100;
			//a = a.substring(0,a.indexOf(".") + 3);    
			//var re = /([0-9]+\.[0-9]{2})[0-9]*/;
			//a = a.replace(re,"$1″);
			//a = parseInt(a*100)/100;
			$(this).parent().parent().next().children().children().text(a);
			fn1();
			fn();
			var goodsid = $(this).parent().parent().parent().children().children().eq(1).val();
			var amount = $(this).next().val();
			var cusId = $(this).parent().parent().parent().children().children().eq(2).val();
			console.log("---------goodsid"+goodsid+"cusId"+cusId)
			 $.ajax({
				  	type:"POST",
				  	url:"shoppingcar/update",
				  	contentType:"application/json",
				  	data:JSON.stringify({"mCount":amount,"menu":{"mId":goodsid},"cus":{"cId":cusId}}),
				  	success:function(data){
				  		
				  	}
				  });
		});
			$(".shopping-car-inc").click(
					function() {
						if (parseInt($(this).prev().val()) < 100) {
							$(this).prev().val(
									parseInt($(this).prev().val()) + 1);
						}
						var b = parseInt($(this).parent().parent().prev()
								.children().children().text()
								* parseInt($(this).prev().val() * 100)) / 100;
						//b = b*100)/100;
						$(this).parent().parent().next().children().children()
								.text(b);
						fn1();
						fn();
						var goodsid = $(this).parent().parent().parent().children().children().eq(1).val();
						var amount = $(this).prev().val();
						var cusId = $(this).parent().parent().parent().children().children().eq(2).val();
						//console.log("+++++++++++goodsid"+goodsid+"cusId"+cusId) 
						$.ajax({
							  	type:"POST",
							  	url:"shoppingcar/update",
							  	contentType:"application/json",
							  	data:JSON.stringify({"mCount":amount,"menu":{"mId":goodsid},"cus":{"cId":cusId}}),
							  	success:function(data){
							  		
							  	}
							  });
					});
			$(".single-checkbox").change(function() {
				fn1();
				fn();
			});
			$("#all-check").change(function() {
				fn1();
				fn();
			});

			//改变隐藏域是否提交
			function fn() {
				$.each($('.single-checkbox'), function() {
					if ($(this).is(':checked')) {
						$(this).next().attr("disabled", false);
						$(this).parent().parent().children().eq(4).children()
								.eq(1).attr("disabled", false);

					} else {
						$(this).next().attr("disabled", true);
						$(this).parent().parent().children().eq(4).children()
								.eq(1).attr("disabled", true);
					}
					$(this).parent().parent().children().eq(4).children().eq(1)
							.val(
									$(this).parent().parent().children().eq(4)
											.children().eq(0).children().eq(1)
											.val());
				});
			}

			//fn1用来改变下面的总数
			function fn1() {
				var a = 0;
				var b = 0;
				$.each($('.single-checkbox:checked'), function() {
					a += parseFloat($(this).parent().parent().children().eq(5)
							.children().children().text());
					b += parseInt($(this).parent().parent().children().eq(4)
							.children().children().eq(1).val());
					a = parseInt(a * 100) / 100;
					b = parseInt(b * 100) / 100;
				});

				$(".shopping-car-money span").text(a);
				$(".shopping-car-amount span").text(b);
			}
		});