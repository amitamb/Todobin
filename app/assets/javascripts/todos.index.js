/*
	var timeline = {
	var range = [];
	addDay : function( todo_list ) {
		var left = 0;
		if (range == []){
			range[0] = todo_list.date;
			range[1] = todo_list.date;
		}
		else
		{
			//left = 
		}
	}
}
*/

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
