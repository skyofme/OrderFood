window.onload = function() {
    var center_left = document.getElementById("center-left");
    var big = document.getElementById("big");
    var center_img = document.getElementById("center-img");
    var mask = document.getElementById("mask");
    var big_div = document.getElementById("big-div");
    var big_img = document.getElementById("big-img");
    big.onmouseover = function(){
        mask.style.display = "block";
        big_div.style.display = "block";
    };
    big.onmouseout = function(){
        mask.style.display = "none";
        big_div.style.display = "none";
    };
    big.onmousemove = function(event){
        var event = event || window.event;
        var pagex = event.pageX || event.clientX + scrollX.left;
        var pagey = event.pageY || event.clientY + scrollY.top;
        var x = pagex - big.parentNode.offsetLeft - mask.offsetWidth/2;
        var y = pagey - big.parentNode.offsetTop - mask.offsetHeight/2;
        if(x<0){
            x=0;
        }else if(x> big.offsetWidth-mask.offsetWidth){
            x = big.offsetWidth-mask.offsetWidth;
        }
        if(y<0){
            y=0;
        }else if(y> big.offsetHeight-mask.offsetHeight){
            y = big.offsetHeight-mask.offsetHeight;
        }
        mask.style.left = x + "px";
        mask.style.top = y + "px";
        var xx = (big_img.offsetWidth - big_div.offsetWidth)/(center_img.offsetWidth-mask.offsetWidth);
        big_img.style.marginLeft = -x*xx+"px";
        big_img.style.marginTop = -y*xx+"px";
    };

};