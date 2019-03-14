var popupX = parseInt((window.screen.width/2)) - (600/2);
var popupY = parseInt((window.screen.height/2)) - (900/ 2);

var active_pagenumber = 1;//현재 페이지 카운트.
var start_pagenumber =0;//총 페이지 중 첫번째 카운트.
var first_pagenumber = 0;//현재 줄에서 첫번째 페이지 카운트.
var last_pagenumber = 0;//현재 줄에서 마지막 페이지 카운트.
var total_pagenumber = 0;//총 페이지 카운트. 

var active_pagenumber2 = 1;//현재 페이지 카운트.
var start_pagenumber2 =0;//총 페이지 중 첫번째 카운트.
var first_pagenumber2 = 0;//현재 줄에서 첫번째 페이지 카운트.
var last_pagenumber2 = 0;//현재 줄에서 마지막 페이지 카운트.
var total_pagenumber2 = 0;//총 페이지 카운트. 

var active_pagenumber3 = 1;//현재 페이지 카운트.
var start_pagenumber3 =0;//총 페이지 중 첫번째 카운트.
var first_pagenumber3 = 0;//현재 줄에서 첫번째 페이지 카운트.
var last_pagenumber3 = 0;//현재 줄에서 마지막 페이지 카운트.
var total_pagenumber3 = 0;//총 페이지 카운트.

$( document ).ready(function() {
    //쿼리 로우 개수를 받아서 하단 페이징 바 계산.
    loadpagecount2();
    loadpagecount3();
});

//Search Button 클릭했을 경우.
function SearchProduct(){
    alert('search click');
    loadpagecount();//쿼리 로우 개수를 받아서 하단 페이징 바 계산.
}

function loadpagecount(){
    var start_date = $('#start-date').val();
    var end_date = $('#end-date').val();
    var destination = $('#destination').val();
    
    $.ajax({
        type : "GET",
        url : "./SearchItem",
        data : {start_date:start_date,
                end_date:end_date,
                destination:destination
                },
        success : function(result) {
            
            var object = eval('(' + result + ')');
            var result2 = object.result;
            
            if(result2.length != 0){
                
                loadtable();//laod table;
                
                //총 페이지 개수.(test를 위해 5개 기준으로 분리하자.)
                var pagecount = 0;
                pagecount = parseInt(result2.length/5);//5개씩 부려주자~
                
                if(parseInt(result2.length%5) != 0){
                    pagecount+=1;
                }
                start_pagenumber = 1;//총 페이지 중 첫번째 카운트.
                total_pagenumber = pagecount;//총 페이지 개수.
                
                //하단 페이지에 표시해줄 개수. 만약 10개가 넘으면 10개까지 생성. 아니면 개수만큼 숫자 생성.
                if(pagecount>10){
                    
                    first_pagenumber = 1;//현재 줄에서 첫번째 페이지 카운트.
                    last_pagenumber = 10;//현재 줄에서 마지막 페이지 카운트.
                    
                    var str ='';
                    str+='<a><</a>';
                    for(var i = 1; i<11; ++i){
                        
                        if(i ==1){
                            str+='<a class="active">'+ i + '</a>';
                        }else{
                            str+='<a>'+ i + '</a>';
                        }
                    }
                    
                    str+='<a>></a>';
                    $('#pg1').html(str);
                }else{
                    first_pagenumber = 1;//현재 줄에서 첫번째 페이지 카운트.
                    last_pagenumber = pagecount;//현재 줄에서 마지막 페이지 카운트.
                    var str ='';
                    str+='<a><</a>';
                    for(var i = 1; i<pagecount+1; ++i){
                        var id = 'bt' + i;
                        if(i ==1){
                            str+='<a class="active">'+ i + '</a>';
                        }else{
                            str+='<a>'+ i + '</a>';
                        }
                    }
                    
                    str+='<a>></a>';
                    $('#pg1').html(str);
                }
                
                
            }else{
                $('.insert_product').html("상품이 없습니다.");
            }
        }
    });
}

function loadtable(){
    
    var start_date = $('#start-date').val();
    var end_date = $('#end-date').val();
    var destination = $('#destination').val();
    
    $.ajax({
        type :"POST",
        url : "./SearchItem",
        data : {start_date:start_date,
                end_date:end_date,
                destination:destination,
                pagingnumber:active_pagenumber
                },
        success : function(result) {// result=[{ reviewid:1 },{score:10},{}]
            //result == Array
            //result[i] == JSON
            //var v1 = result[0]   v1==JSON
            //result[i]['reviewid']  ===> 1
            //result[i]['score']  ===> 10

            var object = eval('(' + result + ')');
            var result2 = object.result;
            
            if(result2.length != 0){
                var product='';
                
                for (var i = 0; i < result2.length; ++i) {
                    product+='<div class="imgclass"><img src="' + result2[i][2] 
                    + '" id="' + result2[i][0] + '"  width="100" height="100" onclick="openPopupApply(' + result2[i][0] +');"></img><br>'
                    + result2[i][0] + '</div>';
                }
                $('.insert_product').html(product2);
            }else{
                $('.insert_product').html("리뷰가 없습니다.");
            }
        }
    });
}

function loadpagebarNext(){//Next 누를 경우.
    //total_pagenumber를 가지고 있다.
    
    if(active_pagenumber>last_pagenumber){
        //하단 페이지에 표시해줄 개수. 만약 10개 단위로 끊어서 생성, 10개가 안되면 10개 전으로 생성.
        if(total_pagenumber>active_pagenumber + 9){
            
            first_pagenumber = active_pagenumber;//현재 줄에서 첫번째 페이지 카운트.
            last_pagenumber = active_pagenumber+9;//현재 줄에서 마지막 페이지 카운트.
            
            var str ='';
            str+='<a><</a>';
            for(var i = active_pagenumber; i<active_pagenumber+10; ++i){
                
                if(i ==active_pagenumber){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('#pg1').html(str);
        }else{
            
            first_pagenumber = active_pagenumber;//현재 줄에서 첫번째 페이지 카운트.
            last_pagenumber = total_pagenumber;//현재 줄에서 마지막 페이지 카운트.
            
            var str ='';
            str+='<a><</a>';
            for(var i = active_pagenumber; i<total_pagenumber+1; ++i){
                var id = 'bt' + i;
                if(i ==active_pagenumber){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('#pg1').html(str);
        }
    }else{
            var str ='';
            str+='<a><</a>';
            
            for(var i = first_pagenumber; i<last_pagenumber+1; ++i){
                
                if(i ==active_pagenumber){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('#pg1').html(str);
    }
}

function loadpagebarCur(){//현재 라인에 있는 버튼을 누를 경우.
    var str ='';
    str+='<a><</a>';
    
    for(var i = first_pagenumber; i<last_pagenumber+1; ++i){
        
        if(i ==active_pagenumber){
            str+='<a class="active">'+ i + '</a>';
        }else{
            str+='<a>'+ i + '</a>';
        }
    }
    
    str+='<a>></a>';
    $('#pg1').html(str);
}

function loadpagebarPrev(){//Prev 버튼을 누를 경우.
    if(active_pagenumber < first_pagenumber){//줄이 바뀌어야함.
        if(start_pagenumber<active_pagenumber - 9){
            
            first_pagenumber = active_pagenumber-9;//현재 줄에서 첫번째 페이지 카운트.
            last_pagenumber = active_pagenumber;//현재 줄에서 마지막 페이지 카운트.
            
            var str ='';
            str+='<a><</a>';
            for(var i = active_pagenumber; i<active_pagenumber+10; ++i){
                
                if(i ==active_pagenumber){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('#pg1').html(str);
        }else{
            
            first_pagenumber = start_pagenumber;//현재 줄에서 첫번째 페이지 카운트.
            last_pagenumber = active_pagenumber;//현재 줄에서 마지막 페이지 카운트.
            
            var str ='';
            str+='<a><</a>';
            for(var i = start_pagenumber; i<active_pagenumber+1; ++i){
                var id = 'bt' + i;
                if(i ==active_pagenumber){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('#pg1').html(str);
        }
    }else{
        var str ='';
        str+='<a><</a>';
        
        for(var i = first_pagenumber; i<last_pagenumber+1; ++i){
            
            if(i ==active_pagenumber){
                str+='<a class="active">'+ i + '</a>';
            }else{
                str+='<a>'+ i + '</a>';
            }
        }
        
        str+='<a>></a>';
        $('#pg1').html(str);
    }
}

// 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
$(document).on("click","#pg1 a",function(event){
    if($(this).text() == "<"){//prev
        if(active_pagenumber > 1){
            active_pagenumber = active_pagenumber - 1;//현재 active_pagenumber 갱신.
            loadtable();
            loadpagebarPrev();
        }
    }
    else if($(this).text() == ">"){//next
        if(active_pagenumber < total_pagenumber){
            active_pagenumber = active_pagenumber + 1;//현재 active_pagenumber 갱신.
            loadtable();
            loadpagebarNext();
        }
    }
    else{//본인이 누른 페이지.
        active_pagenumber = parseInt($(this).text());//현재 active_pagenumber 갱신.
        loadtable();
        loadpagebarCur();
    }
    });

/////////////////////////////////////두번째 하단 페이지//////////////////////////////////////////////////////

function loadpagecount2(){
    
    
    $.ajax({
        type : "GET",
        url : "./listWait",
        data : {},
        success : function(result) {
            
            var object = eval('(' + result + ')');
            var result2 = object.result;
            
            
            if(result2.length != 0){
                
                loadtable2();
                
                //총 페이지 개수.(test를 위해 5개 기준으로 분리하자.)
                var pagecount2 = 0;
                pagecount2 = parseInt(result2.length/5);
                
                if(parseInt(result2.length%5) != 0){
                    pagecount2+=1;
                }
                start_pagenumber2 = 1;//총 페이지 중 첫번째 카운트.
                total_pagenumber2 = pagecount2;//총 페이지 개수.
                
                //하단 페이지에 표시해줄 개수. 만약 10개가 넘으면 10개까지 생성. 아니면 개수만큼 숫자 생성.
                if(pagecount2>10){
                    
                    first_pagenumber2 = 1;//현재 줄에서 첫번째 페이지 카운트.
                    last_pagenumber2 = 10;//현재 줄에서 마지막 페이지 카운트.
                    
                    var str ='';
                    str+='<a><</a>';
                    for(var i = 1; i<11; ++i){
                        
                        if(i ==1){
                            str+='<a class="active">'+ i + '</a>';
                        }else{
                            str+='<a>'+ i + '</a>';
                        }
                    }
                    
                    str+='<a>></a>';
                    $('#pg2').html(str);
                }else{
                    first_pagenumber2 = 1;//현재 줄에서 첫번째 페이지 카운트.
                    last_pagenumber2 = pagecount2;//현재 줄에서 마지막 페이지 카운트.
                    var str ='';
                    str+='<a><</a>';
                    for(var i = 1; i<pagecount2+1; ++i){
                        var id = 'bt' + i;
                        if(i ==1){
                            str+='<a class="active">'+ i + '</a>';
                        }else{
                            str+='<a>'+ i + '</a>';
                        }
                    }
                    
                    str+='<a>></a>';
                    $('#pg2').html(str);
                }
                
                
            }else{
                $('.insert_product2').html("상품이 없습니다.");
            }
        }
    });
}

function loadtable2(){
    
    $.ajax({
        type : "POST",
        url : "./listWait",
        data : {pagingnumber:active_pagenumber2},
        success : function(result) {
            
            var object = eval('(' + result + ')');
            var result2 = object.result;
            
            if(result2.length != 0){
                var product2='';
                
                for (var i = 0; i < result2.length; ++i) {
                    product2+='<div class="imgclass"><img src="' + result2[i][2].value 
                    + '" id="' + result2[i][0].value + '"  width="100" height="100"></img><br>'
                    + result2[i][1].value + '<br><button onclick="deletedata();">삭제</button></div>';
                }
                
                $('.insert_product2').html(product2);
            }else{
                $('.insert_product2').html("리뷰가 없습니다.");
            }
        }
    });
}



function loadpagebarNext2(){//Next 누를 경우.
    //total_pagenumber를 가지고 있다.
    
    if(active_pagenumber2>last_pagenumber2){
        //하단 페이지에 표시해줄 개수. 만약 10개 단위로 끊어서 생성, 10개가 안되면 10개 전으로 생성.
        if(total_pagenumber2>active_pagenumber2 + 9){
            
            first_pagenumber2 = active_pagenumber2;//현재 줄에서 첫번째 페이지 카운트.
            last_pagenumber2 = active_pagenumber2+9;//현재 줄에서 마지막 페이지 카운트.
            
            var str ='';
            str+='<a><</a>';
            for(var i = active_pagenumber2; i<active_pagenumber2+10; ++i){
                
                if(i ==active_pagenumber2){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('#pg2').html(str);
        }else{
            
            first_pagenumber2 = active_pagenumber2;//현재 줄에서 첫번째 페이지 카운트.
            last_pagenumber2 = total_pagenumber2;//현재 줄에서 마지막 페이지 카운트.
            
            var str ='';
            str+='<a><</a>';
            for(var i = active_pagenumber2; i<total_pagenumber2+1; ++i){
                var id = 'bt' + i;
                if(i ==active_pagenumber2){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('#pg2').html(str);
        }
    }else{
            var str ='';
            str+='<a><</a>';
            
            for(var i = first_pagenumber2; i<last_pagenumber2+1; ++i){
                
                if(i ==active_pagenumber2){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('#pg2').html(str);
    }
}

function loadpagebarCur2(){//현재 라인에 있는 버튼을 누를 경우.
    var str ='';
    str+='<a><</a>';
    
    for(var i = first_pagenumber2; i<last_pagenumber2+1; ++i){
        
        if(i ==active_pagenumber2){
            str+='<a class="active">'+ i + '</a>';
        }else{
            str+='<a>'+ i + '</a>';
        }
    }
    
    str+='<a>></a>';
    $('#pg2').html(str);
}

function loadpagebarPrev2(){//Prev 버튼을 누를 경우.
    if(active_pagenumber2 < first_pagenumber2){//줄이 바뀌어야함.
        if(start_pagenumber2<active_pagenumber2 - 9){
            
            first_pagenumber2 = active_pagenumber2-9;//현재 줄에서 첫번째 페이지 카운트.
            last_pagenumber2 = active_pagenumber2;//현재 줄에서 마지막 페이지 카운트.
            
            var str ='';
            str+='<a><</a>';
            for(var i = active_pagenumber2; i<active_pagenumber2+10; ++i){
                
                if(i ==active_pagenumber2){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('#pg2').html(str);
        }else{
            
            first_pagenumber2 = start_pagenumber2;//현재 줄에서 첫번째 페이지 카운트.
            last_pagenumber2 = active_pagenumber2;//현재 줄에서 마지막 페이지 카운트.
            
            var str ='';
            str+='<a><</a>';
            for(var i = start_pagenumber2; i<active_pagenumber2+1; ++i){
                var id = 'bt' + i;
                if(i ==active_pagenumber2){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('#pg2').html(str);
        }
    }else{
        var str ='';
        str+='<a><</a>';
        
        for(var i = first_pagenumber2; i<last_pagenumber2+1; ++i){
            
            if(i ==active_pagenumber2){
                str+='<a class="active">'+ i + '</a>';
            }else{
                str+='<a>'+ i + '</a>';
            }
        }
        
        str+='<a>></a>';
        $('#pg2').html(str);
    }
}



$(document).on("click","#pg2 a",function(event){
    if($(this).text() == "<"){//prev
        if(active_pagenumber2 > 1){
            active_pagenumber2 = active_pagenumber2 - 1;//현재 active_pagenumber 갱신.
            loadtable2();
            loadpagebarPrev2();
        }
    }
    else if($(this).text() == ">"){//next
        if(active_pagenumber2 < total_pagenumber2){
            active_pagenumber2 = active_pagenumber2 + 1;//현재 active_pagenumber 갱신.
            loadtable2();
            loadpagebarNext2();
        }
    }
    else{//본인이 누른 페이지.
        active_pagenumber2 = parseInt($(this).text());//현재 active_pagenumber 갱신.
        loadtable2();
        loadpagebarCur2();
    }
    });

/////////////////////////////////////세번째 하단 페이지//////////////////////////////////////////////////////

function loadpagecount3(){

    $.ajax({
        type : "GET",
        url : "./listOld",
        data : {},
        success : function(result) {
            
            var object = eval('(' + result + ')');
            var result2 = object.result;
            
            
            if(result2.length != 0){
                
                loadtable3();
                
                //총 페이지 개수.(test를 위해 5개 기준으로 분리하자.)
                var pagecount3 = 0;
                pagecount3 = parseInt(result2.length/5);
                
                if(parseInt(result2.length%5) != 0){
                    pagecount3+=1;
                }
                start_pagenumber3 = 1;//총 페이지 중 첫번째 카운트.
                total_pagenumber3 = pagecount3;//총 페이지 개수.
                
                //하단 페이지에 표시해줄 개수. 만약 10개가 넘으면 10개까지 생성. 아니면 개수만큼 숫자 생성.
                if(pagecount3>10){
                    
                    first_pagenumber3 = 1;//현재 줄에서 첫번째 페이지 카운트.
                    last_pagenumber3 = 10;//현재 줄에서 마지막 페이지 카운트.
                    
                    var str ='';
                    str+='<a><</a>';
                    for(var i = 1; i<11; ++i){
                        
                        if(i ==1){
                            str+='<a class="active">'+ i + '</a>';
                        }else{
                            str+='<a>'+ i + '</a>';
                        }
                    }
                    
                    str+='<a>></a>';
                    $('#pg3').html(str);
                }else{
                    first_pagenumber3 = 1;//현재 줄에서 첫번째 페이지 카운트.
                    last_pagenumber3 = pagecount3;//현재 줄에서 마지막 페이지 카운트.
                    var str ='';
                    str+='<a><</a>';
                    for(var i = 1; i<pagecount3+1; ++i){
                        var id = 'bt' + i;
                        if(i ==1){
                            str+='<a class="active">'+ i + '</a>';
                        }else{
                            str+='<a>'+ i + '</a>';
                        }
                    }
                    
                    str+='<a>></a>';
                    $('#pg3').html(str);
                }
                
                
            }else{
                $('.insert_product3').html("상품이 없습니다.");
            }
        }
    });
}

function loadtable3(){
    
    
    $.ajax({
        type : "POST",
        url : "./listOld",
        data : {pagingnumber:active_pagenumber3},
        success : function(result) {
            
            var object = eval('(' + result + ')');
            var result2 = object.result;
            
            if(result2.length != 0){
                var product2='';
                
                for (var i = 0; i < result2.length; ++i) {
                    product2+='<div class="imgclass"><img src="' + result2[i][2].value 
                    + '" id="' + result2[i][0].value  + '"  width="100" height="100" onclick="openPopupReview('+ result2[i][0].value  +');"></img><br>'
                    + result2[i][0].value  + '</div>';
                }
                $('.insert_product3').html(product2);
            }else{
                $('.insert_product3').html("리뷰가 없습니다.");
            }
        }
    });
}



function loadpagebarNext3(){//Next 누를 경우.
    //total_pagenumber를 가지고 있다.
    
    if(active_pagenumber3>last_pagenumber3){
        //하단 페이지에 표시해줄 개수. 만약 10개 단위로 끊어서 생성, 10개가 안되면 10개 전으로 생성.
        if(total_pagenumber3>active_pagenumber3 + 9){
            
            first_pagenumber3 = active_pagenumber3;//현재 줄에서 첫번째 페이지 카운트.
            last_pagenumber3 = active_pagenumber3+9;//현재 줄에서 마지막 페이지 카운트.
            
            var str ='';
            str+='<a><</a>';
            for(var i = active_pagenumber3; i<active_pagenumber3+10; ++i){
                
                if(i ==active_pagenumber3){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('#pg3').html(str);
        }else{
            
            first_pagenumber3 = active_pagenumber3;//현재 줄에서 첫번째 페이지 카운트.
            last_pagenumber3 = total_pagenumber3;//현재 줄에서 마지막 페이지 카운트.
            
            var str ='';
            str+='<a><</a>';
            for(var i = active_pagenumber3; i<total_pagenumber3+1; ++i){
                var id = 'bt' + i;
                if(i ==active_pagenumber3){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('#pg3').html(str);
        }
    }else{
            var str ='';
            str+='<a><</a>';
            
            for(var i = first_pagenumber3; i<last_pagenumber3+1; ++i){
                
                if(i ==active_pagenumber3){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('#pg3').html(str);
    }
}

function loadpagebarCur3(){//현재 라인에 있는 버튼을 누를 경우.
    var str ='';
    str+='<a><</a>';
    
    for(var i = first_pagenumber3; i<last_pagenumber3+1; ++i){
        
        if(i ==active_pagenumber3){
            str+='<a class="active">'+ i + '</a>';
        }else{
            str+='<a>'+ i + '</a>';
        }
    }
    
    str+='<a>></a>';
    $('#pg3').html(str);
}

function loadpagebarPrev3(){//Prev 버튼을 누를 경우.
    if(active_pagenumber3 < first_pagenumber3){//줄이 바뀌어야함.
        if(start_pagenumber3<active_pagenumber3 - 9){
            
            first_pagenumber3 = active_pagenumber3-9;//현재 줄에서 첫번째 페이지 카운트.
            last_pagenumber3 = active_pagenumber3;//현재 줄에서 마지막 페이지 카운트.
            
            var str ='';
            str+='<a><</a>';
            for(var i = active_pagenumber3; i<active_pagenumber3+10; ++i){
                
                if(i ==active_pagenumber3){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('#pg3').html(str);
        }else{
            
            first_pagenumber3 = start_pagenumber3;//현재 줄에서 첫번째 페이지 카운트.
            last_pagenumber3 = active_pagenumber3;//현재 줄에서 마지막 페이지 카운트.
            
            var str ='';
            str+='<a><</a>';
            for(var i = start_pagenumber3; i<active_pagenumber3+1; ++i){
                var id = 'bt' + i;
                if(i ==active_pagenumber3){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('#pg3').html(str);
        }
    }else{
        var str ='';
        str+='<a><</a>';
        
        for(var i = first_pagenumber3; i<last_pagenumber3+1; ++i){
            
            if(i ==active_pagenumber3){
                str+='<a class="active">'+ i + '</a>';
            }else{
                str+='<a>'+ i + '</a>';
            }
        }
        
        str+='<a>></a>';
        $('#pg3').html(str);
    }
}



$(document).on("click","#pg3 a",function(event){
    if($(this).text() == "<"){//prev
        if(active_pagenumber3 > 1){
            active_pagenumber3 = active_pagenumber3 - 1;//현재 active_pagenumber 갱신.
            loadtable3();
            loadpagebarPrev3();
        }
    }
    else if($(this).text() == ">"){//next
        if(active_pagenumber3 < total_pagenumber3){
            active_pagenumber3 = active_pagenumber3 + 1;//현재 active_pagenumber 갱신.
            loadtable3();
            loadpagebarNext3();
        }
    }
    else{//본인이 누른 페이지.
        active_pagenumber3 = parseInt($(this).text());//현재 active_pagenumber 갱신.
        loadtable3();
        loadpagebarCur3();
    }
    });


$(document).on("click",".imgclass button",function(event){
    deletedata();
    });

function deletedata(){
    alert("deletedata function");
    //delete 신청.
    var deleteitem = $(this).closest('img').attr('id');
    alert(deleteitem);
    
        $.ajax({
            type :"POST",
            url : "./SearchProductServlet8",
            data : {pagingnumber:deleteitem
                },//값 전달.
            success : function(result) {
                
                if(result2 == 1){
                //삭제 완료.
                active_pagenumber2 = 1;//현재 페이지 카운트.
                start_pagenumber2 =0;//총 페이지 중 첫번째 카운트.
                first_pagenumber2 = 0;//현재 줄에서 첫번째 페이지 카운트.
                last_pagenumber2 = 0;//현재 줄에서 마지막 페이지 카운트.
                total_pagenumber2 = 0;//총 페이지 카운트.
                loadpagecount2();
                
            }else{
                //삭제 실패.
                alert('삭제 실패.');
            }
            }
        });
}

//다녀온 여행 리뷰팝업
function openPopupReview(id){
    window.open('Review.jsp?ProductID=' + id, '', 'status=no, height=900, width=900, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
}

//상품리스트에 신청과 리뷰 보기 팝업
function openPopupApply(id){
    window.open('ApplyProduct.jsp?ProductID=' + id, '', 'width=900, height=900, scrollbars= 0, toolbar=0, menubar=no');
}

// 모달
$(document).ready(function() {
	//리뷰페이지 처음 될때.
	//1. 회원ID로 회원의 사진 받아오기.
	//loaduserinfo();
	//2.상품ID로  상품의 이미지 가져오기.
	//loadproductinfo();
	});
	
function loaduserinfo(){
    var user_id = '<%= userID %>';
    
    $.ajax({
        type : "POST",
        url : "./ReviewServlet",
        data : {user_id:encodeURIComponent(user_id)	
        },
        success : function(result) {
            
        }
    });
}

function loadproductinfo(){
    var product_id = '<%= productID %>';
    
    $.ajax({
        type : "POST",
        url : "./ReviewServlet",
        data : {product_id:encodeURIComponent(product_id)
        },
        success : function(result) {
            
        }
    });
}

function submitFunction() {
    var comment = $('#comment').val();
    $.ajax({
        type : "POST",
        url : "./ReviewServlet",
        data : {comment : encodeURIComponent(comment)
        },
        success : function(result) {
            alert(result);
            if (result == 1) {
                alert('성공');
            } else {
                alert('실패');
            }
        }
    });
}

// Bootstrap Material DatePicker
$(function () {
    $('#start-date').bootstrapMaterialDatePicker({
        format: 'YYYY/MM/DD',
        time: false,
        weekend: 0,
        setDate: moment()
    })
});

$(function () {
    $('#end-date').bootstrapMaterialDatePicker({
        format: 'YYYY/MM/DD',
        time: false,
        weekend: 0,
        setDate: moment()
    })
});