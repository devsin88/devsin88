<%@page import="mybatis.vo.CommentVO"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
CommentVO[] vo =(CommentVO[])request.getAttribute("cvo");
%>
<%=JSONObject.wrap(vo) %>