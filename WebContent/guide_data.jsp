<%@page import="com.ktds.ktrip.domain.ItemVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- guide_data.jsp --%>    
<%
   ItemVO vo = (ItemVO)request.getAttribute("item");
%>
{
"title":"<%=vo.getTitle() %>",
"num_min":"<%=vo.getNum_min() %>",
"num_max":"<%=vo.getNum_max() %>",
"duration":"<%=vo.getDuration() %>",
"price":"<%=vo.getPrice() %>",
"concept":"<%=vo.getConcept() %>",
"thumbnail":"<%=vo.getThumbnail() %>",
"contents":"<%=vo.getContents()%>"
}
