$(document).ready(function() {
		$(".Menu>a").click(function() {
			var submenu = $(this).next("ul");

			// submenu 부드럽게
			if (submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
	});
	/* 왼쪽 메뉴바 네비게이션 시작 */
	/*.one("click"  */
	/* 학적정보 */
	var cnt = 0;
	$(document).ready(function() {
		//$(".NaviHistory").hide();
		$("#divCall01").click(function() {
			//cnt++;
			$(".NaviHistory").show("#H");
			//$(".NaviHistory").html(">" + $("#divCall00").text() + ">" + $("#divCall01").text());
			//$(".NaviHistory").append(">" + $("#divCall00").text() + ">" + $("#divCall01").text());
			/*if (cnt > 0) {
				$(".NaviHistory").html(">" + $("#divCall00").text() + ">" + $("#divCall01").text());
			}*/
		});
	});
	cnt = 0;
	$(document).ready(function() {
		$("#divCall02").click(function() {
			cnt++;
			$(".NaviHistory").show('#H');
			$(".NaviHistory").append(">" + $("#divCall02").text());
			if (cnt > 0) {
				$(".NaviHistory").html(">" + $("#divCall00").text() + ">" + $("#divCall02").text());
			}
		});
	});
	/* 수강신청 */
	cnt = 0;
	$(document).ready(function() {
		$("#divCall04").click(function() {
			cnt++;
			$(".NaviHistory").show('#H');
			$(".NaviHistory").append(">" + $("#divCall03").text());
			if (cnt > 0) {
				$(".NaviHistory").html(">" + $("#divCall03").text() + ">" + $("#divCall04").text());
			}
		});
	});
	/* 기타 */
	cnt = 0;
	$(document).ready(function() {
		$("#divCall06").click(function() {
			cnt++;
			$(".NaviHistory").show('#H');
			$(".NaviHistory").append(">" + $("#divCall05").text());
			if (cnt > 0) {
				$(".NaviHistory").html(">" + $("#divCall05").text() + ">" + $("#divCall06").text());
			}
		});
	});
	/* 성적 정보 */
	cnt = 0;
	$(document).ready(function() {
		$("#divCall08").click(function() {
			cnt++;
			$(".NaviHistory").show('#H');
			$(".NaviHistory").append(">" + $("#divCall07").text());
			if (cnt > 0) {
				$(".NaviHistory").html(">" + $("#divCall07").text() + ">" + $("#divCall08").text());
			}
		});
	});
	cnt = 0;
	$(document).ready(function() {
		$("#divCall09").click(function() {
			cnt++;
			$(".NaviHistory").show('#H');
			$(".NaviHistory").append(">" + $("#divCall07").text());
			if (cnt > 0) {
				$(".NaviHistory").html(">" + $("#divCall07").text() + ">" + $("#divCall09").text());
			}
		});
	});
	cnt = 0;
	$(document).ready(function() {
		$("#divCall10").click(function() {
			cnt++;
			$(".NaviHistory").show('#H');
			$(".NaviHistory").append(">" + $("#divCall07").text());
			if (cnt > 0) {
				$(".NaviHistory").html(">" + $("#divCall07").text() + ">" + $("#divCall10").text());
			}
		});
	});
	/* 등록 정보 */
	cnt = 0;
	$(document).ready(function() {
		$("#divCall12").click(function() {
			cnt++;
			$(".NaviHistory").show('#H');
			$(".NaviHistory").append(">" + $("#divCall11").text());
			if (cnt > 0) {
				$(".NaviHistory").html(">" + $("#divCall11").text() + ">" + $("#divCall12").text());
			}
		});
	});