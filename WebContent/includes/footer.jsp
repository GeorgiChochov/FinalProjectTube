<%@ page import="java.util.GregorianCalendar, java.util.Calendar"%>
<%
	GregorianCalendar currentDate = new GregorianCalendar();
	int currentYear = currentDate.get(Calendar.YEAR);
%>
<p>
	  <footer>
            <div class="wrap">
                <div class="about">
                    <div class="title">About Us</div>
                    
                </div>
           
               
                <ul>
                    <li class="title">Menu Name</li>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="#">Downloads</a></li>
                    <li><a href="#">Uploads</a></li>
                    <li><a href="feedback.html">Contact</a></li>
                    <li><a href="#">Support</a></li>
                    <li><a href="#">About</a></li>
                </ul>
                <div class="clearFloat"></div>
                <div class="copy"><p>&copy; 2016 Georgi Chochov, Hristo Angelov & Kaloyan Tsvetkov <a href="http://w3layouts.com">W3Layouts.com</a></p></div>
            </div>
    </footer>
</p>
</body>
</html>