  $(document).ready(function(){
    	
  	 let selectValue=$(pageSize).val();
  	$("#hiddenPageSize").val(selectValue);
  		console.log($("#hiddenPageSize").val());
  		
			
     let hiddenPageSize=$("#hiddenPageSize").val();	
        $("#pageSize").change(function(){
        	let selectValue=$(this).val();
           $("#hiddenPageSize").val(selectValue);
           console.log($("#hiddenPageSize").val());
        });
    
    $('#pageSize').on('change', function(){
		let pageSize = $('#pageSize').val();
		let searchKeyword = $('#searchKeyword').val();
		let board_class = $('#board_class').val();
		let searchCondition = $('#searchCondition').val();
		
		let newURL = 'board_list_link?pagingNum=0'
            + '&board_class=' + board_class
            + '&searchCondition=' + searchCondition
            + '&searchKeyword=' + searchKeyword
            + '&pageSize=' + pageSize;
			
		 window.location.href = newURL;
    });
   });   