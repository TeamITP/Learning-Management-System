<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Q & A | Classroom</title>
        <meta content="New Montana Educational Institute">
        <link rel="icon" href="Images/book.png">
        <link rel="stylesheet" href="CSS/QnA_Teacher.css">
    </head>

    <body>
        <div class="page-container">
            <!--Header Here-->
            <jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>

            <!--Page Topic-->
            <div class="pageTopicContainer">
                <h1 class="pageTopic">Question and Answers</h1>
                <hr class="dividerTopic">
            </div>

            <!--Questions Container-->
            <div class="questionContainer">

                <!--Not Replied Questions-->
                <div class="row justify-content-start">

                    <!--Question Box-->
                    <div class="col-10 col-md-5 QuestionBox">
                        <div class="row">
                            <div class="col-1.5 md-0.75  justify-content-start align-items-start">
                                <img src="Images/userAvatar.png" class="userAvatar">
                            </div>
                            <div class="col-5 justify-content-start">
                                <div class="row">
                                    <h2 class="name">Avishka Perera</h2>
                                </div>
                                <div class="row">
                                    <h2 class="date">2020.09.17 10.08 PM</h2>
                                </div>
                            </div>
                        </div>
                        <!-- Force next columns to break to new line -->
                        <div class="w-100"></div>
                        <div class="row question">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse id hendrerit odio ?
                        </div>
                        <div class="row replyButton">
                            <button type="button" class="btn btn-primary btnReply">Reply</button>
                        </div>
                    </div>

                    <!--Question Box-->
                    <div class="col-10 col-md-5 QuestionBox">
                        <div class="row">
                            <div class="col-1.5 md-0.75  justify-content-start align-items-start">
                                <img src="Images/userAvatar.png" class="userAvatar">
                            </div>
                            <div class="col-5 justify-content-start">
                                <div class="row">
                                    <h2 class="name">Avishka Perera</h2>
                                </div>
                                <div class="row">
                                    <h2 class="date">2020.09.17 10.08 PM</h2>
                                </div>
                            </div>
                        </div>
                        <!-- Force next columns to break to new line -->
                        <div class="w-100"></div>
                        <div class="row question">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse id hendrerit odio ?
                        </div>
                        <div class="row replyButton">
                            <button type="button" class="btn btn-primary btnReply">Reply</button>
                        </div>
                    </div>
                </div>

                <!--Replied Quesions-->
                <div class="row justify-content-start">
                    <div class="col-10 col-md-5 QuestionBox">
                        <!--First Row-->
                        <div class="row">
                            <div class="col-1.5 md-0.75">
                                <img src="Images/userAvatar.png" class="userAvatar">
                            </div>
                            <div class="col-5">
                                <div class="row">
                                    <h2 class="name">Avishka Perera</h2>
                                </div>
                                <div class="row">
                                    <h2 class="date">2020.09.17 10.08 PM</h2>
                                </div>
                            </div>
                        </div>

                        <!--SecoND Row-->
                        <div class="row question">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse id hendrerit odio ?
                        </div>

                        <!--Thrid Row-->
                        <div class="row answerQ">
                            <div class="col-12">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse id hendrerit odio ?
                            </div>
                            <div class="col-12">
                                <button type="button" class="btn btn-danger btnEdit">Edit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Footer Here-->
            <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
        </div>
    </body>

    </html>