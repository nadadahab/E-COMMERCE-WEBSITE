$(function () {

	'use strict';



	$('.login-page h1 span').click(function () {

		$(this).addClass('selected').siblings().removeClass('selected');

		$('.login-page form').hide();

		$('.' + $(this).data('class')).fadeIn(100);

	});

 

	$("select").selectBoxIt({

		autoWidth: false

	});

 

	$('[placeholder]').focus(function () {

		$(this).attr('data-text', $(this).attr('placeholder'));

		$(this).attr('placeholder', '');

	}).blur(function () {

		$(this).attr('placeholder', $(this).attr('data-text'));

	});



	$('input').each(function () {

		if ($(this).attr('required') === 'required') {

			$(this).after('<span class="asterisk">*</span>');

		}

	});

	 

	$('.confirm').click(function () {

		return confirm('Are You Sure?');

	});

	$('.live').keyup(function () {

		$($(this).data('class')).text($(this).val());

	});
    
	
    $("#searchitem").autocomplete({
        source: "search.php",
        minLength: 3,
        select: function (event, ui) {
            window.location = "items.php?do=manage&itemid=" + ui.item.value;
        }
    });

  $(".add").click(function () {
    //console.log("done");
        var pid= $(this).attr("value");
       $.ajax({
            url: 'addCart.php',
            type: 'POST',
           data: {id:pid},
            success: function (response) {
              
                if (response.success == true) {
                   console.log("done");
                   
                }
            }
        });
    });

$(".deletebtn").click(function(){
 var pid= $(this).attr("value");
 var divval=$('.totalprice').attr("value");
 var delprice =$(this).attr("price");
 var  newTotalprice;

 $(this).parent();
       $.ajax({
            url: 'deletecart.php',
            type: 'POST',
           data: {id:pid},
            success: function (response) {
              
                if (response.success == true) {
                   
                   
                }
            }

        });
       newTotalprice=divval-delprice;
                   $('.totalprice').attr("value",newTotalprice);
                    $('.totalprice').html("Total Price :"+newTotalprice);
                    
       ($(this).parent().parent()).remove()
    });


});