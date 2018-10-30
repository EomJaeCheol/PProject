<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생 등록 페이지(관리자)</title>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<!-- <script type="text/javascript">

function imgSize(which){
    var width = eval("document."+which+".width");
    var height = eval("document."+which+".height");
    var temp = 0; 
    var max_width= 100;   // 이미지의 최대 크기     
    
    if ( width > max_width ) {     
       height = height/(width/max_width);
       eval("document."+which+".width = max_width");     
       eval("document."+which+".height = height");
    }     
}
</script> -->

<body>
<form action="StudentEnrollmentPro.jsp" method="post" enctype="multipart/form-data">
		<table border="1">
		
			<tr>
				<th>
				관리자 학생등록(* 필수 입력사항)
				</th>
			</tr>
			<tr>
				 <th>
				*학번 : 
				<input type="text" name="StuNumber">
				</th>
			</tr>
			<tr>
				 <th>
				*소속 : 
				<input type="text" name="department">
				</th>
			</tr>
			<tr>
				 <th>
				*학년 : 
				<input type="text" name="grade">
				</th>
			</tr>
			<tr>
				 <th>
				*비밀번호 : 
				<input type="text" name="pass">
				</th>
			</tr>
			<tr>
				 <th>
				*이름 : 
				<input type="text" name="name">
				</th>
			</tr>
			<tr>
				<th>
				*학과 : 
				<input type="text" name="majorin">
				</th>
			</tr>
			<tr>
				<th>
				*주민번호(앞자리만) : 
				<input type="text" name="jumin">
				</th>
			</tr>
			<tr>
				<th>
				*성별 : 
					남<input type="radio" name="gender" value="남">
					여<input type="radio" name="gender" value="여">
				</th>
			</tr>
			<tr>
				<th>
				*휴대폰번호 : 
				<input type="text" name="phone">
				</th>
			</tr>
			<tr>
				<th>
				*이메일 주소 : 
				<input type="text" name="email">
				</th>
			</tr>
			<tr>
				<th>
				*우편번호 
			    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" name="addr" id="sample6_address">
				<input type="text" id="sample6_postcode">
				<input name="addr1" type="text" id="sample6_address2" placeholder="상세주소">
				</th>
			</tr>
			<tr>
				<th>
				*사진 등록
				<input type="file" name="file" id="Aa">
				</th>
			</tr>
		
		</table>
		<input type="submit" value="등록하기 ">
		<input type="button" value="취소" onclick='window.close()'>
</form>

</body>
<!-- <script type="text/javascript">
				imgSize("#Aa");
</script> -->
</html>