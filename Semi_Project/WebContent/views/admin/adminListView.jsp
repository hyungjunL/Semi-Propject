<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ page
   import="java.util.ArrayList, com.kh.member.model.vo.Member, com.kh.common.model.vo.PageInfo"%>

<% String alertMsg = (String)session.getAttribute("alertMsg");
String contextPath = request.getContextPath();
ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
PageInfo pi = (PageInfo) request.getAttribute("pi");
Member mlist = (Member)request.getAttribute("mlist");

int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



<style>
.wrap {
   width: 1700px;
   margin: 0 auto;
   position: relative
}



#body-center {
   text-align: left;
   float: left;
   padding-top: 50px;
   width: 80%;
   margin: 0px;
}

div#pagination {
   position: absolute;
   left: 50%;
}

#page-wrapper {
   padding-left: 250px;
}

#page-content-wrapper {
   width: 100%;
   padding: 20px;
}

.side-bar {
   float: left;
   width: 20%;
   margin-top: 40px;
}

.table-side td {
   width: 200px;
   border: 1px solid lightgrey;
   height: 50px;
   text-indent: 5px;
}

.side-bar>p {
   font-size: 20px;
   text-indent: 10px;
}

.side-bar td:hover {
   color: green;
}

a:link { color: green; text-decoration: none;}
 a:visited { color: green; text-decoration: none;}
 a:hover { color: green; text-decoration: underline;}
</style>
</head>

<body>
   <div class="wrap" align="center">
      <div class="header" align="center">
         <nav class="navbar navbar-expand-lg navbar-dark "
            style="background: green;">
            <div class="container-fluid">
               <a class="navbar-brand" href="<%= contextPath %>/list.ad?currentPage=1" style="font-size: 25px;">????????? ?????????</a>
               <form class="d-flex">
                  <input id="search" class="form-control me-sm-2" type="text" placeholder="?????? ???????????? ??????" name="search">
               </form>
            </div>
         </nav>
      </div>

      <div class="body">
         <div class="side-bar">


            <table class="table-side">
               <p style="margin-top: 15px;">?????? ??????</p>
               <tr>
                  <td><a href="<%= contextPath %>/list.on?currentPage=1">1:1 ??????</a></td>
               </tr>
               <tr>
                  <td><a href="<%= contextPath %>/faq.se?currentPage=1">FAQ ??????</a></td>
               </tr>
               <tr>
                  <td><a href="<%= contextPath %>/">?????? ?????????</a></td>
               </tr>
               
            </table>


         </div>

         <div id="body-center">
            <table class="table table-hover list-area">
               <h3   style="font-weight: bold; text-indent: 50px; padding-bottom: 30px;">??????   ??????</h3>
               <thead style="text-align: center;">
                  <tr>
                     <th scope="col">????????????</th>
                     <th scope="col">??????ID</th>
                     <th scope="col">??????</th>
                     <th scope="col">Email</th>
                     <th scope="col">??????</th>
                     <th scope="col">????????????</th>
                     <th scope="col">??????</th>
                     <th scope="col">?????????</th>
                  </tr>
               </thead>

               <tbody>
                  <%
                  if (list.isEmpty()) {
                  %>

                  <tr>
                     <td colspan="8" style="text-align: center">????????? ???????????? ????????????.</td>
                  </tr>
                  <%
                  } else {
                  %>

                  <%
                  
                  for (Member m : list) {
                     
                  %>
                  <tr style="text-align: center">
                     <td><%=m.getMemberNo()%></td>
                     <td><%=m.getMemberId()%></td>
                     <td><%=m.getMemberName()%></td>
                     <td><%=m.getEmail()%></td>
                     <td><%=m.getAddress()%></td>
                     <td><%=m.getPhone()%></td>
                     <td><%=m.getBirth()%></td>
                     <td><%=m.getEnrollDate()%></td>
                  </tr>
                  <%
                  }
                  %>
                  <%
                  }
                  %>
               </tbody>
            </table>

            <div align="center" id="pagenation">


               <%
               if (currentPage != 1) {
               %>
               <button style="display:inline;" class="page-link" onclick="location.href='/javajo/list.ad?currentPage=<%=currentPage - 1%>'">&lt;</button>
               <%
               }
               %>


               <%
               for (int i = startPage; i <= endPage; i++) {
               %>

               <%
               if (i != currentPage) {
               %>
               <button style="display:inline;" class="page-link" onclick="location.href='/javajo/list.ad?currentPage=<%=i%>'"><%=i%></button>
               <%
               } else {
               %>

               <button style="display:inline;" class="page-link" disabled><%=i%></button>
               <%
               }
               %>
               <%
               }
               %>


               <%
               if (currentPage != maxPage) {
               %>
               <button style="display:inline;" class="page-link" onclick="location.href='/javajo/list.ad?currentPage=<%=currentPage + 1%>'">&gt;</button>
               <%
               }
               %>
            </div>
         </div>

      </div>
   </div>

   <div class="modal">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">???????????? ??????</h5>
            </div>
            <form action="/javajo/update.ad">
               <div class="modal-body">
                  <hr>
                  ?????? ?????? : <span id="test1"> </span> <br> <br> 
                  ?????? ID : <span    id="test2"> </span> <br> <br> 
                  ?????? ?????? : <span id="test3">   </span> <br> <br> 
                  Email : <span id="test4"> </span> <br><input type="text" name="me" style="float: right; width:100%" required> <br> <br>
                  ?????? : <span id="test5"> </span> <br>   <input type="text" name="ma"   style="float: right; width:100%" required> <br> <br> 
                  ???????????? : <span id="test6"> </span> <br><input type="text" name="mp"style="float: right; width:100%" required> <br> <br> 
                  ?????? : <span   id="test7"> </span> <br><input type="text" name="mb"style="float: right; width:100%" required> <br> <br> 
                  ????????? : <span id="test8"> </span> <br> <br>

                  <hr>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-danger" id="delete">??????????????????</button>
                  <input type="submit" class="btn btn-primary" id="insert"value="??????????????????">
                  <button type="button" class="btn btn-secondary"   data-bs-dismiss="modal" id="modal-close">??????</button>
               </div>

               <input type="hidden" name="mno" id="mno" value="">
            </form>
         </div>
      </div>
   </div>

   <script>
      $('.list-area>tbody>tr').click(function() {
         $('.modal').modal('show');

         var mno = $(this).children().eq(0).text();
         var mid = $(this).children().eq(1).text();
         var mna = $(this).children().eq(2).text();
         var ema = $(this).children().eq(3).text();
         var add = $(this).children().eq(4).text();
         var pho = $(this).children().eq(5).text();
         var bir = $(this).children().eq(6).text();
         var dat = $(this).children().eq(7).text();
         
         $("#test1").text(mno);
         $("#test2").text(mid);
         $("#test3").text(mna);
         $("#test4").text(ema);
         $("#test5").text(add);
         $("#test6").text(pho);
         $("#test7").text(bir);
         $("#test8").text(dat);
         
         $("#mno").val(mno);
         
         $("#delete").click(function() {
            
             if (!confirm("??????????????? ?????????????????????????")) {
                     alert("??????????????????.");
                 } else {
                    $("#mno").val(mno);
                   // /jsp/detail.bo?bno=X
                   location.href = "<%= contextPath %>/delete.ad?mno=" + mno;
                 }
          });
      });
      
      $('#modal-close').click(function() {
         $('.modal').modal('hide');

      });
      
        $(document).ready(function() {
               $("#search").keyup(function() {
                   var k = $(this).val();
                   $(".list-area>tbody>tr").hide();
                   var temp = $(".list-area>tbody>tr > td:nth-child(5n+2):contains('" + k + "')");

                   $(temp).parent().show();
               })
           })
      </script>

</body>

</html>