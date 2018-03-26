package campout.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.AutoCampDAO;

/**
 * This class handles the main functions of the application.
 * @author Justin Alderson
 *
 */
@WebServlet("/ControllerServlet")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		int databaseSize = (int) session.getAttribute("database_size");
		String command = (String) request.getParameter("command");
	
		if (command != null & databaseSize < 25) {
			switch (command) {
			case "CONFIRM":
				String emailHid = request.getParameter("hidden_email");
				String dateHid = request.getParameter("hidden_date");
				String phoneHid = request.getParameter("hidden_phone");
				String nightHid = request.getParameter("hidden_night");
				String spaceHid = request.getParameter("hidden_space");
				boolean ok = false;
				
				try (AutoCampDAO database = new AutoCampDAO();) {
					database.makeReservation(emailHid, phoneHid, dateHid, nightHid, spaceHid);
					ok = true;
				} catch (Exception e) {
					response.sendRedirect(request.getContextPath() + "/error.jsp");
				}
				
				if(ok) {
					response.sendRedirect(request.getContextPath() + "/finished.jsp");
				}
				break;
			case "RESERVE":
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String date = request.getParameter("date");
				String nights = request.getParameter("nights");
				String spaces = request.getParameter("space");
					
				session.setAttribute("session_email",email );
				session.setAttribute("session_phone", phone);
				session.setAttribute("session_date", date);
				session.setAttribute("session_nights", nights);
				session.setAttribute("session_spaces", spaces);
							
				response.sendRedirect(request.getContextPath() + "/confirm.jsp");
				break;
			case "BACK":
				//Problem with navigating back JSPs not supporting some html elements.
				response.sendRedirect(request.getContextPath() + "/index.jsp");
				break;
			default:
				response.sendRedirect(request.getContextPath() + "/index.jsp");
				break;

			}
		} else {
			
			response.sendRedirect(request.getContextPath() + "/full.jsp");
		}
		
	}

}
