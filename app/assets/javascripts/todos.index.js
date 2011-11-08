$(function(){

	// I don't like it here but still
	$("#timeline").css({ width : $(document).width() + "px"});

	$(window).resize(function(){
		$("#timeline").css({ width : $(document).width() + "px"});
	});

	$("form.new_todo").submit(function(event){
		if ( $(this).attr("submitted") == "true" ){
			// submit only once
			return false;
		}
		if ( $(this).find("#todo_text").val() == false ){
			return false;
		}
		$(this).attr("submitted", "true");
	});
	
	$("form.new_todo #todo_text").live("keyup", function(e){
		if (e.which == 38){
			var tthis = $(this).parents("li").first().get(0);
			$lis = $(this).parents("ul").find("li").filter(function(){ return $(this).find("form").length > 0; });
			$prev_li = null;
			$lis.each(function(){
				if ( this == tthis ){
					if ( $prev_li == null ){
						$prev_li = $lis.last();
					}
					return false;
				}
				else
				{
					$prev_li = $(this);
				}
			});
			$prev_li.find("#todo_text").focus();
		}
		else if (e.which == 40){
			var tthis = $(this).parents("li").first().get(0);
			$lis = $(this).parents("ul").find("li").filter(function(){ return $(this).find("form").length > 0; });
			var tthis_found = false;
			$next_li = null;
			$lis.each(function(){
				if ( tthis_found ){
					$next_li = $(this);
					return false;
				}
				else if ( this == tthis )
				{
					tthis_found = true;
				}
			});
			if ( !$next_li ){
				$next_li = $lis.first();
			}
			$next_li.find("#todo_text").focus();
		}
	});

	$("form.new_todo #todo_text").live("focusout", function(){
		var $form = $(this).parents("form");
		if ( $(this).val() && $form.attr("submitted") != "true" ){
			$form.first().submit();
		}
	});

	$("form.new_todo #todo_text").live("focusout", function(){
		
	});

	$(".todo .complete").live("click", function(){
		$(this).find("input").attr("checked", true);
		$.ajax({
			url : $(this).attr("complete_path"),
			type : "POST",
			dataType : "script",
			success: function(){
				//alert("Done");
			}
		});
	});

});
