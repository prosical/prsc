<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ReviewContent</title>

<!-- Bootstrap -->
<link href="../resources/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


<!-- Include all js compiled plugins (below), or include individual files as needed -->

<!--  <script src="../resources/assets/js/jquery.js"></script>-->


</head>

<style>
.wrapper {
   padding-left: 10%;
   padding-right: 10%;
}

.navbar-brand {
   color: #00FFFF;
}

.navbar li a:hover {
   background-color: #555;
   color: #00BFFF;
}

.content-header {
   width: 200px;
   margin: 0 auto;
}

body {
   margin: 0;
   font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
      "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
      "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
   font-size: 1rem;
   font-weight: 400;
   line-height: 1.5;
   color: #212529;
   text-align: right;
   background-color: #fff;
}

.box-title {
   background-color: White;
   border: 1px outset black;
   padding-top: 10px;
    padding-bottom: 10px;
    margin-top: 10px;
    margin-bottom: 10px;
   margin-left: 0px;
   margin-right: 0px;
   padding-left: 10px;
   padding-right: 10px;
}

.box-body-border{
   height: 80%;
   font-size: 15px;
   margin-left: 10px;
   padding-left: 10px;
   padding-right: 10px;
   margin-right: 10px;
   margin-left: 10px;
}
.repliesDiv{
   
   font-size: 15px;
   margin-left: 10px;
   padding-left: 10px;
   padding-right: 10px;
   margin-right: 10px;
   margin-left: 10px;
}

.button-group {
   float: left;
}
</style>
<jsp:include page="../include/header.jsp" />


<body class="hold-transition skin-blue sidebar-mini layout-boxed">


   <div class="wrapper">

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
         <!-- Content Header (Page header) -->
         <section class="content-header">
            <h1 style="font-size: 32px">Review_Content</h1>

         </section>

         <!-- Main content -->
         <section class="content container-fluid">

            <div class="col-lg-12">
               <div class="box box-primary">

                  <div class="box-header" align="center">
                     <h3 class="box-title">TITLE : ${article.title}</h3>
                  </div>

                  <div class="box-body-border with-border" align="left">
                     ${article.content}
                     <br>
                     <c:if test="${not empty files }">
                        
                        <img class="img-thumbnail img-fluid" src="<c:url value='/board/file/${article.boardNo }'/>" alt="" >
                     </c:if>
                     </div>

                  <div class="box-footer">
                     <div class="member-block" align="right">
                         <a
                           href="#">${article.memberId}</a>
                         <span class="description"><fmt:formatDate
                              pattern="yyyy-MM-dd a hh:mm" value="${article.regDate}" /></span>
                     </div>
                  </div>

                  <div class="box-footer">
                     <form role="form" method="post">
                        <input type="hidden" name="boardNo" value="${article.boardNo}">
                        <input type="hidden" name="page" value="${criteria.page}">
                        <input type="hidden" name="countPerPage"
                           value="${criteria.countPerPage}"> <input type="hidden"
                           name="condition" value="${criteria.condition}"> <input
                           type="hidden" name="keyword" value="${criteria.keyword}">
                     </form>

                     

                     <button type="submit" id="listBtn"class="btn btn-primary listBtn">
                        <i class="fa fa-list"></i> 목록
                     </button>
                     
                     <button type="submit" id="likeBtn" class="btn btn-primary likeBtn">
                              <i class="fa fa-edit"></i> 좋아요
                           </button>

                     <c:if test="${login.memberId == article.memberId}">
                        <div class="button-group">
                           <button type="submit" class="btn btn-warning modBtn">
                              <i class="fa fa-edit"></i> 수정
                           </button>
                           <button type="submit" class="btn btn-danger delBtn">
                              <i class="fa fa-trash"></i> 삭제
                           </button>
                           
                        </div>
                     </c:if>
                  </div>
               </div>

               <%-- 댓글 영역 --%>
               <div class="box box-warning">
                  <div class="box-header">
                     <a class="link-black text-lg"><i
                        class="fa fa-pencil margin-r-5"></i>댓글 쓰기</a>
                  </div>
                  <div class="box-body">

                     <c:if test="${not empty login}">
                        <form class="form-horizontal">
                           <div class="form-group margin">
                              <div class="col-sm-10">
                                 <textarea class="form-control" id="newReplyContent" rows="3"
                                    placeholder="댓글내용을 입력하세요" style="resize: none"></textarea>
                              </div>

                              <div class="col-sm-2" hidden="hidden">
                                 <input class="form-control" id="newReplyWriter" type="text"
                                    placeholder="작성자" value="${login.memberId}"
                                    readonly="readonly">
                              </div>
                              <div class="col-sm-2">
                                 <button type="button"
                                    class="btn btn-primary btn-block replyAddBtn">
                                    <i class="fa fa-save"></i> 등록
                                 </button>
                              </div>
                           </div>
                        </form>
                     </c:if>

                     <c:if test="${empty login}">
                        <a href="<c:url value='/member/login'/>"
                           class="btn btn-default btn-block" role="button"> <i
                           class="fa fa-edit"></i> 로그인 한 사용자만 댓글 등록이 가능합니다.
                        </a>
                     </c:if>

                  </div>
               </div>

               <div class="box box-success collapsed-box">
                  <%--댓글 유무 / 댓글 갯수 / 댓글 펼치기, 접기--%>
                  <div class="box-header">
                     <a class="link-black text-lg"><i
                        class="fa fa-comments-o margin-r-5 replyCount"></i> </a>
                     <div class="box-tools">
                        <button type="button" class="btn btn-box-tool"
                           data-widget="collapse">
                           <i class="fa fa-plus"></i>
                        </button>
                     </div>
                  </div>
                  <%--댓글 목록--%>
                  <div class="box-body-border repliesDiv"></div>
                  <%--댓글 페이징--%>
                  <div class="box-footer">
                     <div class="text-center">
                        <ul class="pagination pagination-sm no-margin">

                        </ul>
                     </div>
                  </div>
               </div>

               <%--댓글 수정 modal 영역--%>
               
               <div class="modal fade" id="modModal">
                  <div class="modal-dialog">
                     <div class="modal-content">
                        <div class="modal-header">
                           <button type="button" class="close" data-dismiss="modal"
                              aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                           </button>
                           
                           
                           <h4 class="modal-title">댓글수정</h4>
                        </div>
                        
                        <div class="modal-body" data-rno>
                           <input type="hidden" class="replyNo" />
                           <%--<input type="text" id="replycontent" class="form-control"/>--%>
                           <textarea class="form-control" id="replyContent" rows="3"
                              style="resize: none"></textarea>
                        </div>
                        <div class="modal-footer">
                           <button type="button" class="btn btn-default float-left"
                              data-dismiss="modal">닫기</button>
                           <button type="button" class="btn btn-primary modalModBtn">수정</button>
                        </div>
                     </div>
                  </div>
               </div>

               <%--댓글 삭제 modal 영역--%>
               <div class="modal fade" id="delModal">
                  <div class="modal-dialog">
                     <div class="modal-content">
                        <div class="modal-header">
                           <button type="button" class="close" data-dismiss="modal"
                              aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                           </button>
                           <h4 class="modal-title">댓글 삭제</h4>
                           <input type="hidden" class="rno" />
                        </div>
                        <div class="modal-body" data-rno>
                           <p>댓글을 삭제하시겠습니까?</p>
                           <input type="hidden" class="rno" />
                        </div>
                        <div class="modal-footer">
                           <button type="button" class="btn btn-default pull-left"
                              data-dismiss="modal">아니요.</button>
                           <button type="button" class="btn btn-primary modalDelBtn">네.
                              삭제합니다.</button>
                        </div>
                     </div>
                  </div>
               </div>






            </div>

         </section>
         <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->


      <!-- Main Footer -->

   </div>
   <!-- ./wrapper -->


   <%-- Handlebars // https://handlebarsjs.com --%>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js">
   
   
   </script>

 

   <script id="replyTemplate" type="text/x-handlebars-template">
    {{#each.}}
    <div class="post replyDiv" data-replyNo={{replyNo}}>
        <div class="user-block">
            <%--댓글 작성자 프로필사진
            <img class="img-circle img-bordered-sm" src="<c:url value='/dist/img/user1-128x128.jpg'/>" alt="user image">--%>
            <%--댓글 작성자--%>
            <span class="username">
                <%--작성자 이름--%>
                <a href="#" style="float:left"">{{replyWriter}}</a>
            {{#eqReplyWriter replyWriter}}
                   <%--댓글 삭제 버튼--%>
                   <a href="#" class="pull-right btn-box-tool replyDelBtn" data-toggle="modal" data-target="#delModal">
                       <i class="fa fa-times"> 삭제</i>
                   </a>

                   <%--댓글 수정 버튼--%>
                   <a href="#" class="pull-right btn-box-tool replyModBtn" data-toggle="modal" data-target="#modModal">
                       <i class="fa fa-edit"> 수정</i>
                   </a>
            {{/eqReplyWriter}}                
            </span>
            <%--댓글 작성일자--%>
            <span class="description" style="float:left">{{prettifyDate regDate}}</span>
        </div><br>
        <%--댓글 내용--%>
        <div class="oldReplyContent" style="float:none">{{{escape replyContent}}}</div>
        <br>
    </div>
    {{/each}}

</script>

   <script type="text/javascript">

   //댓글 수정 삭제 인증처리
   Handlebars.registerHelper("eqReplyWriter", function(replyWriter, block){
      let accum = "";
      if(replyWriter === "${login.memberId}") {
      accum += block.fn();
      }
      return accum;
      });
   
   


$(function() {
   
   const conPath = "";

   var boardNo = "${article.boardNo}"; //현재 게시글 번호
   console.log(boardNo);
   let replyPageNum = 1; //댓글 페이지 번호
   
   //댓글 내용 줄바꿈 공백 처리
   Handlebars.registerHelper("escape", function(replyText) {
      let text = Handlebars.Utils.escapeExpression(replyText);
      text = text.replace(/(\r\n|\n|\r)/gm, "<br>");
      text = text.replace(/( )/gm, "&nbsp;");
      return new Handlebars.SafeString(text);
   });
   
   //댓글 등록 날짜 포맷팅
   Handlebars.registerHelper("prettifyDate", function(time) {
      let dateObj = new Date(time);
      let year = dateObj.getFullYear();
      let month = dateObj.getMonth() + 1;
      let date = dateObj.getDate();
      let hours = dateObj.getHours();
      let minutes = dateObj.getMinutes();
      //2자리 숫자로 변환
      month < 10 ? month = '0' + month : month;
      date < 10 ? date = '0' + date : date;
      hours < 10 ? hours = '0' + hours : hours;
      minutes < 10 ? minutes = '0' + minutes : minutes;
      return year + "-" + month + "-" + date + "-" + hours + ":" + minutes;
   });
   
   //댓글 목록 함수 호출
   getReplies("/replies/" + boardNo + "/" + replyPageNum);
   
   //댓글 목록 불러오기 함수
   function getReplies(uri) {
      $.getJSON(uri, function(data) {
         console.log(data);
         printReplyCount(data.pageCreator.articleTotalCount);
         printReplies(data.replies, $(".repliesDiv"), $("#replyTemplate"));
         printReplyPaging(data.pageCreator, $(".pagination"));
      });
   }
   
   //댓글 총 개수 출력 함수
   function printReplyCount(totalCount) {
      const replyCount = $(".replyCount");
      const collapsedBox = $(".collapsed-box");
      
      //댓글이 없을 때
      if(totalCount === 0) {
         replyCount.html("댓글이 없습니다. 댓글을 작성해주세요!");
         return;
      }
      
      //댓글이 존재할 때
      replyCount.html("댓글 목록 (" + totalCount + ")");
      collapsedBox.find(".btn-box-tool").html(
         "<button type='button' class='btn btn-box-tool' data-widget='collapse'>"
         + "<i class='fa fa-plus'></i>"
         + "</button>"         
      );
      
   }
   
   //댓글 목록 출력 함수
   function printReplies(replyArr, targetArea, templateObj) {
      const replyTemplate = Handlebars.compile(templateObj.html());
      const html = replyTemplate(replyArr);
      $(".replyDiv").remove();
      targetArea.html(html);
   }
   
   //댓글 페이지 출력 함수
   function printReplyPaging(pageCreator, targetArea) {
      let element = "";
      if(pageCreator.prev) {
         element += "<li><a href='" + (pageCreator.beginPage - 1) + "'>이전</a></li>";
      }
      
      const len = pageCreator.endPage;
      for(let i=pageCreator.beginPage; i <= len; i++) {
         const active = pageCreator.criteria.pageCnt === i ? "class=active" : "";
         element += "<li " + active + "><a href='" + i + "'>" + i + "</a></li>";
      }
      
      if(pageCreator.next) {
         element += "<li><a href='" + (pageCreator.endPage + 1) + "'>다음</a></li>";
      }
      
      targetArea.html(element);
   }
   
   //댓글 페이지 번호 클릭 이벤트
   $(".pagination").on("click", "li a", function(e) {
      console.log("page click!")
      e.preventDefault();
      replyPageNum = $(this).attr("href");
      console.log(replyPageNum);
      getReplies("/replies/" + boardNo + "/" + replyPageNum);
      
   });
   
   // 댓글 저장 버튼 클릭 이벤트
    $(".replyAddBtn").on("click", function () {

        // 입력 form 선택자
        const replyWriterObj = $("#newReplyWriter");
        const replyContentObj = $("#newReplyContent");
        let replyWriter = replyWriterObj.val();
        let replyContent = replyContentObj.val();
        console.log("원본 글 번호: " + boardNo);

        // 댓글 입력처리 수행
        
        $.ajax({
            type: "POST",
            url: "/replies/",
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: "text",
            data: JSON.stringify({
                boardNo: boardNo,
                replyWriter: replyWriter,
                replyContent: replyContent
            }),
            success: function (result) {
                console.log("result : " + result);
                if (result === "regSuccess") {
                    alert("댓글이 등록되었습니다.");
                    replyPageNum = 1;  // 페이지 1로 초기화
                    getReplies("/replies/" + boardNo + "/" + replyPageNum); // 댓글 목록 호출
                    replyContentObj.val("");   // 댓글 입력창 공백처리
                   // replyWriterObj.val("");   // 댓글 입력창 공백처리
                }
            },   
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }

        });
    });
   
    // 댓글 수정을 위해 modal창에 선택한 댓글의 값들을 세팅
    $(".repliesDiv").on("click", ".replyDiv", function (event) {
        const reply = $(this);
        $(".replyNo").val(reply.attr("data-replyNo"));
        $("#replyContent").val(reply.find(".oldReplyContent").text());
    });

    // modal 창의 댓글 수정버튼 클릭 이벤트
    $(".modalModBtn").on("click", function () {
       
       
        let replyNo = $(".replyNo").val();
        let replyContent = $("#replyContent").val();
        $.ajax({
            type: "put",
            url: "/replies/" + replyNo,
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "PUT"
            },
            dataType: "text",
            data: JSON.stringify({
               replyNo: replyNo,
               boardNo: boardNo,
                replyContent: replyContent
            }),
            success: function (result) {
                console.log("result : " + result);
                if (result === "updateSuccess") {
                    alert("댓글이 수정되었습니다.");
                    $("#modModal").modal("hide"); // modal 창 닫기
                    replyPageNum = 1;  // 페이지 1로 초기화
                    getReplies("/replies/" + boardNo + "/" + replyPageNum); // 댓글 목록 호출
                    self.location="";
                    
                }
            }
        })
    });

    // modal 창의 댓글 삭제버튼 클릭 이벤트
    $(".modalDelBtn").on("click", function () {
        const replyNo = $(".replyNo").val();
        $.ajax({
            type: "delete",
            url: "/replies/" + replyNo,
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "DELETE"
            },
            data: JSON.stringify({
               replyNo: replyNo,
               boardNo: boardNo
            }),
            dataType: "text",
            success: function (result) {
                console.log("result : " + result);
                if (result === "delSuccess") {
                    alert("댓글이 삭제되었습니다.");
                    getReplies("/replies/" + boardNo + "/" + replyPageNum); // 댓글 목록 호출
                    $("#delModal").modal("hide"); // modal 창 닫기
                    self.location="";
                }
            }
        });
    });
  //좋아요버튼 클릭 이벤트
   $("#likeBtn").on("click", function(){
            
            
            
      $.ajax({
         
         type:"POST",
         url:"../likeit/insertLike?boardNo=${article.boardNo}",
         headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: "text",
            data: JSON.stringify({
               boardNo:"${article.boardNo}"
            }),
            success: function(result) {
               if(result==="insSuccess"){
                  alert("좋아요 추가가 완료되었습니다.");
                  self.location="";
                  
               } else if(result === "delSuccess") {
                  alert("좋아요 삭제가 완료되었습니다.");
                  self.location="";
                  $("#likeBtn").text("좋아요");
               }
               
            }
         
      });
            
         });// end
    
    
   const formObj = $("form[role='form']");
   console.log(formObj);

   
   
   //게시글 수정 버튼 클릭이벤트
   $(".modBtn").on("click", function () {
      formObj.attr("action", "modify");
      formObj.attr("method", "get");
      formObj.submit();
   });

   //게시글 삭제 버튼 클릭이벤트
   $(".delBtn").on("click", function () {
      formObj.attr("action", "/board/delete");
      formObj.submit();
   });
   //게시글 목록 버튼 클릭이벤트
   $(".listBtn").on("click", function () {
      formObj.attr("method", "get");
      formObj.attr("action", "list");
      formObj.submit();
   });
   

});


</script>




</body>
<jsp:include page="../include/footer.jsp" />
</html>
