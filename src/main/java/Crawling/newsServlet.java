package Crawling;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;


@WebServlet("/getNewsCrawling")
public class newsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	
        String newsUrl = request.getParameter("url");
        
    	String newsContent = crawlNewsContents(newsUrl);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(newsContent);
}
    
    private String crawlNewsContents(String url) {
        String html = null;

        if (url != null) {
            try {
                Document doc = Jsoup.connect(url).get();
                html = doc.body().html(); // body 내용 전체를 가져옴
                return html;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

}
