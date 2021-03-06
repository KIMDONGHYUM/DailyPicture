<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.study.springboot.dto.DpNoticeDto" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	<% DpNoticeDto view_notice = (DpNoticeDto)session.getAttribute("view_notice"); %>
	
<style>

 		 * {
			margin:0 auto;
			padding:0;
			max-width:100%;
     		}
     		 
	#header{
            background-color: white;
            vertical-align: top;
            margin-top: -5px;
            margin-left: -5px;
            margin-right: -10px;
            padding-top: 40px;
        }
 	.own{
            width:2000px;
            color:gray; 
            border: thin solid rgb(240, 231, 231);
        }
    .headerpicture{
            text-align: center;
        }
        
        #wrapper {
       
        	display:flex;
        	padding: 30px;
        	padding-bottom:200px;
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
       
        #list{
      	   	
       		width: 250px;
            height: 300px;
            text-align: end;
            padding-top: 60px;
            padding-right: 80px;
       }
      
      #noticetable{
      		border: 3px solid  rgb(214, 206, 206);
      		border-top:none;
      		border-right:none;
      		border-left:none;
      		border-bottom:none;
      		border-collapse:collapse;
      		width:800px;
            height: auto;
      }
      #noticetable th {
      		text-align: center;
      		padding: 20px;
      		width:100px;
      }
      
      #noticetable td {
      		text-align: start;
      }
      #con {
      		padding-top:40px;
      		font-size:20px;
      		text-align:start;
      }
      #topMenu {
      		padding-top:30px;
      		height: 30px;
      		width: 850px;
      		padding-bottom:80px;
      }
      #topMenu ul li {
      		list-style:none;
      		background-color: rgb(230, 227, 227);
      		float: left;  
      		line-height: 50px;
      		vertical-align: middle;
      		text-align: center;
      }
      #topMenu .menuLink {
      		text-decoration:none;
      		color:white;
      		display:block;
      		width:280px;
      		font-size:15px;
      		font-weight: bold;		
      }
      #topMenu .menuLink:hover {
      		color: black;
      		background-color:white;
      }
</style>
</head>
<body>
		<div id="header">
       		<jsp:include page="Header.jsp" /> 
    	</div> 
    	
	    	<nav id="topMenu">
	    		<ul>
		    		<li><a class="menuLink" href="Infomation">공지사항</a></li>
		    		<li><a class="menuLink" href="Question">자주하는 질문</a></li>
		    		<li><a class="menuLink" href="1on1">1대1 문의</a></li>
	    		</ul>
	    	</nav>
    	
    	<div id="wrapper">
    		
    		<form action="DeleteNoticeAction" method="post">
	    		<div id="notice">	    			
	    			<table id="noticetable" width="500" >
	    				<input type="hidden" name="board_no" value="${ view_notice.board_no } ">
	    			
		    				<tr>
			    				<td style="font-size:50px; text-align:start"><b>${ view_notice.title }</td>
			    				<td style="text-align:end; padding-top:10px; font-size:15px;">
			    					<fmt:formatDate pattern="yyyy.MM.dd kk:mm" value="${view_notice.reg }"/><br>
			    					조회수 ${ view_notice.hit }
			    				</td>			    				
			    			</tr>   			
	    				<tr>
	    					<td id="con">${ view_notice.content }</td>
	    				</tr>      			
	    			</table>
	    			
			    			<div id="btns">
			    				<input type="button" class="btn btn-outline-primary" onclick="javascript:window.location='Infomation'" value="목록">
			    				<input type="button" class="btn btn-outline-success" onclick="javascript:window.location='modify_notice'" value="수정">
			    				<input type="submit" class="btn btn-outline-danger" value="삭제">
							</div>    		
	    		</div>
    		</form>
    	</div>
    	
</body>
</html>