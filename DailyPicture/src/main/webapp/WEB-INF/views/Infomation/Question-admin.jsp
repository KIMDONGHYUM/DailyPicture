<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.study.springboot.dto.DpQuestionDto" %>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	<% ArrayList<DpQuestionDto> list = (ArrayList<DpQuestionDto>)session.getAttribute("list"); 
		String list_page = (String)session.getAttribute("page");
		String page1_active = "";
		String page2_active = "";
		String page3_active = "";
		if(list_page.equals("1"))
			page1_active = "active";
		if(list_page.equals("2"))
			page2_active = "active";
		if(list_page.equals("3"))
			page3_active = "active";
	%>
	<script>
		function ChangeView(value) {
			if(value== "0") {
				location.href="write_question";
				}
			else if(value=="1") {
				location.href="modifyqna";
				}
			else if(value=="2") {
				location.href="deleteqna";
				}
			
			}
	</script>
<style>

 		 * {
			margin:0 auto;
			padding:0;
			max-width:100%;
     		}
     		 
	#header {
            background-color: white;
            vertical-align: top;
            margin-top: -5px;
            margin-left: -5px;
            margin-right: -10px;
            padding-top: 40px;
            text-align: center;
        	}
        	
 	   .own {
            width:2000px;
            color:gray; 
            border: thin solid rgb(240, 231, 231);
        	}
        	      
        #wrapper {
        	display:flex;
        	padding: 30px;       	
        	}
        
        #title {
        	width:200px;
        	height:100%;
        	position:fixed;
        	padding-left: 80px;
        	text-align:end;
        	}
        	
        #title a {
        	text-decoration: none;
        	padding-top:40px;
        	}
        	
        	
       #btns {
       		padding-top: 10px;
       		text-align:end;
       		}
       
       #list {     	   
       		width: 200px;
            height: 300px;
            text-align: end;           
            padding-right: 70px;
      		}
      
      #noticetable{
      		border: 3px solid  rgb(214, 206, 206);
      		border-right:none;
      		border-left:none;
      		border-bottom:none;		
      		width:900px;
            height: auto;
      		}
      		
      #noticetable th {
      		text-align: center;
      		padding:10px;
      		border-right:hidden;
      		border-left:hidden;
      		}
      
      #noticetable td {
      		text-align: center;
      		padding:20px;
      		border-right:hidden;
      		border-left:hidden; 		
      		}
      
      #notice a {color:black;} 
         		      		        
      nav {text-align:center;}
      	
</style>
</head>
<body>
		<div id="header">
       		<jsp:include page="Header.jsp" /> 
    	</div> 
    	
    	<div id="wrapper">
    		<div id="title">
    		
    			<table id="list">
	    			<tr><td><h2><b>고객센터</b></h2></td></tr>
	    			<tr><td><a href="Infomation">공지사항</a></td></tr>
	    			<tr><td><h3><b><a href="Question">자주하는 질문</a></b></h3></td></tr>
	    			<tr><td><a href="1on1">1대1 문의</a></td></tr>
    			</table>
    		</div>
    		
    		<div id="notice">
    			<h4><b>자주하는질문</b></h4>
    			<table id="noticetable" width="500" cellpadding="0" cellspacing="0" border="5">
    				<tr>
	    				<th style="width:60px;">번호</th>
	    				<th style="width:120px;">카테고리</th>
	    				<th style="width:500px;">내용</th>
	    				<!-- <th style="width:90px;">작성자</th> -->
	    				<th style="width:170px;">등록일</th>
    				</tr>
    				<c:forEach var="dto" items="${ qlist }" >
	    				<tr>
	    				<td>${dto.board_no}</td>
	    				<td>${dto.category}</td>
	    				<td><a href="view_question?board_no=${ dto.board_no }">${dto.title}</a></td>
	    				<%-- <td>${dto.writer}</td> --%>
	    				<td><fmt:formatDate pattern="yyyy-MM--dd" value="${dto.reg}"/></td>
	    				</tr>
	        		</c:forEach>	
    			</table>
    			<div id="btns">
    				<button class="btn btn-outline-primary" onclick="ChangeView(0)">글작성</button>
				</div>    		
    		</div>
    	</div>
    	<nav aria-label="...">
	  	<ul class="pagination">
		    <li class="page-item">
		      	<a class="page-link" href="Question?page=1"><<</a>
		    </li>
		    <li class="page-item <%= page1_active %>">
		    	<a class="page-link"  href="Question?page=1">1</a>
		    </li>
		    <li class="page-item <%= page2_active %>">
		      	<a class="page-link" href="Question?page=2">2</a>
		    </li>
		    <li class="page-item <%= page3_active %>">
		    	<a class="page-link" href="Question?page=3">3</a>
		    </li>
		    <li class="page-item">
		      	<a class="page-link" href="Question?page=3">>></a>
		    </li>
	  	</ul>
	</nav>
</body>
</html>