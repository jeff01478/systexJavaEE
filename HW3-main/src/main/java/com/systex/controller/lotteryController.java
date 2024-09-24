package com.systex.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;
import com.systex.model.LotteryService;

/**
 * Servlet implementation class lotteryController
 */
public class lotteryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lotteryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher view;
		LinkedList<String> errorMsgs = new LinkedList<>(); //放錯誤訊息
		request.setAttribute("errors", errorMsgs);//Reques-Scope
		
		//1. Retrieve From Data
		String lottoCountString = (request.getParameter("lottoCount"));
		String excludeNumberString  = request.getParameter("excludeNumbers");
		int lottoCount = 0;
		LinkedList<Integer> excludeNumbersList = new LinkedList<>(); // 排除號碼的集合
		//2. Convert From Data
		//N/A
		//3. Validate From Data
		if(lottoCountString == null || lottoCountString.trim().isEmpty()) { //空白或去空白後還是空  
			errorMsgs.add("樂透張數必須填寫"); 
		}else {
			// 轉換為整數
			try {
				lottoCount = Integer.parseInt(lottoCountString);
				
				if(lottoCount <= 0) {
					errorMsgs.add("樂透張數必須大於0");
				}
			} catch (NumberFormatException e) {
				errorMsgs.add("樂透張數必須是數字");
			}
		}
		
		if(excludeNumberString == null || excludeNumberString.trim().isEmpty()) { //空白或去空白後還是空 
			errorMsgs.add("排除號碼必須填寫");
		} else {
			try {
				String[] excludeNumbers = excludeNumberString.split(" ");
				for(String num : excludeNumbers) {
					int number = Integer.parseInt(num.trim());
					if (number < 1 || number > 49) { 
						errorMsgs.add("排除號碼必須是1到49之間的數字");
					} else {
						excludeNumbersList.add(number); 
					}
				} 
			}catch (NumberFormatException e) {
		        errorMsgs.add("排除號碼必須是有效的數字");
		    }
		}
			
		if(!errorMsgs.isEmpty()) {
			view = request.getRequestDispatcher("main.jsp");
			view.forward(request, response);
			return; //把控制權還給Container
		}
		
		//4. Invoke Biz Logic
		try {
			LotteryService lotteryService = new LotteryService();
			ArrayList<Integer>[] lotteryResults = lotteryService.getNumbers(lottoCount, excludeNumbersList);

			request.setAttribute("lotteryResults", lotteryResults);//Request-Scope
			view = request.getRequestDispatcher("result.jsp");
			view.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			errorMsgs.add(e.getMessage());
			view = request.getRequestDispatcher("main.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
