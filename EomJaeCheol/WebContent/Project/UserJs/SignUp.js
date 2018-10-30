//숫자만
var regNumber = /^[0-9]+$/;
//이메일 체크
var regEmail=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//이름 체크
var regName=/^[가-힝]{2,}$/;
//휴대폰 체크
var regPhone1=/^0(2|1[01679])$/;
var regPhone2=/^[0-9]{3,}$/;
var regPhone3=/^[0-9]{4}$/;

	function SingCheck(){
		var Sign=document.frr;
		 
		if(Sign.id.value.length<1){
			alert("ID 중복확인을 해주세요!");
			Sign.idid.focus();
			return;
		}
		if(Sign.pass.value.length<1){
			alert("비밀번호를 입력해주세요!");
			Sign.pass.focus();
			return;
		}
		if(Sign.pass.value!=Sign.passcheck.value){
			alert("동일한 비밀번호를 입력해주세요!");
			Sign.passcheck.focus();
			return;
		}
		if(!(regName.test(Sign.name.value))){
			alert("올바른 이름을 입력해주세요!");
			Sign.name.focus();
			return;
		}
		
		if(regNumber.test(Sign.year.value)==false && Sign.year.value.length<4){
			alert("올바른 년도를 입력해주세요!");
			Sign.year.focus();
			return;
		}
		if(Sign.month.value==""){
			alert("월을 선택해주세요!");
			Sign.month.focus();
			return;
		}
		if(regNumber.test(Sign.day.value)==false && Sign.day.value.length<2){
			alert("정확한 일을 입력해주세요!");
			Sign.day.focus();
			return;
		}
		
		if(!(regPhone1.test(Sign.phone1.value))){
			alert("휴대폰 번호를 정확하게 입력해주세요!");
			Sign.phone1.focus();
			return;
		}
		if(!(regPhone2.test(Sign.phone2.value))){
			alert("번호 3자리 이상 입력해주세요!");
			Sign.phone2.focus();
			return;
		}
		if(!(regPhone3.test(Sign.phone3.value))){
			alert("번호 4자리 입력해주세요!");
			Sign.phone3.focus();
			return;
		}
		
		if(!(regEmail.test(Sign.email.value))){
			alert("올바른 이메일을 입력해주세요!");
			Sign.email.focus();
			return false;
		}
		Sign.method="post";
		Sign.action="SignUpPro.jsp";
		Sign.submit();
	}
