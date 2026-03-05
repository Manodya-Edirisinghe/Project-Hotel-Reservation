package com.registereduser;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("id");
		boolean isTrue;
		isTrue=reservationController.deletedata(id);
		if(isTrue==true) {
			String alertMessage="Reservation Deleted Successfully";
			RequestDispatcher dispatcher = request.getRequestDispatcher("/GetAllServlet");
			dispatcher.forward(request, response);
		}
		else {
			List<reservationModel> reservationdetails=reservationController.getById(id);
			request.setAttribute("reservationdetails", reservationdetails);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("wrong.jsp");
			dispatcher.forward(request, response);
		}

	}

}
