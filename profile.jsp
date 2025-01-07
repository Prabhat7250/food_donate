<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
</head>
<body>
<h1>Profile</h1>
<p>Name: ${name}</p>
<p>Email: ${email}</p>
<p>Phone: ${phone}</p>
</body>
</html>

// 4. Add JSTL Dependency to Maven (pom.xml)
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>jstl</artifactId>
    <version>1.2</version>
</dependency>

// 5. Use JSTL in JSP
// Example JSTL Use in profile.jsp

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${name != null}">
    <p>Name is available: ${name}</p>
</c:if>