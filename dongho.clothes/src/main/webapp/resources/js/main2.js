var img;
var productName;
var price;
var div; 
$("form").empty();
$.ajax({
	url:"getProducts",
	success:function(products){
		$(products).each(function(idx,product){
			div = '<div class="productInfo">';
			img = '<img src="../upload/'+product.picture+'" width="100%" height="200px"></img>';
			productName = "<div id='name'>"+product.productName+"</div>"
			price = '<div id="price">'+product.price+'</div></div>';
 			var total = div+img+productName+price;
 			$("form").append(total);
		});
	}
});
$(document).ready(function() {
	$menuLeft = $('.pushmenu-left');
	$nav_list = $('#nav_list');
	
	$nav_list.click(function() {
		$(this).toggleClass('active');
		$('.pushmenu-push').toggleClass('pushmenu-push-toright');
		$menuLeft.toggleClass('pushmenu-open');
	});
});