<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
	<style type="text/css">
	</style>
    
	<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	</script>
	<!-- 하위 3개를 적어야 가능, JQ, 부트스트랩 밑에 작성 할 것 -->
	<script type="text/javascript" src="/lee/resources/js/alertifyjs/alertify.min.js"></script>
	<link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/alertify.min.css">
	<link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/themes/default.min.css">
	<link rel="stylesheet" href="/lee/resources/index/index.css">

	
    
  <script>
  $(function(){
	  
	  
	  
	  $("#search-input").focus( function() {
		  
	      $("#search-statusBar").css("display","none");
	  });
	  $("#search-input").blur( function() {
		  
	      $("#search-statusBar").css("display","inline");
	  });
	  
	  $(".scroll").click(function(event){            
          event.preventDefault();
          $('html,body').animate({scrollTop:$(this.hash).offset().top}, 1200);
  });
  });
  
  
  </script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      
      <script>
      
     var datedata;
     var wwidthc;
     var wheightc;
     var top01, left01,
     	top02, left02,
     	top03, left03,
     	top04, left04,
     	top05, left05,
     	top06, left06,
     	top07, left07,
     	topbg, lefbg;
      
        $( function() {
       
        $(document).mousemove(function(e){
            var top01move = (e.pageY-wwidthc)*0.05;
            var left01move = (e.pageX-wheightc)*0.05;
            
            $("#parallax_octocat").css({
            	'top':top01 + top01move,
            	'left':left01 + left01move
            });
            
            $("#parallax_error_text").css({
            	'top':top02 - top01move,
            	'left':left02 - left01move
            });
            
            $("#parallax_speeder").css({
            	'top':top03 - top01move,
            	'left':left03 + left01move
            });
            
            $("#parallax_octocatshadow").css({
            	'top':top04 + left01move,
            	'left':left04 - top01move
            });
            
            $("#parallax_speedershadow").css({
            	'top':top05 - left01move,
            	'left':left05 - top01move
            });
            
            $("#parallax_building_1").css({
            	'top':top06 - top01move,
            	'left':left06 - left01move
            });
            
            $("#parallax_building_2").css({
            	'top':top07 - top01move,
            	'left':left07 - left01move
            });
             
            
            
        });
        $(window).scroll(function () {
    		
	        	var height = $(document).scrollTop();
	        	$("#parallax_bg").css({
	            	'top':topbg + height*0.8
	            	
	            });
        	}); 
        
        
   		 $( "#datepicker" ).datepicker({
   			monthNames: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ],
   			onSelect: function(dateText) {
   				
			   				var day_s = dateText.split("/");
			   				var day = parseInt(day_s[1])-1;
			   				document.getElementById("datepickerdetail").innerText =day_s[2]+"년"+day_s[0]+"월"+day_s[1]+"일";
			   				
			   				for(var k = 0 ; k < datedata.length ; k++){
			   					
			   					var bb = datedata[k].solar_Date.split('-');
				            	var dd = parseInt(bb[2])-1; 
				            	if(dd==day){
				            		if(datedata[k].memo){
				            			document.getElementById("datepickerdetail").innerText = document.getElementById("datepickerdetail").innerText +"\n"+ datedata[k].memo;
				            		}else{
					   					/* document.getElementById("datepickerdetail").innerText = day_s[2]+"년"+day_s[0]+"월"+day_s[1]+"일"; */
					   					
					   				}
				            		
				            	}
			   				}
			   				
			   				
			   				
   			  			}
   		 });
   		 
   		$( "#datepicker" ).on("DOMSubtreeModified",function() {
   					for(var k = 0 ; k < datedata.length ; k++){
	   					
   						if(datedata[k].memo){
			            		
			            		var bb = datedata[k].solar_Date.split('-');
				            	var dd = parseInt(bb[2])-1; 
				            	var change = document.getElementsByClassName('ui-state-default')[dd];
				            	$(change).css('border','3px solid red');
				            	
			            		
			            	}else{
			            		var change = document.getElementsByClassName('ui-state-default')[k];
				            	
				            	$(change).css('border','1px solid #c5c5c5');
			            	}
		            }
   					return;
   					
   		});
   		
   		/*  $("table").on('click','.ui-state-hover',function(){
   			 alert('날짜 버튼 눌림');
	   				for(var i = 0 ; i < datedata.length ; i++){
		            	if(datedata[i].memo){
		            	var change = document.getElementsByClassName('ui-datepicker-calendar')[0].getElementsByClassName('ui-state-default')[i];
		            	$(change).css('border-color','red');
		            	}
		            }
   			 
   		 }); */
   		 
   		 $(document).on('click','.ui-datepicker-prev, .ui-datepicker-next',function(){
   				
	   	        	
	   	        	var yr = document.getElementsByClassName('ui-datepicker-year')[0].innerText;
	   	        	var mon = document.getElementsByClassName('ui-datepicker-month')[0].innerText;
	   	        	
	   	        	document.getElementById("datepickerdetail").innerHTML = "";
	   	        	console.log(yr+'/'+mon);
	   	        	$.ajax({
	   			        url : "getHoliday.ju",
	   			        type: "get",
	   			        data : {"yr":yr,"mon":mon},
	   			        dataType:"json",
	   			        
	   			        success : function(responseData){
	   			        	$("#ajax").remove();
	   			            
	   			            datedata = responseData.hdto;
	   			            
	   			            if(!datedata){
	   			            	alertify.alert("", "데이터를 받지 못함");
	   			            }else{
	   			            	
	   				            for(var i = 0 ; i < datedata.length ; i++){
	   				            	
	   				            	if(datedata[i].memo){
	   				            		
	   				            		var bb = datedata[i].solar_Date.split('-');
		   				            	var dd = parseInt(bb[2])-1; 
		   				            	var change = document.getElementsByClassName('ui-datepicker-calendar')[0].getElementsByClassName('ui-state-default')[dd];
		   				            	
		   				            	$(change).css('border','3px solid red');
		   				            	
	   				            		
	   				            	}else{
	   				            		var change = document.getElementsByClassName('ui-datepicker-calendar')[0].getElementsByClassName('ui-state-default')[i];
		   				            	
		   				            	$(change).css('border','1px solid #c5c5c5');
	   				            	}
	   				            }
	   			            }
	   			           	
	   			        },
	   			        error: function(request,status,error){
	   			        	
	   			        	alertify.alert("","code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	   			        }
	   		   		 });
   	        
   		 });
   		 
   		
   		
        });
        
        
        $("body").ready(function(){
        	text='저희 립서비스에 오신 당신을 환영합니다.흐흐. 현재위치는 첫화면입니다. 오디오북을 읽으시려면 오디오북 실행 이라고 말씀해 주세요.'
        	speechSynthesis.speak(new SpeechSynthesisUtterance(text));
        	
        	wwidthc = $(window).width()/2;
            wheightc = $(window).height()/2;
            top01 = parseInt($("#parallax_octocat").css('top'), 10);
            left01 = parseInt($("#parallax_octocat").css('left'), 10);
            
            top02 = parseInt($("#parallax_error_text").css('top'), 10);
            left02 = parseInt($("#parallax_error_text").css('left'), 10);
            
            top03 = parseInt($("#parallax_speeder").css('top'), 10);
            left03 = parseInt($("#parallax_speeder").css('left'), 10);
            
            top04 = parseInt($("#parallax_octocatshadow").css('top'), 10);
            left04 = parseInt($("#parallax_octocatshadow").css('left'), 10);
            
            top05 = parseInt($("#parallax_speedershadow").css('top'), 10);
            left05 = parseInt($("#parallax_speedershadow").css('left'), 10);
            
            top06 = parseInt($("#parallax_building_1").css('top'), 10);
            left06 = parseInt($("#parallax_building_1").css('left'), 10);
            
            top07 = parseInt($("#parallax_building_2").css('top'), 10);
            left07 = parseInt($("#parallax_building_2").css('left'), 10);
            
            topbg = parseInt($("#parallax_bg").css('top'), 10);
            leftbg = parseInt($("#parallax_bg").css('left'), 10);
            
            
        	var yr = document.getElementsByClassName('ui-datepicker-year')[0].innerText;
        	var mon = document.getElementsByClassName('ui-datepicker-month')[0].innerText;
        	
        	console.log(yr+'/'+mon);
        	$.ajax({
		        url : "getHoliday.ju",
		        type: "get",
		        data : {"yr":yr,"mon":mon},
		        dataType:"json",
		        
		        success : function(responseData){
		            
		        	$("#ajax").remove();
		            datedata = responseData.hdto;
		            
		            if(!datedata){
		            	alertify.alert("","데이터를 받지 못함");
		            }else{
			            for(var i = 0 ; i < datedata.length ; i++){
			            	if(datedata[i].memo){
				            		
				            	var bb = datedata[i].solar_Date.split('-');
   				            	var dd = parseInt(bb[2])-1; 
   				            	var change = document.getElementsByClassName('ui-datepicker-calendar')[0].getElementsByClassName('ui-state-default')[dd];
   				            	$(change).css('border','3px solid');
   				            	$(change).css('border-color','red');
   				            	
				            		
				            	}
			            }
			            $(".ui-datepicker-today")[0].click();
			            
		            }
		           	
		        },
		        error: function(request,status,error){
		        	
		        	alertify.alert("","code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        	 
		        }
	   		 });
        	
        	
        	
        });
   
        </script>
  <style>
  body {
	font-family: Arial, Helvetica, sans-serif;
}
table {
	font-size: 1em;
}
.ui-draggable, .ui-droppable {
	background-position: top;
}
/* 패럴관련 css */
@MEDIA (min-width: 992px){
 #parallax_illustration {
        display: block;
        margin: 0 auto;
        width: 940px;
        height: 500px;
        position: relative;
        overflow: hidden;
        clear: both;
      }
}      
@MEDIA (max-width: 991px){
	#parallax_illustration{
		display:none;
	}
	#qnadiv{
		display:none;
	}
}
	
 #parallax_wrapper {
        position: relative;
        z-index: 0;
        -webkit-transition: all 0.25s ease-in;
        transition: all 0.25s ease-in;
      }
      #parallax_field {
        overflow: hidden;
        position: absolute;
        left: 0;
        top: 0;
        height: 700px;
        width: 100%;
      }
      #parallax_field #parallax_bg {
        position: absolute;
        top: -150px;
        /* left: -20px; */
        width: 120%;
        height: 150%;
        z-index: 1;
      }
     
      #parallax_illustration img {
        position: absolute;
      }
      #parallax_illustration #parallax_error_text {
        top: 72px;
        left: 72px;
        z-index: 10;
      }
      #parallax_illustration #parallax_octocat {
        top: 94px;
        left: 306px;
        z-index: 9;
      }
      #parallax_illustration #parallax_speeder {
        top: 50px;
        left: 532px;
        z-index: 8;
      }
      #parallax_illustration #parallax_octocatshadow {
        top: 357px;
        left: 211px;
        z-index: 7;
      }
      #parallax_illustration #parallax_speedershadow {
        top: 363px;
        left: 802px;
        z-index: 6;
      }
      #parallax_illustration #parallax_building_1 {
        top: 383px;
        left: 467px;
        z-index: 5;
      }
      #parallax_illustration #parallax_building_2 {
        top: 103px;
        left: 762px;
        z-index: 4;
      }
  
		  .wrap {
		    width: 100%;
		    height: 100%;
		    margin: 0 auto;
		}
		.wrap .section {
		    height: 69px;
		    padding: 100px 0;
		    background: #000;
		   display: block;
		}
		.wrap .section p {
		   display: block;
		   color: #fff;
		   text-align: center;
		   font-size: 22px;
		}
		.down {
		   position: relative;
		   margin: 0 auto;
		   cursor: pointer;
		   width: 0;
		   height: 0;
		   border-right: 17px solid transparent;  
		   border-left: 17px solid transparent; 
		   border-top: 25px solid #fff;
		} 
  </style>
</head>
<body>
<%@include file="header.jsp" %>
<!-- 검색 컨테이너 -->
<div class="jumbotron">
<div id="parallax_wrapper">
<div id="imgg">    
      <div id="parallax_field">
        <img alt="" class="js-plaxify" data-invert="true" data-xrange="0" data-yrange="20" height="100%" id="parallax_bg" width="940"
        src="/lee/resources/index/main04.png">
      </div>
      <div id="parallax_illustration">
        <div id="auth"></div>
<a href="#notice-bbs" class="scroll">
        <img alt="404 &ldquo;This is not the web page you are looking for&rdquo;" class="js-plaxify" data-xrange="20" data-yrange="10" height="90" id="parallax_error_text" width=""
        src="/lee/resources/index/i/i1.png">
</a>
<a href="#notice-bbs" class="scroll">
        <img alt="" class="js-plaxify" data-xrange="10" data-yrange="10" height="90" id="parallax_octocat" width=""
        src="/lee/resources/index/i/i2.png">
</a>
<a href="#notice-bbs" class="scroll">
        <img alt="" class="js-plaxify" data-xrange="10" data-yrange="10" height="90" id="parallax_speeder" width=""
        src="/lee/resources/index/i/i3.png">
</a>
<a href="#notice-bbs" class="scroll">
        <img alt="" class="js-plaxify" data-xrange="10" data-yrange="10" height="90" id="parallax_octocatshadow" width=""
        src="/lee/resources/index/i/i4.png">
</a>
<a href="#notice-bbs" class="scroll">
        <img alt="" class="js-plaxify" data-xrange="10" data-yrange="10" height="90" id="parallax_speedershadow" width=""
        src="/lee/resources/index/i/i5.png">
</a>
<a href="#notice-bbs" class="scroll">
        <img alt="" class="js-plaxify" data-invert="true" data-xrange="50" data-yrange="20" height="90" id="parallax_building_1" width=""
        src="/lee/resources/index/i/i6.png">
</a>
<a href="#notice-bbs" class="scroll">
        <img alt="" class="js-plaxify" data-invert="true" data-xrange="75" data-yrange="30" height="90" id="parallax_building_2" width=""
        src="/lee/resources/index/i/i7.png">
</a>
      </div>
</div>
</div>
 <!-- <img id="imgg" src="/lee/resources/index/main.png" > -->
 <div class="container text-center">
		 <div id="searchbar" style="position: relative 50%;">   
			    <div class="input-group input-group-lg">
				 	 <span class="input-group-addon" id="sizing-addon1">
					 	 <span class="glyphicon glyphicon-book" aria-hidden="true"></span>
					 	 </span>
				 	 <input id="search-input" type="text" class="form-control" placeholder="검색어 입력" aria-describedby="sizing-addon1">
				 	 <span id="search-statusBar">
				 	 	<span id="search-status" class="glyphicon glyphicon-search btn-lg"></span>
				 	 </span> 
				</div> 
		 </div>
		 
		 
 </div>
 
</div>
  
  <!-- 첫번째줄 -->
<div class="container-fluid bg-3 text-center">    
  <!-- <h3>Some of my Work</h3><br> -->
  
  <div class="row">
  	
    <div id="notice-bbs" class="col-sm-8" style="height:400px; ">
    <div class="thumbnail" style="text-align:center; height:100%; width:100%; margin-bottom:0px;">
     		 <h3>공지사항</h3>
  	<c:set var="notilist" value="${notilist}"/>
  	
	<table class="table table-striped table-hover" style="width:100%;font-size:large;">
					<thead>
						<tr>
							<th style="text-align:center;width:65%">제목</th>
							<th style="text-align:center;width:20%">작성일</th>
							<th style="text-align:center;width:15%">조회수</th>
						</tr>
					</thead>
		<tbody>
		
			<c:choose>
				<c:when test="${empty notilist}">
					<tr>
						<td colspan="3">공지사항이 없습니다.</td>
					</tr>
				</c:when>
				<c:when test="${notilist ne null}">
					<c:forEach items="${notilist}" begin="0" end="4" step="1" var="list">
								<tr>
								
									<td >
									<a href="/lee/noticeContent.ju?nt_idx=${list.nt_idx}" style="color:black;">${list.nt_subject}</a>
									</td>
									<td>${list.nt_date}</td>
									<td> ${list.nt_readnum}</td>
								
							</tr>
							
						
					</c:forEach>
				</c:when>
			</c:choose>
	
     	</tbody> 	
    </table>
				      
      
      
      </div>
      
    </div>
    
    <div id="calen" class="col-sm-4 sidenav" style="height:400px; ">
      
      
      <div class="thumbnail" style="text-align:center; height:100%; padding:0px;">
     		 <h4>캘린더</h4>
      	<div id="datepicker" style="display:inline-block;"></div>
        <div class="caption">
	        <p>세부일정</p>
	       <div class="thumbnail">
	        <div id="datepickerdetail" style="margin-top:0px;width:250px;height:;font-size:large;">
	        </div>
	       </div>
        </div>  
      
      
      </div>
    </div>
  </div>
</div><br>


<!-- 두번째줄 -->
<div id="allbutton" class="container-fluid bg-3 text-center">

  <div class="row" style="width:100%;">
  <div class="indexbt1row">
  		
	    <div class="col-sm-offset-1 col-sm-2">
<c:set var="csid" value="${sessionScope.sid}"/>
<c:choose>
	
	<c:when test="${empty csid}">
	<!-- 일반사용자/비로그인 -->
		<h3>My-page</h3>
	      <a href="/lee/myCard.ju">
	      <img src="/lee/resources/index/qbutton/mypage.png" id="mypageimg" class="img-responsive" style="width:100%" alt="Image">
	      <img src="/lee/resources/index/qbutton/mycard01.png" id="mycardimg" class="img-responsive" style="width:100%" alt="Image">
	      </a>
	</c:when>
	<c:when test="${csid ne 'libadmin'}">
	<!-- 일반사용자/비로그인 -->
		<h3>My-page</h3>
	      <a href="/lee/myCard.ju">
	      <img src="/lee/resources/index/qbutton/mypage.png" id="mypageimg" class="img-responsive" style="width:100%" alt="Image">
	      <img src="/lee/resources/index/qbutton/mycard01.png" id="mycardimg" class="img-responsive" style="width:100%" alt="Image">
	      </a>
	</c:when>
	
	<c:when test="${csid eq 'libadmin'}">
	<!-- 관리자 로그인 -->
		<h3>관리자 메뉴</h3>
	      <a href="/lee/adminIndex.ju">
	      <img src="/lee/resources/index/qbutton/mypage.png" id="mypageimg" class="img-responsive" style="width:100%" alt="Image">
	      <img src="/lee/resources/index/qbutton/mycard01.png" id="mycardimg" class="img-responsive" style="width:100%" alt="Image">
	      </a>
	</c:when>
</c:choose>
	      
	    </div>
	    <div class="col-sm-2"> 
	      <h3>E-book</h3>
	      <a href="/lee/ebook.ju">
	      <img src="/lee/resources/index/qbutton/ebook02.png" class="img-responsive" style="width:100%" alt="Image">
	      </a>
	    </div>
   </div>
   <div class="indexbt2row">		
	    <div class="col-sm-2"> 
	      <h3>Audiobook</h3>
	      <a href="/lee/eAudio.ju">
	      <img src="/lee/resources/index/qbutton/audiobook03.png" class="img-responsive" style="width:100%" alt="Image">
	      </a>
	    </div>
	    <div class="col-sm-2"> 
	      <h3>Education</h3>
	      <a href="/lee/eEdu.ju">
	      <img src="/lee/resources/index/qbutton/edu.png" class="img-responsive" style="width:100%" alt="Image">
	      </a>
	    </div>
    </div>
    
	    <div class="col-sm-2" id="qnadiv">
	      <h3>Q&A</h3>
	      <a href="/lee/questList.ju">
	      <img src="/lee/resources/index/qbutton/bbs04.png" class="img-responsive" style="width:100%" alt="Image">
	      </a>
	    </div>
	
  </div>
</div><br>

<!-- 세번째줄 -->
<div id="favorbook" class="container-fluid bg-3 text-center">


  <div class="row" style="width:100%; height:400px;">
	  
	    <div class="col-md-8" style="text-align:center; height:100%;">
	      <div class="thumbnail" style="text-align:center; height:100%;">
	        <h3>이달의 추천도서</h3>
	        <div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel" style="background-color:rgba(11, 211, 146, 0.5 );height:356px; border-radius: 10px;">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							</ol>
	
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox" style="text-align:center;">
	<c:set var="bklist" value="${bklist}"/>
	<c:choose>
		<c:when test="${empty bklist}">
		
							
								<div class="item active" style="padding-left:23%; padding-top:10px;">
									<img src="/lee/resources/index/button.gif" alt="">
									<div class="carousel-caption">
									<h3>추천도서</h3>
	    							<p>추천도서가 없습니다.</p>
									</div>
								</div>
								
							
							
		</c:when>
		<c:when test="${bklist ne null }">
			<c:forEach	items="${bklist }" var="list" begin="0" end="0">
								<div class="item active" style="padding-left:15%;padding-top:10px; ">
									<img src="${list.bk_url}" alt="" style="height:310px;">
									<div class="carousel-caption" style="background-color: rgba(0,0,0,0.7); margin-left:30%;width:250px">
									<h3>${list.bk_subject}</h3>
	    							<p>${list.bk_writer}</p>
									</div>
								</div>
			</c:forEach>
			<c:forEach	items="${bklist }" var="list" begin="1" end="2">
			
							
								<div class="item" style="padding-left:15%;padding-top:10px; ">
									<img src="${list.bk_url}" alt="" style="height:310px;">
									<div class="carousel-caption" style="background-color: rgba(0,0,0,0.7); margin-left:30%;width:250px">
									<h3>${list.bk_subject}</h3>
	    							<p>${list.bk_writer}</p>
									</div>
								</div>
								
							
			</c:forEach>		
		</c:when>
	</c:choose>
	</div>
						
	
							<!-- Controls -->
							<a class="left carousel-control" href="#carousel-example-generic"
								role="button" data-slide="prev" style="border-top-left-radius: 10px; border-bottom-left-radius: 10px;"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control"
								href="#carousel-example-generic" role="button" data-slide="next" style="border-top-right-radius: 10px; border-bottom-right-radius: 10px;">
								<span class="glyphicon glyphicon-chevron-right"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>

				</div>
	    </div>

	    
	    <div class="col-md-4" style="text-align:center; height:100%;">
	      <div class="thumbnail" style="text-align:center; height:100%;">
	        <h3>전자도서관 추천 자료</h3>
	        
	        <div class="thumbnail" style=" height:356px; border-radius: 10px; background-color:rgba(11, 211, 146, 0.5 );">
		    		 <div class="carousel-inner" role="listbox" style="text-align:center;">
	<c:set var="eliblist" value="${eliblist}"/>
	<c:choose>
		<c:when test="${empty eliblist}">
					<div class="item active">
							<img src="/lee/resources/index/button.gif" alt="">
							<div class="carousel-caption" style="background-color: rgba(0,0,0,0.7);">
							<h3>추천도서가 없습니다.</h3>
   							<p>책1입니다</p>
							</div>
							
					</div>
		</c:when>
		<c:when test="${eliblist ne null }">
			<c:forEach items="${eliblist}" var="list" begin="0" end="0">
						<div class="item active">
							<img src="${list.el_path}" alt="" style="height:310px;">
							<div class="carousel-caption" style="background-color: rgba(0,0,0,0.7);">
							<h3>${list.el_subject}</h3>
   							<p>${list.el_writer}</p>
							</div>
							
						</div>
				</c:forEach>
		</c:when>
	</c:choose>	    		 
						
   			</div>
   			 	
	      </div>
	    </div>
	
  </div>
</div><br>

</div>
    
<!-- <footer class="container-fluid text-center">
  
</footer> -->
<%@include file="footer.jsp" %>
</body>

</html>