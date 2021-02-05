<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <div class="row">
        <c:choose>
            <%--    admin--%>
            <c:when test="${sessionScope.isAdmin && sessionScope.isLoggedIn}">
                <c:forEach var="drink" items="${drinks}">
                    <div class="col col-md-6 col-lg-4 d-flex align-items-stretch justify-content-center">
                        <div class="card text-white bg-secondary border-warning mt-4" style="width: 18rem;">
                            <div class="card-header">
                                <h5 class="card-title text-center">
                                    <c:choose>
                                        <c:when test="${drink.name.length() > 23}">
                                            <c:out value="${drink.name.substring(0,23)}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="${drink.name}"/>
                                        </c:otherwise>
                                    </c:choose>
                                </h5>
                            </div>
                            <img class="card-img-top" src="<c:out value="${drink.image}"/>" alt="drink">
                            <div class="card-body">
                                <small><strong>Ingredients</strong></small>
                                <p class="card-text"><c:out value="${drink.ingredients}"/></p>
                                <small><strong>Instructions</strong></small>
                                <p class="card-text"><c:out value=" ${drink.instructions}"/></p>
                            </div>
                            <div class="card-footer" style="display: flex;justify-content: space-between; align-items: center">
                                <form action="${sessionScope.previousPage}" method="get">
                                    <input type="hidden" name="drinkId" value="${drink.id}">
                                    <button type="submit" class="btn btn-danger">Go Back</button>
                                </form>
                                <form action="/editForm" method="get">
                                    <input type="hidden" name="editThisDrink" value="${drink.id}">
                                    <button type="submit" class="btn btn-danger">Edit</button>
                                </form>
                                <form action="/delete" method="post">
                                    <input type="hidden" name="deleteThisDrink" value="${drink.id}">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
                            </div>
                            <div class="voteSection">
                                <div class="vote">
                                    <form class="voteForm" action="/vote" method="POST">
                                        <input type="hidden" value="1" name="vote">
                                        <button class="thumbButton upVote" type="submit"><i class="fas fa-thumbs-up"></i></button>
                                    </form>
                                </div>
                                <div class="downVote vote">
                                    <form class="voteForm" action="/vote" method="POST">
                                        <input type="hidden" value="0" name="vote">
                                        <button class="thumbButton downVote" type="submit"><i class="fas fa-thumbs-down"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <%--    user--%>
            <c:when test="${sessionScope.isLoggedIn}">
                <c:forEach var="drink" items="${drinks}">
                    <div class="col col-md-6 col-lg-4 d-flex align-items-stretch">
                        <div class="card text-white bg-secondary border-warning mt-4" style="width: 18rem;">
                            <div class="card-header">
                                <h5 class="card-title text-center">
                                    <c:choose>
                                        <c:when test="${drink.name.length() > 23}">
                                            <c:out value="${drink.name.substring(0,23)}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="${drink.name}"/>
                                        </c:otherwise>
                                    </c:choose>
                                </h5>
                            </div>
                            <img class="card-img-top" src="<c:out value="${drink.image}"/>" alt="drink">
                            <div class="card-body">
                                <small><strong>Ingredients</strong></small>
                                <p class="card-text"><c:out value="${drink.ingredients}"/></p>
                                <small><strong>Instructions</strong></small>
                                <p class="card-text"><c:out value=" ${drink.instructions}"/></p>
                            </div>
                            <div class="card-footer" style="display: flex;justify-content: space-between; align-items: center">
                                <form action="/show" method="post">
                                    <input type="hidden" name="drinkId" value="${drink.id}">
                                    <button type="submit" class="btn btn-danger">View</button>
                                </form>
                                <c:if test="${sessionScope.user != null}">
                                    <c:if test="${drink.userId == sessionScope.user.id}">
                                        <form action="/editForm" method="get">
                                            <input type="hidden" name="editThisDrink" value="${drink.id}">

                                            <button type="submit" class="btn btn-danger">Edit</button>
                                        </form>
                                        <form action="/delete" method="post">
                                            <input type="hidden" name="deleteThisDrink" value="${drink.id}">
                                            <button type="submit" class="btn btn-danger">Delete</button>

                                        </form>
                                    </c:if>
                                </c:if>
                            </div>
                            <div class="voteSection">
                                <div class="vote">
                                    <form class="voteForm" action="/vote" method="POST">
                                        <input type="hidden" value="1" name="vote">
                                        <button class="thumbButton upVote" type="submit"><i class="fas fa-thumbs-up"></i></button>
                                    </form>
                                </div>
                                <div class="vote">
                                    <form class="voteForm" action="/vote" method="POST">
                                        <input type="hidden" value="0" name="vote">
                                        <button class="thumbButton downVote" type="submit"><i class="fas fa-thumbs-down"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <%--    visitor--%>
            <c:otherwise>
                <c:forEach var="drink" items="${drinks}">
                    <div class="col col-md-6 col-lg-4 d-flex align-items-stretch">
                        <div class="card text-white bg-secondary border-warning mt-4" style="width: 18rem;">
                            <div class="card-header">
                                <h5 class="card-title text-center">
                                    <c:choose>
                                        <c:when test="${drink.name.length() > 23}">
                                            <c:out value="${drink.name.substring(0,23)}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="${drink.name}"/>
                                        </c:otherwise>
                                    </c:choose>
                                </h5>
                            </div>
                            <img class="card-img-top" src="<c:out value="${drink.image}"/>" alt="drink">
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>
