function allCheck(){
		/* <form name="fr" action="StuModifyPro.jsp" method="post"> */
		var frm = document.fr;
		
		//비밀번호
		if(frm.pass.value.length<1){
			frm.error1.value="비밀번호를 입력해주세요!";
			return;
		}
		if(frm.pass.value.length>1){
			frm.error1.value="";
			frm.Newpass1.focus();
		}
		
		//새로운 비밀번호
		if(frm.Newpass1.value.length<1){
			frm.error2.value="새로운 비밀번호를 입력해주세요!";
			frm.Newpass1.focus();
			return;
		}
		if(frm.Newpass1.value.length>1){
			//frm.error2.value="";
			frm.Newpass2.focus();
		}
		
		//새로운 비밀번호 확인
		if(frm.Newpass2.value.length<1){
			frm.error2.value="비밀번호를 입력해주세요!";
			return;
		}
		if(frm.Newpass2.value.length>1){
			frm.error2.value="";
			//frm.email.focus();
		}
		if(frm.Newpass1.value.length>1 && frm.Newpass2.value.length>1 &&
				frm.Newpass1.value!=frm.Newpass2.value){
			frm.error2.value="동일한 비밀번호를 입력해주세요!";
			return;
		}
		
		//이메일 확인
		if(frm.email.value.length<1){
			frm.error3.value="이메일 입력을 해주세요!";
			frm.email.focus();
			return;
		}
		if(frm.email.value.length>1){
			frm.error3.value="";
		}
		
		if(frm.EECheck.value==1){
			aa.style.display='none';
		}else{
			frm.error3.value="이메일 인증을 해주세요!";
			frm.email.focus();
			aa.style.display='show';
			return;
		}
		//우편번호
		
		
		frm.method="post";
		frm.action="회원수정/StuModifyPro.jsp";
		frm.submit();
	}
	



function emailCheck(){
		var check =document.fr;
		window.open('', '인증','width=400, height=400','scrollbar=no');
		check.action='회원수정/StuEmail.jsp';
		check.target='인증';
		check.submit();
	}
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