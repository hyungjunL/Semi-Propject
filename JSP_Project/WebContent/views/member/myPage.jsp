<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer {
        background : black;
        color : white;
        width : 1000px;
        margin : auto;
        margin-top : 50px;
    }

    #mypage-form table { margin : auto; }
    #mypage-form input { margin : 5px; }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<%
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		
		// 필수 X => "XXX" / "", 배열의 경우에는 선택 안할경우 null
		String phone = (loginUser.getPhone() == null) ? "" : loginUser.getPhone(); // 삼항연산자
		String email = (loginUser.getEmail() == null) ? "" : loginUser.getEmail();
		String address = (loginUser.getAddress() == null) ? "" : loginUser.getAddress();
		String interest = (loginUser.getInterest() == null) ? "" : loginUser.getInterest();
		// "운동, 등산, .."
	%>

    <div class="outer">

        <br>
        <h2 align="center">마이페이지</h2>

        <form id="mypage-form" action="<%= contextPath %>/update.me" method="post">

            <!-- 아이디, 이름, 전화번호, 이메일주소, 주소, 취미 -->
            <table>
                <tr>
                    <td>* 아이디</td>
                    <td><input type="text" name="userId" maxlength="12" value="<%= userId %>" readonly></td>
                    <td></td>
                    <!-- 중복확인은 나중에!!! AJAX 기술을 배우고 나서 할거 -->
                </tr>
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" name="userName" maxlength="6" value="<%= userName %>" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;전화번호</td>
                    <td><input type="text" name="phone" placeholder="- 포함해서 입력" value="<%= phone %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;이메일</td>
                    <td><input type="email" name="email" value="<%= email %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;주소</td>
                    <td><input type="text" name="address" value="<%= address %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;관심분야</td>
                    <td colspan="2">

                        <input type="checkbox" name="interest" id="sports" value="운동"><label for="sports">운동</label>
                        <input type="checkbox" name="interest" id="hiking" value="등산"><label for="hiking">등산</label>
                        <input type="checkbox" name="interest" id="fishing" value="낚시"><label for="fishing">낚시</label> 
                        
                        <br>
                        
                        <input type="checkbox" name="interest" id="cooking" value="요리"><label for="cooking">요리</label>
                        <input type="checkbox" name="interest" id="game" value="게임"><label for="game">게임</label>
                        <input type="checkbox" name="interest" id="movie" value="영화"><label for="movie">영화</label>

                    </td>
                </tr>
            </table>
            
            <script>
            	$(function() {
            		
            		var interest = "<%= interest %>";
            		
            		// 모든 체크박스가 배열에 담김
            		$("input[type=checkbox]").each(function() {
            			
            			// 순차적으로 접근한 checkbox 의 value 속성값이 interest 에 포함되어있을 경우만 체크하겠다.
            			// => checked 속성을 부여 => attr(속성명, 속성값);
            			
            			// 자바스크립트의 indexOf => 찾고자하는 문자가 없을 경우는 -1 을 리턴 == 제이쿼리의 search 메소드
            			// 제이쿼리에서 value 속성값을 리턴해주는 메소드 : val()
            			// 제이쿼리에서 현재 접근한 요소 지칭 : $(this)
            			if(interest.search($(this).val()) != -1) { // 포함되어있을 경우 => checked 속성 부여
            				
            				$(this).attr("checked", true);
            			}			
            			
            		});
            		
            	});
            </script>

            <br><br>

            <div align="center">
                <button type="submit" class="btn btn-secondary btn-sm">정보변경</button>
                <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updatePwdForm">비밀번호변경</button>
                <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
            </div>

            <br><br>

        </form>
        
    </div>

    <!-- The Modal : 회원탈퇴 -->
    <div class="modal" id="deleteForm">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">회원 탈퇴</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <b>
                        탈퇴 후 복구가 불가능합니다. <br>
                        정말로 탈퇴 하시겠습니까? <br><br>
                    </b>
                    <!-- 본인 증명 : 비밀번호 -->
                    <form action="<%= contextPath %>/delete.me" method="post">
                        <table>
                            <tr>
                                <td>비밀번호</td>
                                <td><input type="password" name="userPwd" required></td>
                            </tr>
                        </table>
                        <br>

                        <button type="submit" class="btn btn-danger btn-sm">탈퇴하기</button>
                    </form>
                </div>
        
            </div>
        </div>
    </div>

    <!-- The Modal : 비밀번호변경 -->
    <div class="modal" id="updatePwdForm">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">비밀번호 변경</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
            
                <!-- Modal body -->
                <div class="modal-body" align="center">
                    
                    <form action="<%= contextPath %>/updatePwd.me" method="post">
                        <!-- 현재 비밀번호, 변경할 비밀번호, 변경할 비밀번호 확인 (재입력) -->

                        <!-- 확실하게 주인을 판별할 수 있는 id 도 같이 넘겨야 한다. -->
                        <input type="hidden" name="userId" value="<%= userId %>">

                        <table>
                            <tr>
                                <td>현재 비밀번호</td>
                                <td><input type="password" name="userPwd" required></td>
                            </tr>
                            <tr>
                                <td>변경할 비밀번호</td>
                                <td><input type="password" name="updatePwd" required></td>
                            </tr>
                            <tr>
                                <td>변경할 비밀번호 재입력</td>
                                <td><input type="password" name="checkPwd" required></td>
                            </tr>
                        </table>

                        <br>

                        <button type="submit" class="btn btn-secondary btn-sm" onclick="return validatePwd();">비밀번호 변경</button>
                    </form>

                    <script>
                        function validatePwd() {

                            if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()) {
                                alert("비밀번호가 일치하지 않습니다.");

                                return false;
                            }
                            else {
                                return true;
                            }

                        }
                    </script>

                </div>
        
            </div>
        </div>
        </div>

</body>
</html>