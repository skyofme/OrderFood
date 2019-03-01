    /**
     * Created by Administrator on 2017/6/27 0027.
     */
    
	 function a(img){
    	var a = [];
    	a = img.split("__");
    	var a1 = (a[1]-0)*1;
    	a1+=1;
    	var center = a[0]+"__"+a1+"__"+a[2];
    	a1+=1;
    	var big = a[0]+"__"+a1+"__"+a[2];
    	$("#center-img").attr('src',center); 
    	$("#big-img").attr('src',big);
    }
	 
	 
	
	 
$(document).ready(function(){
    $('.dec').click(function(){
        if(parseInt($(this).next().val())>1){
            $(this).next().val(parseInt($(this).next().val())-1);
        }
    });
    $(".inc").click(function(){
        if(parseInt($(this).prev().val())<100){
            $(this).prev().val(parseInt($(this).prev().val())+1);
        }
    });
    $('#detail_arrow_l').click(function(){
		 var path = $("#center-img")[0].src;
		 var path0 = $("#big-img")[0].src;
		 var a = [];
		 a = path.split("__");
		 var b = [];
		 var a1 = 0;
		 var b1 = 0;
		 b = path0.split("__");
		 var path1;
		 var path2
		 if(a[1]<=2){
			 a[1] = 14;
			 b[1] = 15;
			 path1 = a[0]+"__"+a[1]+"__"+a[2];
			 path2 = b[0]+"__"+b[1]+"__"+b[2];
		 }
		 else{
			 a1 = (a[1]-0)*1 -3;
			 b1 = (b[1]-0)*1 -3;
			 path1 = a[0]+"__"+a1+"__"+a[2];
			 path2 = b[0]+"__"+b1+"__"+b[2];
		 }
		 $("#center-img").attr('src',path1); 
		 $("#big-img").attr('src',path2); 
	 });
    
    $('#detail_arrow_r').click(function(){
		 var path = $("#center-img")[0].src;
		 var path0 = $("#big-img")[0].src;
		 var a = [];
		 a = path.split("__");
		 var b = [];
		 var a1 = 0;
		 var b1 = 0;
		 b = path0.split("__");
		 var path1;
		 var path2
		 if(a[1]>=14){
			 a[1] = 2;
			 b[1] = 3;
			 path1 = a[0]+"__"+a[1]+"__"+a[2];
			 path2 = b[0]+"__"+b[1]+"__"+b[2];
		 }
		 else{
			 a1 = (a[1]-0)*1 +3;
			 b1 = (b[1]-0)*1 +3;
			 path1 = a[0]+"__"+a1+"__"+a[2];
			 path2 = b[0]+"__"+b1+"__"+b[2];
		 }
		 $("#center-img").attr('src',path1); 
		 $("#big-img").attr('src',path2); 
	 });
});
    
