	$(document).ready(function() {
		$('#item_list').DataTable({
			 "lengthMenu": [ 5, 10 ]
		});//apply_list_table
		
		$('#fileBt').click(function(){
			var htmlTxt='<input type="file" class="form-control-file"'+
				        'placeholder="썸네일" id="thumbnail" name="thumbnail" required'+
				        'data-validation-required-message="썸네일 이미지를 입력해주세요.">';
            $('#sp').html(htmlTxt);    
            $('input[id=thumbnail]').click();
		});
	});

function call_detail(item_id){
		$.ajax({
            type : "POST",
            url : "/ktrip/itemServlet",
            data:{actionMode:'SELECT',
            	  item_id:item_id},
            success : function(data){
                console.log(data);
                //data == JSON ==> {key:value}  var v={name:'길동'}   v.name ==> '길동'
                //아이템 정보
             	$('#detail_title').text(data.item.title);
                $('#title').val(data.item.title);
                $('#contents').val(data.item.contents);
                $('#num_min').val(data.item.num_min);
                $('#num_max').val(data.item.num_max);
                $('#duration').val(data.item.duration);
                $('#price').val(data.item.price);
                $('#concept').val(data.item.concept);
                var idx = data.item.thumbnail.lastIndexOf('/');
                console.log('idx>>>'+idx)
                var fileName = data.item.thumbnail.substr(idx+1);
                $('#thumbnail').val(fileName);
                $('#item_form').attr("action","/ktrip/itemServlet?actionMode=UPDATE&item_id="+item_id);
                //console.log("/ktrip/itemServlet?actionMode=UPDATE&item_id="+item_id);
                //**//alert(jss로드성공);
                
                //신청자 테이블 생성.
               	console.log(data.applyList.length);
                var str = "<tr>"
               	if(data.applyList.length != 0){
                	for(var i =0;i<data.applyList.length;i++){
                		str += "<td>"+data.applyList[i].name+"</td><td>"+data.applyList[i].start_date+"~"+data.applyList[i].end_date +"</td>";    		
                		if(data.applyList[i].item_status==1){
                		str+="<td><button class=\"btn-primary btn-sm\" id=\"btn_accept\" onclick=\"accept("+data.applyList[i].apply_id+","+item_id+")\">승낙</button></td>"+
                		"<td><button class=\"btn-primary btn-sm\"id=\"btn_decline\" onclick=\"decline("+data.applyList[i].apply_id+","+item_id+")\">거절</button></td></tr>";
               	 		}else{
               	 		str+="<td colspan=2>승낙되었습니다.</td></tr>";
               	 		}
                		
                		}
                }else{
                	str += "<td colspan="+4+">신청자가 없습니다.</td></tr>"
                }
                $("#apply_list_tbody").html(str);
   
            }             
        });		
	}
	//승낙버튼 동작
	function accept(apply_id,item_id){
		 //location.href = "./itemServlet?actionMode=STATCHANGE&apply_id="+apply_id+"&item_status=2&item_id="+item_id;
		 $.ajax({
				  url:"/ktrip/itemServlet",
				  data:{
					  actionMode:'STATCHANGE',
					  apply_id:apply_id,
					  item_status:2,
					  item_id:item_id
				  },
				  success:function(){
					  $.ajax({
				            type : "POST",
				            url : "/ktrip/itemServlet",
				            data:{actionMode:'SELECT',
				            	  item_id:item_id},
				            success : function(data){
				                console.log(data);
				              
				                //신청자 테이블 생성.
				                var str = "<tr>"
				               	if(data.applyList.length!=0){
				                	for(var i =0;i<data.applyList.length;i++){
				                		str += "<td>"+data.applyList[i].name+"</td><td>"+data.applyList[i].start_date+"~"+data.applyList[i].end_date +"</td>";    		
				                		if(data.applyList[i].item_status==1){
				                		str+="<td><button class=\"btn-primary btn-sm\" id=\"btn_accept\" onclick=\"accept("+data.applyList[i].apply_id+","+item_id+")\">승낙</button></td>"+
				                		"<td><button class=\"btn-primary btn-sm\"id=\"btn_decline\" onclick=\"decline("+data.applyList[i].apply_id+","+item_id+")\">거절</button></td></tr>";
				               	 		}else{
				               	 		str+="<td colspan=2>승낙되었습니다.</td></tr>";
				               	 		}
				                		
				                		}
				                }else{
				                	str += "<td colspan="+4+">신청자가 없습니다.</td></tr>"
				                }
				                $("#apply_list_tbody").html(str);
				   
				            }             
				        });		
				  }
		       });//승낙요청		
	}//accept
	
	//거절버튼 동작
	function decline(apply_id,item_id){
		 $.ajax({
				  url:"/ktrip/itemServlet",
				  data:{
					  actionMode:'STATCHANGE',
					  apply_id:apply_id,
					  item_status:3,
					  item_id:item_id
				  },
				  success:function(){
					  $.ajax({
				            type :"POST",
				            url : "/ktrip/itemServlet",
				            data:{actionMode:'SELECT',
				            	  item_id:item_id},
				            success : function(data){
				                console.log(data);
				                //신청자 테이블 생성.
				                var str = "<tr>"
				               	if(data.applyList.length!=0){
				                	for(var i =0;i<data.applyList.length;i++){
				                		str += "<td>"+data.applyList[i].name+"</td><td>"+data.applyList[i].start_date+"~"+data.applyList[i].end_date +"</td>";    		
				                		if(data.applyList[i].item_status==1){
				                		str+="<td><button class=\"btn-primary btn-sm\" id=\"btn_accept\" onclick=\"accept("+data.applyList[i].apply_id+","+item_id+")\">승낙</button></td>"+
				                		"<td><button class=\"btn-primary btn-sm\"id=\"btn_decline\" onclick=\"decline("+data.applyList[i].apply_id+","+item_id+")\">거절</button></td></tr>";
				               	 		}else{
				               	 		str+="<td colspan=2>승낙되었습니다.</td></tr>";
				               	 		}
				                		
				                		}
				                }else{
				                	str += "<td colspan="+4+">신청자가 없습니다.</td></tr>"
				                }
				                $("#apply_list_tbody").html(str);
				            }             
				        });		
				  }
		       });//거절
	}