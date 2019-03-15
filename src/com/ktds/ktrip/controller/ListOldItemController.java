package com.ktds.ktrip.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ktds.ktrip.dao.ItemDAO;
import com.ktds.ktrip.domain.ItemVO;

/**
 * Servlet implementation class SearchProductController3
 */
@WebServlet("/listOld")
public class ListOldItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListOldItemController() {
        super();
        // TODO Auto-generated constructor stub  
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	HttpSession session = request.getSession();

    	int user_id = (int)session.getAttribute("user_id");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ItemDAO item = new ItemDAO();
		ArrayList<ItemVO> itemList = item.searchcount3(user_id);
		for(int i = 0; i<itemList.size(); ++i) {
			result.append("[{\"value\": \"" + itemList.get(i).getApply_id() + "\"},");
			result.append("{\"value\": \"" + itemList.get(i).getTitle() + "\"},");
			result.append("{\"value\": \"" + itemList.get(i).getThumbnail() + "\"},");
			result.append("{\"value\": \"" + itemList.get(i).getConcept() + "\"}],");

		}
		result.append("]}");
		
		System.out.println("old get : " + result);
		response.getWriter().write(result.toString());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

    	int user_id = (int)session.getAttribute("user_id");
    	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int pagingnumber = Integer.parseInt(request.getParameter("pagingnumber"));
		int pageEnd = pagingnumber * 5;

		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ItemDAO item = new ItemDAO();
		ArrayList<ItemVO> itemList = item.searchcount3(user_id);
		
		if(pageEnd > itemList.size()) {
			pageEnd = itemList.size();
		}
		
		for(int i = pagingnumber*5-5; i<pageEnd; ++i) {
			result.append("[{\"value\": \"" + itemList.get(i).getApply_id() + "\"},");
			result.append("{\"value\": \"" + itemList.get(i).getTitle() + "\"},");
			result.append("{\"value\": \"" + itemList.get(i).getThumbnail() + "\"},");
			result.append("{\"value\": \"" + itemList.get(i).getConcept() + "\"}],");

		}
		result.append("]}");
		
		System.out.println("old post : " + result);
		
		response.getWriter().write(result.toString());

		
	}


}
