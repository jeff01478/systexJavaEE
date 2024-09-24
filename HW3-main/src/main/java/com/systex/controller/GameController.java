package com.systex.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.LinkedList;

import javax.management.loading.PrivateClassLoader;

import org.eclipse.tags.shaded.org.apache.bcel.generic.I2F;

import com.systex.model.GuessGame;

/**
 * Servlet implementation class GameController
 */
public class GameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		GuessGame game = (GuessGame) session.getAttribute("game");

        if (game == null) {
            game = new GuessGame(10, 3);
            session.setAttribute("game", game);  // 將遊戲保存到 session 中
        }
        
        String action = request.getParameter("action");
        // 偷看答案
        if ("peek".equals(action)) {
            int answer = game.getAnswer();
            request.setAttribute("answer", answer);  // 將答案傳遞到 JSP
            RequestDispatcher view = request.getRequestDispatcher("guess.jsp");
            view.forward(request, response);
            return;
        }
        
        if (request.getParameter("guess") == null) {
            request.setAttribute("remains", game.getRemains());
            RequestDispatcher view = request.getRequestDispatcher("guess.jsp");
            view.forward(request, response);
            return;
        }
        
        LinkedList<String> errorMsgs = new LinkedList<>();
        String guessString = request.getParameter("guess");
        
        // 檢查輸入是否為空或空白
        if (guessString == null || guessString.trim().isEmpty()) {
            errorMsgs.add("請輸入有效的數字！");
            request.setAttribute("errorMsgs", errorMsgs);  // 將錯誤信息傳遞到 JSP 頁面
            request.setAttribute("remains", game.getRemains());  // 更新剩餘次數
            RequestDispatcher view = request.getRequestDispatcher("guess.jsp");
            view.forward(request, response);
            return;
        }
        
        int guess = 0;
        
        try {
            guess = Integer.parseInt(guessString);  // 嘗試將輸入轉換為整數
            
            // 檢查是否在1到10之間
            if(guess < 1 ||guess > 10) {
            	errorMsgs.add("請輸入1到10之間的數字!");
            }
        } catch (NumberFormatException e) {
            errorMsgs.add("請輸入有效的數字！");
        }
        
        if(!errorMsgs.isEmpty()) {
            request.setAttribute("errorMsgs", errorMsgs);  // 將錯誤信息傳遞到 JSP 頁面
            request.setAttribute("remains", game.getRemains());  // 更新剩餘次數
            RequestDispatcher view = request.getRequestDispatcher("guess.jsp");
            view.forward(request, response);
            return;
        }
		
		// 猜測結果
		boolean correct = game.guess(guess);
		String resultPage;
		
		if(correct) {
			resultPage = "youWin.jsp";
			session.removeAttribute("game");
		}else if(game.getRemains() <= 0) {
			resultPage = "youLose.jsp";
			session.removeAttribute("game");
		}else {
			request.setAttribute("remains", game.getRemains());
			resultPage = "guess.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(resultPage);
		view.forward(request,response);
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
