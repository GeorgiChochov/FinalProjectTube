<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Upload Success</title>
</head>
<body>
	<div class="logo">
		<a href=<c:url value="/"/>><img
			src=<c:url value="/images/success-upload.png" /> alt=""  width="50" height="50" ></a>
	</div>
	<br />
	<div class="success">
		File <strong>${fileName}</strong> uploaded successfully. <br /> <br />
		<a href="<c:url value='/home' />">Home</a>
	</div>
</body>
</html>