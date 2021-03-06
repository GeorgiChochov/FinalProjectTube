<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:import url="/includes/header.jsp" />
<c:import url="/includes/sidebar.jsp" />
<head><title><c:out value="YouPlay - ${user.username}"/></title></head>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="loggedInUser" />
</sec:authorize>

<script type="text/javascript">
	function subscribe(username) {
		
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/subscribe",
			
			data: {
				username: username,
			},
			
			success : function(data) {
				$("#subscribe").empty();
				$("#subscribe").append(data);
			}
		});
	}
	
	function deleteVideo(id){
		var x = document.getElementById(id);
		$.ajax({
			type: 'POST',
		    url: '../videoDelete',
		   
		    data:{
		    	videoId : id,
		    },
		    success: function(){
				location.reload();
			}

		}).done(function(){
			console.log("check");
		});
	}
</script>

<div class="content">
	<div class="grids">
		<br />
		<h1>
			<c:out value="${user.username}'s profile" />
			<sec:authorize access="isAuthenticated()"><br>
				<c:choose>
					<c:when test="${user.username ne loggedInUser}">
						<button class="dislike-button" id="subscribe" onclick="subscribe('${user.username}')"><c:out value="${subscribeButton}"/></button>
					</c:when>
					<c:otherwise>
						<sf:form method="post" action="${pageContext.request.contextPath}/changePassword">
							<input type="submit" class="dislike-button" value="<c:out value="Change password"/>"/>
						</sf:form>
					</c:otherwise>
				</c:choose>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				<sf:form method="post" action="${pageContext.request.contextPath}/subscribe">
					<input type="submit" class="dislike-button" value="<c:out value="${subscribeButton}"/>"/>
				</sf:form>
			</sec:authorize>
		</h1>

			<div class="grids">
				<h2>
					<c:out value="${user.username}'s Videos (${fn:length(videos)})" />
				</h2>
				<c:choose>
					<c:when test="${empty videos}">
						<p><c:out value="No vidoes uploaded yet."></c:out></p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${videos}" var="video">
							<div class="grid">
								<div class="preview">
								<c:if test="${user.username eq loggedInUser}">
								<a href="#" onclick="deleteVideo(${video.id});return false;"
								id="${video.id}">Delete</a></c:if>
									<a class="preview-title" href="${pageContext.request.contextPath}/video/${video.id}">
										<video width="150" height="90">
											<source src=<c:url value="${video.fileName}"/>
												type="video/mp4">
										</video> 
										<c:out value="${video.title} (${video.views})"></c:out>
									</a> <br />
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<div class="clearFloat"></div>
			</div>
			<div class="grids">
				<h2><c:out value="${user.username}'s playlists (${fn:length(playlists)})" /></h2>
				<c:choose>
					<c:when test="${empty playlists}">
						<p><c:out value="No playlists yet."></c:out></p>
					</c:when>
					<c:otherwise>
						<c:forEach var="playlist" items="${playlists}">
							<p><a href="${pageContext.request.contextPath}/playlist/${playlist.id}"><c:out value="${playlist.name} (${fn:length(playlist.videos)})" /></a></p>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="grids">
				<h2><c:out value="${user.username}'s subscribers (${fn:length(user.subscribers)})" /></h2>
				<c:choose>
					<c:when test="${empty user.subscribers}">
						<p><c:out value="No subscribers yet."></c:out></p>
					</c:when>
					<c:otherwise>
						<c:forEach var="sub" items="${user.subscribers}">
							<p><a href="${pageContext.request.contextPath}/user/${sub.username}"><c:out value="${sub.username}" /></a></p>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<h2><c:out value="${user.username}'s subscribptions (${fn:length(user.userSubscriptions)})" /></h2>
				<c:choose>
					<c:when test="${empty user.userSubscriptions}">
						<p><c:out value="Not subscribed to anyone yet."></c:out></p>
					</c:when>
					<c:otherwise>
						<c:forEach var="sub" items="${user.userSubscriptions}">
							<p><a href="${pageContext.request.contextPath}/user/${sub.username}"><c:out value="${sub.username}" /></a></p>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
	</div>
</div>
<c:import url="/includes/footer.jsp" />