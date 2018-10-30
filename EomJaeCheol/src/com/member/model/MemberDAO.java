package com.member.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.member.jdbc.DBConnection;


public class MemberDAO {
	
	Connection con =null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	
	//날짜 형식 변환
    public Date stringToDate(MemberBeanDTO MemberBean)
    {
        String year = MemberBean.getYear();
        String month =MemberBean.getMonth();
        String day = MemberBean.getDay();
        
        Date birthday = Date.valueOf(year+"-"+month+"-"+day);
        
        return birthday;
        
    }
	//회원정보 입력
	//public void insertMember(MemberBeanDTO MemberBean){
		public int insertMember(MemberBeanDTO MemberBean){	
		try{
			System.out.println("해쉬값아 어딧니?:"+MemberBean.getUserEmailHash());
			con = DBConnection.getConnect();
			
			// sql 작성 & 객체 생성
			sql = "insert into userdb values(?,?,?,?,?,?,?,false)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, MemberBean.getId());
			pstmt.setString(2, MemberBean.getPass());
			pstmt.setString(3, MemberBean.getName());
			//stringToDate(MemberBean);
			pstmt.setDate(4, stringToDate(MemberBean));
			String phone=MemberBean.getPhone1()+"-"+MemberBean.getPhone2()+"-"+MemberBean.getPhone3();
			pstmt.setString(5, phone);
			pstmt.setString(6, MemberBean.getEmail());
			pstmt.setString(7, MemberBean.getUserEmailHash());
			// sql 실행
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("디비 연결 실패 || 회원 가입 실패");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 해제
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return -1;
	}
	
	//로그인
	public int idCheck(String id, String pass) throws Exception{
		int check=-1;  //check=-1;
		
		try {
			con = DBConnection.getConnect();
			sql="select pass from userdb where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			//쿼리 실행
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				//아이디가 존재할때
				if(pass.equals(rs.getString("pass"))){
					//비밀번호 같다
					check=1;
				}else{
					check=0;
				}
			}else{
				//아이디가 없을때
				check=-1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//자원 해제
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		
		return check;
	}	
	
	public int updateMember(MemberBeanDTO MemberBean) throws Exception {

		int check = -1;
		try {
			con = DBConnection.getConnect();
			sql = "select pass from userdb where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, MemberBean.getId());
			rs = pstmt.executeQuery();

			// 아이디 & 비밀번호 = > 수정 1 리턴
			if (rs.next()) {
				if (MemberBean.getPass().equals(rs.getString("pass"))) {
					sql = "update userdb set pass=?,email=?,phone=? where id=?";
					pstmt = con.prepareStatement(sql);
					//pstmt.setString(1, MemberBean.getId());
					pstmt.setString(1, MemberBean.getPass());
					pstmt.setString(2, MemberBean.getEmail());
					pstmt.setString(3, MemberBean.getPhone1());
					pstmt.setString(4, MemberBean.getId());
					pstmt.executeUpdate();
					System.out.println("회원정보 수정완료");
					check = 1;
				} else {
					// 아이디, 비밀번호 x=> 0리턴
					check = 0;
				}
			} else {
				check = -1;
				// 아이디 x =>-1리턴
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return check;
	}
	
	public MemberBeanDTO getMember(String id) throws Exception{
		MemberBeanDTO mb=null;
		try {
			con = DBConnection.getConnect();
			sql="select * from userdb where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			//리턴값이 있으므로
			//System.out.println(rs);
			if(rs.next()){
				//System.out.println("test");
				String birthday = rs.getDate("brith").toString();
                String year = birthday.substring(0, 4);
                String month = birthday.substring(5, 7);
                String day = birthday.substring(8, 10);
                
				// 회원 정보를 저장
				mb=new MemberBeanDTO();  //rs가 없으면 memberbean이 필요없으므로 rs가 있을때만 
				mb.setId(rs.getString("id"));
				//System.out.println("디비 id 가뵤:"+mb.getId());
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setYear(year);
	            mb.setMonth(month);
	            mb.setDay(day);
	            mb.setPhone1(rs.getString("phone"));
				mb.setEmail(rs.getString("email"));
			}/*else{
				System.out.println("rs가 널이지?");
			}*/
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("select 구문 오류");
			e.printStackTrace();
			
		}finally {
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		//회원 정보를 리턴
		return mb;
	}
	
	public int deleteMember(String id,String pass) throws Exception{
		int check=-1;
		
		//아이디, 비밀번호 모두 같을때 , 1리턴 후 삭제
		try {
			con = DBConnection.getConnect();
			
			sql="select pass from userdb where id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(pass.equals(rs.getString("pass"))){
					//sql 삭제 처리
					sql ="delete from userdb where id =?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					
					pstmt.executeUpdate();
					System.out.println("회원 탈퇴 (삭제) 성공");
					check=1;		
				}else{
					check=0;
				}
			}else{
				check=-1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		
		
		return check;
	}
	public int joinIdCheck(String id){
		int check=0;
		
		try {
			con = DBConnection.getConnect();
			
			sql ="select * from userdb where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				// 아이디 중복
				check =1;
			}else{
				// 아이디 중복 X
				check =0;
			}
			System.out.println("아이디 중복 검사 완료 ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		
		return check;
	}
	//이메일 인증
	public String getUserEmail(String id) throws Exception {

		try {
			con = DBConnection.getConnect();
			sql="select email from userdb where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getString("email");
						//rs.getString("email");
						//rs.getString(1); // 이메일 주소 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return null; // 데이터베이스 오류
	}

	public boolean getUserEmailChecked(String id) throws Exception {
		try {
			//System.out.println("메서드test");
			con = DBConnection.getConnect();
			sql="select userEmailChecked from userdb where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getBoolean("userEmailChecked");
				//rs.getBoolean("userEmailChecked");
						//rs.getBoolean(1); // 이메일 등록 여부 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return false; // 데이터베이스 오류
	}

	

	public boolean setUserEmailChecked(String id) throws Exception {
		try {

			con = DBConnection.getConnect();
			sql="update userdb set userEmailChecked=true where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			System.out.println("이메일 등록 설정 성공");
			return true; // 이메일 등록 설정 성공
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return false; // 이메일 등록 설정 실패
	}
	public void image() throws Exception{
		try {
			//File f=new File("../../src/WebContent/img/학생사진/20123155.jpg");
			con = DBConnection.getConnect();
			
			sql="select * from image";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				byte ba[]=rs.getBytes(2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
	}
	public String Search_id(MemberBeanDTO member) throws Exception{
		String Search_id=null;
		
		try {
			//File f=new File("../../src/WebContent/img/학생사진/20123155.jpg");
			con = DBConnection.getConnect();
			
			sql="select id from userdb where name=? and phone=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			String phone=member.getPhone1()+"-"+member.getPhone2()+"-"+member.getPhone3();
			pstmt.setString(2, phone);
			/*System.out.println("디비이름"+member.getName());
			System.out.println("디비 폰"+phone);*/
			rs=pstmt.executeQuery();
			while(rs.next()){
				Search_id=rs.getString("id");
			}
			//System.out.println("찾는아이디"+Search_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return Search_id;
	}
	
	public String Search_id2(MemberBeanDTO member) throws Exception{
		String Search_id=null;
		
		try {
			//File f=new File("../../src/WebContent/img/학생사진/20123155.jpg");
			con = DBConnection.getConnect();
			
			sql="select id from userdb where name=? and email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getEmail());
			rs=pstmt.executeQuery();
			while(rs.next()){
				Search_id=rs.getString("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return Search_id;
	}
	
	public String Search_pass(MemberBeanDTO member) throws Exception{
		String Search_pass=null;
		
		try {
			//File f=new File("../../src/WebContent/img/학생사진/20123155.jpg");
			con = DBConnection.getConnect();
			
			sql="select pass from userdb where name=? and phone=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			String phone=member.getPhone1()+"-"+member.getPhone2()+"-"+member.getPhone3();
			pstmt.setString(2, phone);
			System.out.println("디비이름"+member.getName());
			System.out.println("디비 폰"+phone);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Search_pass=rs.getString("pass");
			}
			System.out.println("찾는비번"+Search_pass);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
		}
		return Search_pass;
	}
	
}
