package Crawling;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import User.userDAO;


public class crawlingWeb {
	
	
	public Map<Integer, String> DataReturn() {
		Map<Integer, String> Data = new HashMap<>();
		
		if(Data != null) {
			Data.clear();
		}
		
		Data = crawlingSearch();
		
		if(!Data.isEmpty()) {
			Object[] mapkey = Data.keySet().toArray();
			Arrays.sort(mapkey);
		}
		
		return Data;
	}
	
	
	
	public List<ArrayList<String>> crawlingWeb(String userID) {
		ArrayList<String> News = new ArrayList<>();
		Map<Integer, String> Data = DataReturn();
		
		List<ArrayList<String>> returnVal = new ArrayList<>();
		
		ArrayList<String> company = new ArrayList<>();
		ArrayList<String> title = new ArrayList<>();
		ArrayList<String> link = new ArrayList<>();
		
		
		if(userID == null) {
			for(int i = 1; i <= 10; i++) {
				if(Data.get(i) != null)
					News.addAll(crawlingNews(Data.get(i)));

				for(int j = 0; j < News.size(); j += 3) {					
					company.add(News.get(j));
					title.add(News.get(j+1));
					link.add(News.get(j+2));
				}
				returnVal.add(new ArrayList<>(company));
				returnVal.add(new ArrayList<>(title));
				returnVal.add(new ArrayList<>(link));
				
				
				News.clear();
				company.clear();
				title.clear();
				link.clear();
			}
			return returnVal;
		}else {
			userDAO udao = new userDAO();
			ArrayList<Object> companyList = new ArrayList<>();
			companyList.addAll(udao.companyList(userID));
			
			
			for(int i = 1; i <= 10; i++) {
				if(Data.get(i) != null)
					News.addAll(crawlingNews(Data.get(i)));
				
				for(int j = 0; j < News.size(); j += 3) {
						
					int stack = 0;//중복검사용 stack
						
					for(int k = 0; k < company.size(); k ++) {
						if(News.get(i).equals(company.get(k))) {
							stack++;//news의 회사가 db에 저장된 회사와 같다면 저장하지 않음.
						}
					}
					if(stack < 1) {
						company.add(News.get(j));
						title.add(News.get(j+1));
						link.add(News.get(j+2));
					}
					stack = 0;
					returnVal.add(new ArrayList<>(company));
					returnVal.add(new ArrayList<>(title));
					returnVal.add(new ArrayList<>(link));
				}
				News.clear();
			}
			return returnVal;
		}
	}
	
	public ArrayList<String> crawlingNews(String search){
		ArrayList<String> NewsList = new ArrayList<>();
		try {
			String url = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query=" + search;
			
			Document document = Jsoup.connect(url).get();
			
			Elements companys = document.select(".news_info .info.press");
			Elements titlesAndLink = document.select(".news_contents .news_tit");
			
			ArrayList<String> company = new ArrayList<>();
			ArrayList<String> title = new ArrayList<>();
			ArrayList<String> link = new ArrayList<>();
			
			for(Element e : companys) {
				String companyText = e.text();
				
				Element icoPickElement = e.select(".spnew.ico_pick").first();
				if(icoPickElement != null) {
					companyText = companyText.replace(icoPickElement.text(), "");
				}
				
				company.add(companyText);
			}
			
			for(Element e: titlesAndLink) {
				title.add(e.text());
				link.add(e.attr("href"));
			}
			for(int i = 0; i < company.size(); i++) {
				NewsList.add(company.get(i));
				NewsList.add(title.get(i));
				NewsList.add(link.get(i));
			}
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return NewsList;
	}
	
	
    public Map<Integer, String> crawlingSearch() {
    	// 데이터를 저장할 HashMap
    	Map<Integer, String> dataList = new HashMap<>();
        try {
        	//크롤링할 주소 URL
            String url = "https://keyzard.org/realtimekeyword";
            //해당 URL의 HTML값
            Document document = Jsoup.connect(url).get();
            //HTML에서 첫 번째로 발견된 테이블 요소를 선택
            Element table = document.select("table").first();
            //테이블에서 모든 행 요소들을 선택
            Elements rows = table.select("tr");

            for (int i = 1; i < rows.size(); i++) {
            	// 현재 행을 선택합니다.
                Element row = rows.get(i);
                // 현재 행의 모든 열 요소들을 선택합니다.
                Elements cols = row.select("td");
             // 첫 번째 열의 내용 Integer로 가져와 HashMap에 저장
                dataList.put(Integer.parseInt(cols.get(0).text()), cols.get(1).text());
            }
            return dataList;
        } catch (Exception e) {
        	// 예외가 발생한 경우, 빈 HashMap을 반환
            return dataList;
        }
    }
}