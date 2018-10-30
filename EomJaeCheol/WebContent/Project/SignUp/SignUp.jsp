<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="SignUp.css" rel="stylesheet">
<script type="text/javascript" src="../UserJs/SignUp.js"></script>
</head>
<body>
	<div id="mainDiv1">
		<div class="fDiv">
			<table class="Ftable">
				<tr>
					<h1><span>회원가입</span></h1>
				</tr>
			</table>
		</div>
	<form name="frr">
		<div id="mainDiv2">
			<h2 class="ga">가입정보입력
				<span class="ga1">(*표시 항목 필수입력)</span>
			</h2>
			<div id="userDiv">
				<h4>기본정보(필수입력)</h4>
				<table class="userTable" summary="회원정보 입력">
					<tbody>
						<!-- 아이디  -->
						<tr>
							<th scope="row">
								<label for="inputtext1">*아이디</label>
							</th>
							<td>
								<input type="text" title="아이디" name="id" id="User_id"
									class="text-id" maxlength="12">
									<input type="button" class="btu" value="중복 확인" name="idid"
								 		onclick="winopen()">
								 	<input type="hidden" name="idDup" value="idUncheck">
								 		<script type="text/javascript">
								 		
								 	   function winopen(){
								 		  var idReg = /^[A-za-z]{5,15}/g;
								 	      var fid =idReg.test(document.frr.id.value);
								 		  if (!fid) {
								 				alert("아이디는 영문자로 시작하는 5~15 영문자 또는 숫자이여야 합니다!");
								 				document.frr.id.focus();
								 				return;
								 		  }else{
								 			  var Cid=document.frr.id.value;
								 			  // 새창열기 ("이동할 위치(페이지)","창이름","창크기","옵션")
								 			  window.open("idCheck.jsp?fid="+Cid,"",'width=400,height=270,scrollbars=no');    	
								 		  }
								 	    }
								 		</script>
								<span class="text-right">영문이나 숫자 혹은 그 조합 8~12자리</span>
							</td>
						</tr>
						<!-- 비밀번호  -->
						<tr>
							<th scope="row">
								<label for="inputtext2">*비밀번호</label>
							</th>
							<td headers="th_joininput_info_password">
								<input type="password" title="비밀번호 입력"
								 	class="text-id" name="pass" maxlength="16"
								 		onkeyup="passwordLengthCheck(this)">
								<span class="text-right" style="margin-left:85px;">영문, 숫자, 특수문자 중 2가지 이상 조합 10자리 이상</span>
							</td>
						</tr>
						<!-- 비밀번호 확인 -->
						<tr>
							<th scope="row">
								<label for="inputtext3">*비밀번호 확인</label>
							</th>
							<td headers="th_joininput_info_passwordconfirm">
								<input type="password" title="비밀번호 확인 입력"
									class="text-id" name="passcheck" maxlength="16">
							</td>
						</tr>
						<!-- 이름   -->
						<tr>
							<th scope="row">
								<label for="inputtext4">*이름</label>
							</th>
							<td headers="th_joininput_info_name">
								<input type="text" title="이름" name="name" maxlength="30"
									  class="text-id">
							</td>
						</tr>
						<!-- 생년월일  -->
						<tr>
							<th scope="row">
								<label for="inputtext5">*생년월일</label>
							</th>
							<td headers="th_joininput_info_birthday">
								<input type="text" title="생년월일 년도 입력" class="text-id1" name="year" value="" maxlength="4">
									<span class="text-right">년</span>
								<select name="month" style="width: 50px; height: 30px;">
										<option value="">월</option>
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
								</select> <!-- fieldname="생년월일" validate="number" allowtype="number" required=""  -->
								<input type="text" title="생년월일 일 입력" class="text-id1" name="day" value="" maxlength="2">
									<span class="text-right">일</span>
							</td>
						</tr>
						<!-- 휴대폰  -->
						<tr>
							<th scope="row">
								<label for="inputtext5">*휴대폰</label>
							</th>
							<td headers="th_joininput_info_mobile">
								<input type="text" title="휴대폰 앞번호 입력" name="phone1" value="" maxlength="3" class="text-id1">
									<span class="text-right">-</span>
								<input type="text" title="휴대폰 중간번호 입력" name="phone2" value="" maxlength="4" class="text-id1">
									<span class="text-right">-</span>
								<input type="text" title="휴대폰 뒷번호 입력" name="phone3" value=""  maxlength="4" class="text-id1">
							</td>
					   </tr>
					   <!-- 이메일  -->
					   <tr>
					   		<th scope="row">
					   			<label for="inputtext6">*이메일</label>
					   		</th>
					   		<td headers="th_joininput_info_email">
								<input class="text-id" type="text" title="이메일 입력" name="email" maxlength="30" value="">
							</td>
					   </tr>
					</tbody>
				</table>
				<div class="check_cancle">
					<button type="button" class="Btu_Cancle" onclick="location.href='../main.jsp'">취소</button>
					<button type="button" class="Btu_Check" onclick="SingCheck()"></button>
				</div>
			</div>
		</div>
		</form>	
	</div>
</body>
</html>