<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.member.model.vo.Heart, com.kh.common.model.vo.PageInfo" %>
<%
   ArrayList<Heart> list = (ArrayList<Heart>)request.getAttribute("list");

   PageInfo pi = (PageInfo)request.getAttribute("pi");
   
   int currentPage = pi.getCurrentPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
   int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
    div {
        box-sizing: border-box;
    }
    
     #wrap {
        width: 1000px;
        height: 1000px;
        margin: auto;
    }

   #content {
      height:100%;
   }
   

    #banner {height: 15%;}
    
    #content>div {
        float: left;
    }

    /* content 영역 */
    #content_1 {
        width: 100%;
        height: 15%;
    }

    #content_2 {
        width: 20%;
        height: 85%;
    }

    #content_3 {
        height: 85%;
        width: 80%;
    }
    
    #content_1>hr {
        align-items: center;
        width: 90%;
    }

    .list-group-item {
        margin-bottom: 40px;
        width: 130px;
        border: 1px solid white;
    }

    .list-group-item:hover {
        font-size: 17px;
        font-weight: bold;
        cursor: pointer;
    }  

    .update1, .update2 {
        margin-top: 20px;
        color: rgb(67, 155, 68);
        font-weight: bold;
    }

    #li-update>p {
        display: none;
        height: 10px;
    }
    
    #li-update:hover p{
        display: block;
    }

    #li-update>p:hover {
        color: green;
    }

    .myPage-update1, .myPage-update2, #bookListForm, #deleteRegister {
        display: none;
    }
   
    .hTitle:hover {
       color: rgb(67, 155, 68);
        cursor : pointer;
    }
</style>
</head>
<body>
   
   


    <div id="wrap">


    <!-- 상단에는 header1.jsp가 보이게 해줌 -->


      <%@ include file="../common/header1.jsp" %>
      
      <% 
         String userId = loginMember.getMemberId();
         String userPwd = loginMember.getMemberPwd();
            String userName = loginMember.getMemberName();

            String birth = (loginMember.getBirth() == null) ? "" :loginMember.getBirth().substring(0, 10);
         String email = (loginMember.getEmail() == null) ? "" : loginMember.getEmail();
         String address = (loginMember.getAddress() == null) ? "" : loginMember.getAddress();
         String phone = (loginMember.getPhone() == null) ? "" : loginMember.getPhone();
         
      %>
       
      
          <div id="content" style="margin-bottom:50px" >
              <div id="content_1">
                  <span style="font-size: 30px; font-weight: bold; margin-left: 5%;">마이페이지</span>
                  <hr>
              </div>
              
              <div id="content_2" class="" style="border: 1px solid white;">
                  <ul style="list-style-type: none;">
                      <li id="li-update" class="list-group-item list-group-flush list-group-item-success update">
                          내정보수정
                          <p class="update1" style="font-size: 14px;">기본정보 변경</p>
                          <p class="update2" style="font-size: 14px">비밀번호 변경</p>
                      </li>
                      <li id="li-jjim" class="list-group-item list-group-item-success jjim" onclick="location.href='<%= contextPath %>/zzim.me?currentPage=1'">찜 보기</li>
                      <li id="li-bookList" class="list-group-item list-group-item-success bookList" onclick="location.href='<%= contextPath %>/myTrade.me?currentPage=1'">판매내역</li>
                      <li id="li-delete" class="list-group-item list-group-item-success delete">회원탈퇴</li>
                  </ul>
              </div>
              <div id="content_3">
                  <div class="contet_3-1" style="font-size: 30px; font-weight: bold; color: green; margin-bottom: 10px;" align="center">
                      <%= userName %> 님 안녕하세요! 
                  </div>
      
                  <div id="mypage_update1" class="myPage-update1" >
                      <form class="mypage update1" action="<%= contextPath %>/update.me" method="post">
                          <table class="table">
                              <tr>
                                  <th>아이디</th>
                                  <td><input type="text" id="userId" name="userId" value="<%= userId %>" readonly></td>
                              </tr>
                              <tr>
                                  <th>이름</th>
                                  <td><input type="text" id="userName" name="userName" value="<%= userName %>" required></td>
                              </tr>
                              <tr>
                                  <th>생년월일 (예: 19XX-XX-XX)</th> 
                                  <td><input type="text" id="userBirth" name="birth" value="<%= birth%>"></td>
                              </tr>
                              <tr>
                                  
                                  <th>주소</th> 
                                  <td><input type="text" id="address1" value="<%= address %>" name="address1" style="margin-right: 10px; width:450px;" readonly><input type="button" value="검색" style="margin-left: 10px;" onclick="postCode();"></input></td> 
                              </tr>

                              <tr>
                                  <th>휴대전화</th>
                                  <td>
                                      <input type="text" name="phone1" maxlength="4" style="width: 80px;" value="<%= loginMember.getPhone().substring(0,3) %>"> -
                                      <input type="text" name="phone2" maxlength="4" style="width: 80px;" value="<%= loginMember.getPhone().substring(4,8) %>"> -
                                      <input type="text" name="phone3" maxlength="4" style="width: 80px;" value="<%= loginMember.getPhone().substring(9,13) %>">
                                  </td>
                              </tr>
                              <tr>
                                  <th>이메일</th>
                                  <td><input type="text" id="userEmail" name="email" value="<%= loginMember.getEmail() %>"></td>
                              </tr>
                          </table>
                      <button type="submit" onclick="return validateForm();" value="수정하기" style="margin-left: 650px; font-size: 20px; width: 120px; height: 40px; font-weight: bold;" class="btn btn-outline-success">수정하기</button>
                      </form>
                  </div>
      
                  <div id="myPage-update" class="myPage-update2" >
                      <form method="post" action="<%= contextPath%>/updatePwd.me" onsubmit="return validate();">
                          <input type="hidden" name="userId" value="<%= userId %>">
                          <input type="hidden" name="hiddenPwd" value="<%= loginMember.getMemberPwd() %>" >
                          <table class="table">
                              <tr> 
                                  <th>현재 비밀번호</th>
                                  <td>
                                  <input type="password" name="userPwd" required>
                                  </td>
                              </tr>
                              <tr>
                                  <th>변경할 비밀번호</th>
                                  <td><input type="password" id="updatePwd" name="updatePwd" required></td>
                              </tr>
                              <tr>
                                  <th>변경할 비밀번호 확인</th>
                                  <td><input type="password" id=checkPwd name="checkPwd" required></td>
                              </tr>
                          </table>
                         <button style="margin-left: 650px; font-size: 20px; width: 120px; height: 40px; font-weight: bold;" class="btn btn-outline-success" type="submit" onclick="return validatePwd();">변경하기</button>
                      </form>
                      
                      <script>
                         
                     function validatePwd() {
                            
                            if ($("input[name=userPwd]").val() == "" || $("input[name=updatePwd]").val() == "" || $("input[name=hiddenPwd]").val() == "") {
                               
                                 alert("비밀번호를 다 입력하세요.");                               
                                 
                                 return false;
                                 
                              } else if ($("input[name=userPwd]").val() != "" && $("input[name=updatePwd]").val() != "" && $("input[name=hiddenPwd]").val() != "") {
       
                                if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val() || $("input[name=hiddenPwd]").val() != $("input[name=userPwd]").val()) {
   
                                            alert("비밀번호가 일치하지 않습니다.");
                                           
                                            return false;
                                           
                                        } 
                                           
                              return true;
                                
                           }
                             
                         };

                         
                      function validate() {
                            
                            var updatePwd = document.getElementById('updatePwd').value;
                              var checkPwd = document.getElementById('checkPwd').value;
                            var regExp = /^[a-z\d!@#$%^]{8,20}$/i;
                              
                                
                               if(!regExp.test(updatePwd)) {
                                   alert('비밀번호는 8~20자리의 영문자/숫자/특수문자(!@#$%^) 로 이루어져야 합니다.');
                                   document.getElementById('updatePwd').value = "";
                                   document.getElementById('checkPwd').value = "";
                                   document.getElementById('updatePwd').focus();
                                   
                                   return false;
                            }
                               
                                                             
                               return true;
                         };
                      </script>
                  </div>

               <div id="zzimList" class="myPage-jjim">
                          <table class="table">
                              <tr>
                                  <th>게시글 번호</th>
                                  <th>게시글 제목</th>
                              </tr>
      
                        <% if(list.isEmpty()) { %>
                           <tr>
                                     <td colspan="2" align="center">
                                        찜 내역이 없습니다. 
                                     </td>
                                 </tr>
                        <% } else { %>
                        <% for(Heart h : list) {%>
                              <tr>
                                  <td class="bno"><%= h.getHeartBno() %></td>
                                  <td><p class="hTitle"><%= h.getBookTitle() %></p></td>
                                  
                              </tr>
                              
                        <% } %>
                     <% } %>
      
                          </table>
                          
                      <div align="center" class="paging-area">
           
                       <!-- 페이징바에서 < 를 담당 -->
                       <% if(currentPage != 1) { %>
                          <button onclick="location.href='<%= contextPath %>/zzim.me?currentPage=<%= currentPage - 1 %>'">&lt;</button>
                       <% } %>
                    
                       <!--  페이징바에서 숫자를 담당 -->
                        <% for(int i = startPage; i <= endPage; i++) {%>
                           <!-- 버튼이 눌렸을 때 해당 페이지로 이동하게끔 -->
                           <% if(i != currentPage) { %>
                           
                           <button onclick="location.href='<%= contextPath %>/zzim.me?currentPage=<%= i %>'"><%= i %></button>
                        <% }  else {%>
                              <!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 막고싶다 -->
                              <button disabled><%= i %></button>
                           <% } %>
                        <%} %>
                        <!-- 페이지바에서 > 를 담당 -->
                        <% if(currentPage != maxPage && currentPage <= maxPage) { %>
                           <button onclick="location.href='<%= contextPath %>/zzim.me?currentPage=<%= currentPage + 1 %>'">&gt;</button>
                        <% } %>
                        
                        
                    </div>
                  </div>
                  
                  <script>
                  
                $(function() {
                   $(".hTitle").click(function() {
                        
                        var bno = $(this).parent().siblings().eq(0).text();
                            
                            // 맵핑값?bno=X
                          location.href = "<%= contextPath %>/detail.it?bno=" + bno;
                      
                   }); 
                               
                })
               
                  
                  </script>

                  <!-- 회원탈퇴 클릭시 -->
                  <div id="deleteRegister" class="myPage-delete" style="width: 500px; height: 500px; margin-left: 100px;">
                      <p style="font-weight: bold; font-size: 20px;">회원탈퇴</p>
                      <p id="myPage-delete" cols="80" rows="15" style="resize: none; font-size: 15px; margin-top: 30px;">
                          탈퇴 후 회원정보가 모두 삭제됩니다.
                          메일주소, 핸드폰 번호/기타 연락처 등 회원정보가 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
                              
                          탈퇴 후에도 작성된 게시글은 그대로 남아 있습니다.
                          각 게시판에 등록한 게시물 및 댓글은 탈퇴 후에도 남아있습니다.
                          삭제를 원하시는 게시물은 탈퇴 전 반드시 삭제하시기 바랍니다.
                          (탈퇴 후에는 게시글 임의 삭제 요청을 받지 않습니다.)
                          <br><br>
      
                          <b style="color: red;">아이디 및 데이터는 복구할 수 없으므로 회원 탈퇴 시 신중히 진행해 주시기 바랍니다. </b>
                      </p> <br>
                      <input class="checkDelete" type="checkbox" id="deletebtn"><label for="deletebtn">안내사항을 모두 확인하였으며 동의합니다.</label>
                      <button onclick="check();" float="right" class="btn btn-warning" type="submit" style= font-size: 15px; width: 100px; height: 40px; font-weight: bold;" data-toggle="modal">탈퇴하기</button>
                  </div>
              </div>
              
          </div>
      
      
          <!-- 회원탈퇴 modal -->
          <div class="modal" id="deleteForm" data-backdrop="static">
              <div class="modal-dialog">
              <div class="modal-content">
          
                  <!-- Modal Header -->
                  <div class="modal-header">
                  <h4 class="modal-title">회원탈퇴</h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>
          
                  <!-- Modal body -->
                  <div class="modal-body">
                      
                      <b style="font-size: 25px;">
                          아이디 및 데이터는 복구할 수 없습니다. <br>
                          정말 탈퇴 하시겠습니까? <br><br>
                      </b>
      
                      <!-- 본인 증명 : 비밀번호 -->
                      <form action="<%= contextPath %>/delete.me" method="post">
                          <table class="table">
                              <tr>
                                  <td>비밀번호 입력</td>
                                  <td><input type="password" name="userPwd"></td>
                              </tr>
                          </table>
      
                          <br>
      
                          <button type="submit" class="btn btn-danger btn-sm" style="float:right;" >탈퇴하기</button>
      
                      </form>
      
      
                  </div>
      
              </div>
              </div>
          </div>
       
       <%@ include file="../common/footer.jsp" %> 
       
       </div>

    

    <script>
        $("#content_2 li, #li-update>p").on("click",function(e) {

            // var getclass = $(this).attr("class");

            if($(this).hasClass("update1")) {

                if($(".myPage-update1").css("display") == "none") {
                    $(".myPage-update1").css("display", "block");
                    $(".contet_3-1").css("display", "block");
                    $(".myPage-update2").css("display", "none");
                    $(".myPage-jjim").css("display", "none");
                    $(".myPage-bookList").css("display", "none");
                    $(".myPage-delete").css("display", "none");
                    

                } 

            } else if($(this).hasClass("update2")) {

                if($(".myPage-update2").css("display") == "none") {
                    $(".myPage-update2").css("display", "block");
                    $(".contet_3-1").css("display", "block");
                    $(".myPage-jjim").css("display", "none");
                    $(".myPage-update1").css("display", "none");
                    $(".myPage-bookList").css("display", "none");
                    $(".myPage-delete").css("display", "none");

                    console.log("update");
                } 

            } else if ($(this).hasClass("jjim")) {

                if($(".myPage-jjim").css("display") == "none") {
                    $(".myPage-jjim").css("display", "block")
                    $(".contet_3-1").css("display", "block");
                    $(".myPage-update1").css("display", "none");
                    $(".myPage-update2").css("display", "none");
                    $(".myPage-bookList").css("display", "none");
                    $(".myPage-delete").css("display", "none");
                   
                   console.log("zzim");
                }
            } else if ($(this).hasClass("bookList")) {

                if($(".myPage-bookList").css("display") == "none") {
                    $(".myPage-bookList").css("display", "block")
                    $(".contet_3-1").css("display", "block");
                    $(".myPage-jjim").css("display", "none");
                    $(".myPage-update1").css("display", "none");
                    $(".myPage-update2").css("display", "none");
                    $(".myPage-delete").css("display", "none");

                } else {
                    
                }
            } else if ($(this).hasClass("delete")) {

                if($(".myPage-delete").css("display") == "none") {
                    $(".myPage-delete").css("display", "block")
                    $(".myPage-jjim").css("display", "none");
                    $(".myPage-update1").css("display", "none");
                    $(".myPage-update2").css("display", "none");
                    $(".myPage-bookList").css("display", "none");
                    $(".contet_3-1").css("display", "none");
                }
            } 


        });


     
        function check() {

            if (!$(".checkDelete").is(":checked")) {
                alert("안내사항에 동의 하세요.");

            } else {
               
                $("#deleteForm").modal('show');
            }
        }
        
        

        function postCode() {

           new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    var fullAddr = "";
                    
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우

                    fullAddr = data.roadAddress;

                   } else { // 사용자가 지번 주소를 선택했을 경우(J)
   
                       fullAddr = data.roadAddress;
   
                   }

                     document.getElementById("address1").value = fullAddr; // 주소 넣기
                     
                }
            }).open({
               autoClose : true
            });

        };

        // 정규표현식
        function validateForm() {

            var userName = document.getElementById('userName').value;

            var userBirth = document.getElementById('userBirth').value;
            
            var regExp = /^[가-힣]{2,}$/;
   
            
                           
               if(!regExp.test(userName)) {
                   alert('유효한 이름을 입력해주세요.');
                   
                   document.getElementById('userName').value = "";
                   document.getElementById('userName').focus();
      
                   return false;             
               
               }
              
            if(userBirth != "") {
               
               regExp =/^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
               if(!regExp.test(userBirth)) {
                   alert('유효한 생년월일을 입력해주세요.');
                   
                   document.getElementById('userBirth').value = "";
                   document.getElementById('userBirth').focus();
      
                   return false;
               }
            }
            return true;
        };

    </script>
</body>
</html>
</body>
</html>