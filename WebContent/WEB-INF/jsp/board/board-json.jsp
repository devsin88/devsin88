<%@page import="org.json.JSONObject"%>
<%@page import="mybatis.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Object object = request.getAttribute("vo");
	if(object != null){
%>
		{
		  "draw": ${draw},
		  "recordsTotal": ${recordsTotal },
		  "recordsFiltered": ${recordsTotal },
		  "data": <%=JSONObject.wrap((BoardVO[])object) %>
		}
<%
	}else{
%>
		{
		  "draw": ${draw},
		  "recordsTotal": 0,
		  "recordsFiltered": 0
		}
<%
	}
%>