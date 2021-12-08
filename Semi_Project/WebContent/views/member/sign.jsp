<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#wrap {
	 	width:1000px;
	 	height:1500px;
	 	margin:auto;
	}
    #enroll-form table {
        margin-left: 20px;
        margin-top: 20px;
    }
</style>
</head>
<body>
<div id="wrap">
<%@ include file="../common/header1.jsp" %>
<form action="enroll.me" method="post" id="enroll-form" onsubmit="return check();">
	<div id="signin1">
			<div style="float: left; width:20%; height: 100%; text-align: center;">
               <h2>기본 정보 입력</h2>
            </div>
            <div>
			    <table>
                    <tr>
                        <td>아이디</td>
                        <td width="400px" height="50px"><input type="text" id="memberId" name="memberId" placeholder="4자~12자리의 영문자, 숫자 / 특수문자는 제외" style="width: 250px;" required>
                            <button type="button" onclick="idCheck();">중복확인</button>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>패스워드</td>
                        <td><input type="password" id="memberPwd" name="memberPwd" placeholder=" 8자 이상, 20자 이하로 설정하십시오" style="width: 250px;" required></td>
                    </tr>
                    <tr>
                        <td>패스워드 확인</td>
                        <td height="50px"><input type="password" id="passCheck" placeholder=" 8자 이상, 20자 이하로 설정하십시오" style="width: 250px;" required></td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td height="50px"><input type="text" id="memberName" name="memberName" required></td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td height="50px"><input type="text" id="emailName" name="emailName" style="width: 100px;" required> @ <input type="text" name="domain" id="domain" style="width: 100px;" required>
                        <select id="selEmail" name="email">
                            <option value="1">직접입력</option>
                            <option>naver.com</option>
                            <option>gmail.com</option>
                            <option>daum.net</option>
                            <option>nate.com</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td height="50px">전화번호</td>
                        <td><select id="selPhone" name="firstPhone">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="019">019</option>
                        </select>
                    - 
                    <input type="text" name="middlePhone" style="width: 50px;" maxlength=4> - <input type="text" name="endPhone" style="width:50px;" maxlength=4></td>
                    </tr>
                    <tr>
                    	<td>생년월일</td>
                    	<td height="50px"><input type="date" name="birth" style="width:150px"></td>
                    </tr>
                </table>
            </div>
        </div>
        <hr>
           <div id="signin2">
	            <div style="float: left; width:20%; height: 100%; text-align: center;">
	                <h2>부가 정보 입력</h2>
	            </div>
                <div>
           	        <table>
                        <tr>
                            <td><input type="text" id="postcode" placeholder="우편번호" required></td>
                            <td><input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"></td>
                        </tr>
                        <tr>
                            <td><input type="text" id="address" name="address1" placeholder="주소" required></td>
                        </tr>
                        <tr>
                            <td><input type="text" id="detailAddress" name="address3" placeholder="상세주소" required></td>
                            <td><input type="text" id="extraAddress" name="address2" placeholder="참고항목"></td>
                        </tr>
                    </table>     
                </div>
            </div>
        <hr>
        <div id="signin3">
            <div style="float: left; width:20%; height: 100%; text-align: center;">
                <h2>약관 동의</h2>
            </div>
            <div style="float: left; width:80%; height: 100%;">
            	<input type="checkbox" id="checkAll" onclick="allCheck()"/><label style="font-weight: 600">모든 약관에 동의합니다.</label><br>
                <h5>필수 동의 항목</h5>
                <input type="checkbox" class="check1"/><label>오이 이용약관</label><br>
                <input type="checkbox" class="check1"/><label>오이 커뮤니티 이용약관</label><br>
                <input type="checkbox" class="check1"/><label>개인정보 수집 및 이용</label><br>
            </div>
		</div>
		<div align="center">
             	<button type="submit">회원가입</button>
                <button type="reset">초기화</button>
        </div>
</form>
</div>
<%@ include file="../common/footer.jsp" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	function check() {
		
		var memberId = document.getElementById('memberId').value;
        var memberPwd = document.getElementById('memberPwd').value;
        var passCheck = document.getElementById('passCheck').value;
        var check1 = document.getElementsByClassName('check1');
		
        // 1) 아이디검사
        // 4자~12자리의 영문자, 숫자 / 특수문자는 제외
        var regExp = /^[a-z][a-z\d]{4,12}$/;
        if(!regExp.test(memberId)) {
            alert('아이디는 4자~12자리의 영문자, 숫자 로만 이루어져야 합니다.');
            document.getElementById('memberId').value = '';
            document.getElementById('memberId').focus();
            return false;
        }

        // 2) 비밀번호 검사
        // 8자 이상, 20자 이하로 설정하십시오
        regExp = /^[a-z\d!@#$%^]{8,20}$/i;
        if(!regExp.test(memberPwd)) {
            alert('비밀번호는 8~20자리의 영문자/숫자/특수문자(!@#$%^) 로 이루어져야 합니다.');
            document.getElementById('memberPwd').value = '';
            document.getElementById('memberPwd').focus();
            return false;
        }

        if(memberPwd != passCheck) {
            alert('비밀번호가 일치하지 않습니다.')
            document.getElementById('memberPwd').value = '';
            document.getElementById('passCheck').value = '';
            document.getElementById('memberPwd').focus();
            return false;
        }

        for(var i = 0; i < check1.length; i++) {
            if(check1[i].checked == false) {
                alert('필수 동의를 체크해 주십시오');
                return false;
            }
        }

        return true;
		
	}

    function idCheck() {

        var $memberId = $("#enroll-form input[name=memberId]");
        var checkId = $memberId.val();

        $.ajax ({
            url : "idCheck.me",
            data : { checkId : checkId },
            success : function(result) {

				if(result == "NO") {
					
                    alert("이미 존재하는 아이디 입니다.");
                    $memberId.focus();
                    console.log(result);
                }

                else {
                	console.log(result);
                    if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")) {
                        $memberId.attr("disabled", true);
                    }
                    else {
                        $memberId.focus();
                    }
                }
            },
            error : function() {
                console.log("중복확인 실패");
            }

        });
        
    }

	
	$("#selEmail").change(function() {
		$("#selEmail option:selected").each(function() {
			if($(this).val() == "1") {
				$("#domain").val('');
				$("#domain").focus();
				$("#domain").removeAttr("disabled");
			}
			else {
				$("#domain").val($(this).text());
				$("#domain").attr("disabled", true);
			}
		});
	});
	
	function allCheck() {
	
	    var checkAll = document.getElementById('checkAll');
	    var check1 = document.getElementsByClassName('check1')
	
	    if(checkAll.checked == true) {
	        for(var i in check1) {
	            check1[i].checked = true;
	        }
	    }
	    else {
	        for(var i in check1) {
	            check1[i].checked = false;
	        }
	    }
	    
	}
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>



</body>
</html>