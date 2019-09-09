<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page contentType="image/jpg" %>
<%
String key = request.getParameter("key");
String clientId = "kBxW1pAPfM2EdibVjasJ";//애플리케이션 클라이언트 아이디값";
String clientSecret = "3Eo5Nt8D4D";//애플리케이션 클라이언트 시크릿값";
try {
    String apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;
    out.clear();
    out = pageContext.pushBody();
    
    URL url = new URL(apiURL);
    HttpURLConnection con = (HttpURLConnection)url.openConnection();
    con.setRequestMethod("GET");
    con.setRequestProperty("X-Naver-Client-Id", clientId);
    con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
    int responseCode = con.getResponseCode();
    BufferedReader br;
    BufferedOutputStream bos = null;
    bos = new BufferedOutputStream(response.getOutputStream());
    
    if(responseCode==200) { // 정상 호출
        InputStream is = con.getInputStream();
        int read = 0;
        byte[] bytes = new byte[1024];
        // 랜덤한 이름으로 파일 생성
        //String tempname = String.valueOf(new Date().getTime()); //= Long.valueOf(new Date().getTime()).toString()
        //String path = "c:\\dev\\test"; //환경에 맞게 절대경로를 입력해주세요~
        //File f = new File(path,tempname + ".jpg");
        //f.createNewFile();
        //OutputStream outputStream = new FileOutputStream(f);
        
        
        while ((read =is.read(bytes)) != -1) {
            bos.write(bytes, 0, read);
        }
        bos.close();
        is.close();
    } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        String inputLine;
        StringBuffer resp = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            resp.append(inputLine);
        }
        br.close();
        out.println(resp.toString());
    }
} catch (Exception e) {
    System.out.println(e);
}



%>