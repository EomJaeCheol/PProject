$(document).ready(function(){
	  $('#infotext').mouseenter(function(){
	    $('.BoxText1').text('최초 학번이 초기 사용자 아이디 입니다.').addClass('Infotext');
	    $('.BoxText2').text('예) 대학, 대학원 모두 학적이 있는 경우 대학 학번이 초기 사용자아이디 입니다.').addClass('Subtext');
	  });
	  $('#infotext').mouseleave(function(){
	    $('.BoxText1').text('');
	    $('.BoxText2').text('');
	  });
	});
	function idChk(){
		var check1 =document.infoinfo;
		window.open('', '아이디 찾기','width=800, height=500','scrollbar=no');
		check1.action='회원수정/UseridChk.jsp';
		check1.target='아이디 찾기';
		check1.submit();
	}
	function passChk(){
		var check2 =document.infoinfo;
		window.open('', '비밀번호 찾기','width=800, height=500','scrollbar=no');
		check2.action='회원수정/UserpassChk.jsp';
		check2.target='비밀번호 찾기';
		check2.submit();
	}
	function Enrollment(){
		var check3 =document.infoinfo;
		window.open('', '학생 등록','width=800, height=700','scrollbar=no');
		check3.action='관리자/SendStudentEnrollment.jsp';
		check3.target='학생 등록';
		check3.submit();
	}
	/* ip버전 */
	//ipv6이면 6으로 통과
	/* function ipv(){
		  return -1 !=ip().indexOf(":")?6:4
		}*/
	$(document).ready(function() {
		$('#ip').val(ip());
	});