<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" type="text/css" href="/pages/style.css">
    <script src="/pages/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <jsp:include page="/pages/modal_add_stories.jsp" />
    <jsp:include page="/pages/modal_stories.jsp" />


</head>
<body class="profile-body">
<div class="content">
    <a href="#" id="addImageButton" class="add-image-button circle">+</a>
    <c:choose>
        <c:when test="${base64Avatar != null}">
            <div class="circle" id="imageContainer">
                <img id="openModalBtn" src="data:image/jpeg;base64,${base64Avatar}" style="cursor:pointer">
            </div>
        </c:when>
        <c:otherwise>
            <div class="circle" id="imageContainer">
                <img src="data:image/jpeg;base64,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">
            </div>
        </c:otherwise>
    </c:choose>
    <div class="info">
        <div class="b-links">
            <a href="http://localhost:8080/subscription?username=${user.username}"class="button" > subscriptions </a>
            <a href="http://localhost:8080/follower?username=${user.username}" class="button" > follower </a>
            <a href="/search" class="button" >search</a>
        </div>
        <div class="bottom-info">
            <h1>${user.name}</h1>
            <a href="/news" class="button">News</a>
            <a href="/settings" class="button">settings</a>
        </div>
    </div>
</div>
<div class="content_add_post">
    <div class="button_add_post">
        <button type="button" class="btn btn-primary d-block mx-auto" data-bs-toggle="modal" data-bs-target="#postModal" name="modal_button">
            Add post
        </button>
    </div>

    <div class="modal fade" id="postModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="postModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="postModalLabel">Add post</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="">
                    <div class="modal-body">
                        <form  method="post" action="addPost" enctype="multipart/form-data" class="frame-form">
                            <input type="file" name="image" id="photoInput" value="Add photo">
                            <label>
                                <input type="text" name="text">
                            </label>
                            <input type="submit" value="Submit">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="post">
        <c:forEach var="userPost" items="${post}">
            <div class="text-center mt-3">
                <c:set var="imgByte" value="${Base64.getEncoder().encodeToString(userPost.imagePost)}" />
                <img src="data:image/jpeg;base64,${imgByte}"
                     class="img-fluid" width="30%" height="40%" alt="">
                <h4 class="mt-3">${user.username} : ${userPost.textPost}</h4>
                <form method="post" action="deletePost" class="clear-form-fields" name="button-delete">
                    <input type="submit" value="Delete" class="btn btn-primary d-block mx-auto">
                    <input type="hidden" name="idPost" value="${userPost.idPost}">
                </form>
            </div>

            <fieldset>
                <form action="/comment" method="post">
                    <input type="hidden" name="action" value="addComment">
                    <input type="hidden" name="postId" value="${userPost.idPost}">
                    <input type="text" name="comment" class="form-control" placeholder="Add comment">
                    <button type="submit" class="btn btn-primary">Add</button>
                </form>

                <c:forEach items="${allComment[userPost.idPost]}" var="comment">
                <div class="text-center mt-3">
                    <div>${comment}</div>
                    <form action="/comment" method="post">
                        <input type="hidden" name="action" value="deleteComment">
                        <input type="hidden" name="commentId" value="${comment.id}">
                        <button type="submit" class="btn btn-link btn-sm delete-btn">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </form>
                    <br/>
                </div>
                </c:forEach>
            </fieldset>
        </c:forEach>


        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#videoPostModal">
            Create Video Post
        </button>

        <!-- Modal -->
        <form action="/addVideoPost" method="post" enctype="multipart/form-data">
            <div class="modal fade" id="videoPostModal" tabindex="-1" aria-labelledby="videoPostModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="videoPostModalLabel">Create Video Post</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form >
                                <div class="mb-3">
                                    <label for="title" class="form-label">Title</label>
                                    <input type="text" class="form-control" name="title" id="title" aria-describedby="nameHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="description" class="form-label">Description</label>
                                    <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                                </div>

                                <div class="mb-3">
                                    <label for="video" class="form-label">Multiple files input example</label>
                                    <input class="form-control" type="file" name="video" id="video" multiple>

                                </div>

                            </form>
                        </div>
                        <div class="modal-footer">

                            <button type="submit" class="btn btn-primary w-100">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="videoPost">

            <c:forEach var="userVideoPost" items="${video}">
                <div class="text-center mt-3">
                    <c:set var="videoByte" value="${Base64.getEncoder().encodeToString(userVideoPost.video)}" />
                    <video src="data:video/mp4;base64,${videoByte}" class="video-fluid" width="30%" height="40%"  type="video/mp4"></video>
                    <h4 class="mt-3"> ${user.username} :${userVideoPost.title}</h4>
                    <p class="mt-3">${user.username} : ${userVideoPost.description}</p>
                    <form method="post" action="/deleteVideoPost" class="clear-form-fields" name="button-delete">
                        <input type="submit" value="Delete" class="btn btn-primary d-block mx-auto">
                        <input type="hidden" name="id" value="${userVideoPost.id}">
                    </form>
                </div>

            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>