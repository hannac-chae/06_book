package book.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.dao.BookDaoIf;
import book.dao.BookDaoImpl;
import book.exception.NotFoundException;
import book.vo.Book;

/**
 * 모든 요청을 받아들이는 컨트롤러 서블릿 클래스
 * 프론트 컨트롤러(Front Controller)
 */
@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 서비스 메소드를 프론트 컨트롤러 메소드를 작성
	 * 모든 서비스는 action 이라는 이름의 파라미터로 수행할 작업을 추가하여 요청될 것.
	 * 
	 * 프론트 컨트롤러는 
	 * 1. 공통 작업을 수행
	 * 2. action 값에 따라 서브 컨트롤러로 분기
	 */
	protected void service(HttpServletRequest request
			           , HttpServletResponse response) throws ServletException, IOException {
		// 1. 공통작업
		// 요청으로부터 action 파라미터 추출
		String action = request.getParameter("action");
		
		
		System.out.println("action=" + action + ", method=" + request.getMethod());
		
		// 2. 서브 컨트롤러 분기
		if ("select".equals(action)) {
			select(request, response);
			
		} else if ("detail".equals(action)) {
			detail(request, response);
			
		} else if ("update".equals(action)) {
			update(request, response);
			
		}
		
	}

	/**
	 * 도서 정보 1건을 수정하는 메소드
	 * GET 으로 들어올 시 수정을 위한 화면 제공
	 * POST 로 들어올 시 수정 내용을 반영
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void update(HttpServletRequest request
			          , HttpServletResponse response) throws ServletException, IOException {
		
		// 1. GET, POST 중 어떤 HTTP 메소드로 들어왔는지 추출
		String method = request.getMethod();
		
		if ("GET".equals(method)) {
			// 2. GET 으로 진입한 경우 수정을 위한 화면 제공
			// (1) 요청으로 전달된 파라미터중 bookSeq 추출
			int bookSeq = Integer.valueOf(request.getParameter("bookSeq"));
			
			// (2) bookSeq 에 해당하는 북 객체 1건 조회
			BookDaoIf dao = new BookDaoImpl();
			
			Book book = new Book();
			book.setBookSeq(bookSeq);
			List<Book> books = dao.select(book);
			
			// (3) 조회된 Book 객체 요청에 추가
			request.setAttribute("book", books.get(0));
			
			// (4) 수정 가능한 화면으로 이동
			String content = "/updateBook";
			request.setAttribute("content", content);
			
			String view = "/index";
			request.getRequestDispatcher(view).forward(request, response);
			
		} else if ("POST".equals(method)) {
			// 3. POST 로 진입한 경우 수정된 내용을  DB 에 반영
			// (1) 요청 파라미터 추출
			int bookSeq = Integer.valueOf(request.getParameter("bookSeq"));
			String isbn = request.getParameter("isbn");
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			String content = request.getParameter("content");
			int companyCd = Integer.valueOf(request.getParameter("companyCd"));
			int totalPage = Integer.valueOf(request.getParameter("totalPage"));
			int price = Integer.valueOf(request.getParameter("price"));
			int quantity = Integer.valueOf(request.getParameter("quantity"));
			String modId = "1";
			
			// (2) 요청 파라미터 맵 객체에 추가 + 로그인 된 아이디 추가
			Map<String, Object> bookMap = new HashMap<>();
			bookMap.put("bookSeq", bookSeq);
			bookMap.put("isbn", isbn);
			bookMap.put("title", title);
			bookMap.put("author", author);
			bookMap.put("content", content);
			bookMap.put("companyCd", companyCd);
			bookMap.put("totalPage", totalPage);
			bookMap.put("price", price);
			bookMap.put("quantity", quantity);
			bookMap.put("modId", modId);
			
			// (3) dao 객체 얻기
			BookDaoIf dao = new BookDaoImpl();
			// 필요한 메시지 객체 선언 : 
			//   DML 작업은 ResultSet 이 발생하지 않으므로
			//   DML 작업 성공, 실패에 대한 메시지를 저장할 변수를 선언
			String message = null;
			
			try {
				// (4) update 쿼리 실행
				dao.update(bookMap);
				
				// 수정 성공시 사용할 메시지 작성
				message = String.format("도서 정보[%d:%s] 수정 성공"
						               , bookSeq, title);
				
				// 수정 성공 메시지 요청 객체에 속성으로 추가
				request.setAttribute("message", message);
				
				// 수정 성공시 상세 보기 화면 으로 이동하기 위한 nextPage 속성 추가
				String nextPage = "main?action=detail&bookSeq=" + bookSeq;
				request.setAttribute("nextPage", nextPage);
				
				// 메인 컨텐트 위치에 넣을 페이지 속성 추가
				String mainContent = "/messageBook";
				request.setAttribute("content", mainContent);
				
				// (5) 수정 성공에 대한 적절한 화면 이동
				String view = "/index";
				request.getRequestDispatcher(view).forward(request, response);
				
			} catch (NotFoundException e) {
				System.err.println(e.getMessage());
				e.printStackTrace();
				
				// (6) 수정 실패에 대한 화면 이동은 catch 절에서 구현
				// 수정 실패시 메시지 작성
				message = e.getMessage();
	
				// 수정 실패 메시지 요청 객체에 속성으로 추가
				request.setAttribute("message", message);
				
				// 수정 실패 메시지 출력 후 이동할 nextPage 설정 : 목록으로 이동
				String nextPage = "main?action=select";
				request.setAttribute("nextPage", nextPage);
				
				// 화면 중앙 컨텐츠 부분에 메시지가 나타나도록 content 속성 추가
				String mainContent = "/messageBook";
				request.setAttribute("content", mainContent);
				
				// /index 페이지로 이동
				String view = "/index";
				request.getRequestDispatcher(view).forward(request, response);
				
			}
			
		}
		
	}

	/**
	 * 도서 정보 1건 상세보기
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void detail(HttpServletRequest request
			          , HttpServletResponse response) throws ServletException, IOException {
		
		// 1. bookSeq 파라미터 추출(String 으로 받아지는 파라미터 int 로 변환)
		int bookSeq = Integer.valueOf(request.getParameter("bookSeq"));
		
		// 2. dao 객체 얻기
		BookDaoIf dao = new BookDaoImpl();
		
		// 3. dao 객체에 1건 조회 실행
		// (1) 1건 조회에 사용할 책 일련번호가 담길 비어있는 Book 객체 생성
		Book book = new Book();
		// (2) 비어있는 Book 객체에 책 일련번호 설정
		book.setBookSeq(bookSeq);
		// (3) select() 메소드에 책 일련번호가 담긴 객체 전달하여 1건 조회 쿼리로 작동하도록 함
		List<Book> books = dao.select(book);
		// ==> 위에서 받아진 books 목록에는 1건의 조회 결과만 담김
		
		// 4. 얻어진 도서 정보 1건 요청 객체에 추가
		request.setAttribute("book", books.get(0));
		
		// 5. 도서 정보 1건 상세보기 페이지로 이동
		// (1) index.jsp 의 컨텐트 영역에 표시할 JSP 주소를 content 라는 이름으로 추가
		String cotent = "/detailBook";
		request.setAttribute("content", cotent);
		
		// (2) /index 주소로 요청 forward (메인 화면으로 돌려보냄)
		String view = "/index";
		request.getRequestDispatcher(view).forward(request, response);
		
	}

	private void select(HttpServletRequest request
			          , HttpServletResponse response) 
			             throws ServletException, IOException {
		
		// 1. dao 객체 얻기
		BookDaoIf dao = new BookDaoImpl();
		
		// 2. dao 객체에 목록 조회 메소드 호출 하여 결과 얻기
		List<Book> books = dao.select(null);
		
		// 3. 얻어진 결과 request 객체에 속성으로 추가
		request.setAttribute("books", books);
		
		// 4. 목록을 보여줄 수 있는 뷰로 forward
		// 메인 화면인 index 로 모든 포워딩을 전달
		String view = "/index";
		
		// 메인 컨텐트 영역에 바꿔 끼울 뷰를 선택
		String content = "/listBook";
		// 컨엔트 영역에 끼울 뷰를 속성으로 요청 객체에 추가
		request.setAttribute("content", content);
		
		request.getRequestDispatcher(view).forward(request, response);
	}

}
