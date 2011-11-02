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
	
	$(".new_todo").submit(function(event){
		if ( $(this).find("#todo_text").val() == false ){
			return false;
		}
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
