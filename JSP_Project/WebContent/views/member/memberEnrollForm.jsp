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

    #enroll-form table { margin : auto; }
    #enroll-form input { margin : 5px; }
</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">회원가입</h2>

        <form id="enroll-form" action="<%= contextPath %>/insert.me" method="post">

            <!-- 아이디, 비밀번호, 이름, 전화번호, 이메일주소, 주소, 취미 -->
            <table>
                <tr>
                    <td>* 아이디</td>
                    <td><input type="text" name="userId" maxlength="12" required></td>
                    <td><button type="button" onclick="idCheck();">중복확인</button></td>
                    <!-- 중복확인은 나중에!!! AJAX 기술을 배우고 나서 할거 -->
                </tr>
                <tr>
                    <td>* 비밀번호</td>
                    <td><input type="password" name="userPwd" maxlength="15" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 비밀번호 확인</td>
                    <td><input type="password" maxlength="15" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" name="userName" maxlength="6" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;전화번호</td>
                    <td><input type="text" name="phone" placeholder="- 포함해서 입력"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;이메일</td>
                    <td><input type="email" name="email"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;주소</td>
                    <td><input type="text" name="address"></td>
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

            <br><br>

            <div align="center">
                <button type="submit" disabled>회원가입</button>
                <button type="reset">초기화</button>
            </div>

            <br><br>
        </form>

    </div>
    
    <script>
    
    	function idCheck() {
    		
    		// 아이디 인풋 태그로부터 값을 뽑아와야함 => 인풋 태그 요소 자체를 먼저 뽑자
    		var $userId = $("#enroll-form input[name=userId]");
    		// name 이 userId 인 요소가 menubar.jsp 에도 있기 때문에
    		// 조금 더 디테일하게 선택해온것!
    		
    		// ajax 로 컨트롤러로 요청하기
    		$.ajax({
    			url : "idCheck.me", 
    			data : { checkId : $userId.val() },
    			success : function(result) {
    				
    				// result 경우의수 : "NNNNN", "NNNNY"
    				// 문자열 동등비교로 따지기
    				if(result == "NNNNN") { // 중복된 아이디 == 사용불가
    					
    					alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
    					
    					// 다시 입력 유도
    					$userId.focus();
    				}
    				else { // 중복되지 않은 아이디 == 사용가능
    					
    					// 알람창 => window.confirm()
    					if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")) { // 사용하겠다는 대답을 받을 경우
    						
    						// 중복 확인 전까지는 submit 버튼을 막아둘것임 (disabled)
    						$("#enroll-form button[type=submit]").removeAttr("disabled");
    						// 해당 구문이 실행되면 submit 버튼이 활성화
    						
    						// 아이디값을 이후로 못바꾸게 확정 => readonly
    						$userId.attr("readonly", true);
    					}
    					else { // 사용 안함 선택 => 다시 입력
    						
    						$userId.focus(); // 다시 입력 유도
    					}
    					
    				}
    				
    			},
    			error : function() {
    				console.log("아이디 중복체크용 ajax 실패");
    			}
    		});
    		
    	}
    
    </script>
    

</body>
</html>






